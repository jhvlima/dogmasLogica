#!/usr/bin/env python3
"""Research one dogma with the Magisterium REST API.

The script creates candidate research artifacts only. Nothing produced here is
canonical until the author manually promotes it to Prolog facts.
"""

from __future__ import annotations

import argparse
import datetime as dt
import json
import os
import re
import sys
import urllib.error
import urllib.request
from pathlib import Path


SEARCH_URL = "https://www.magisterium.com/api/v1/search"
CHAT_URL = "https://www.magisterium.com/api/v1/chat/completions"
DEFAULT_DAILY_LIMIT = 50
ROOT = Path(__file__).resolve().parents[1]
LEDGER_PATH = ROOT / ".magisterium_ledger.json"
DEFAULT_OUT_DIR = ROOT / "research" / "candidates"
DEFAULT_CACHE_DIR = ROOT / "research" / "cache"


def slugify(value: str) -> str:
    value = value.lower().strip()
    value = re.sub(r"[^a-z0-9]+", "-", value)
    return value.strip("-") or "dogma"


def load_ledger() -> dict:
    if not LEDGER_PATH.exists():
        return {}
    try:
        return json.loads(LEDGER_PATH.read_text(encoding="utf-8"))
    except json.JSONDecodeError:
        raise SystemExit(f"Ledger invalido: {LEDGER_PATH}")


def save_ledger(ledger: dict) -> None:
    LEDGER_PATH.write_text(json.dumps(ledger, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def requests_used_today(ledger: dict, today: str) -> int:
    return int(ledger.get(today, {}).get("requests", 0))


def add_requests(ledger: dict, today: str, count: int) -> None:
    entry = ledger.setdefault(today, {"requests": 0})
    entry["requests"] = int(entry.get("requests", 0)) + count
    save_ledger(ledger)


def request_json(url: str, api_key: str, payload: dict) -> dict:
    body = json.dumps(payload).encode("utf-8")
    req = urllib.request.Request(
        url,
        data=body,
        headers={
            "Authorization": f"Bearer {api_key}",
            "Content-Type": "application/json",
        },
        method="POST",
    )
    try:
        with urllib.request.urlopen(req, timeout=60) as response:
            data = response.read().decode("utf-8")
            return json.loads(data)
    except urllib.error.HTTPError as exc:
        detail = exc.read().decode("utf-8", errors="replace")
        raise SystemExit(f"Erro HTTP {exc.code} em {url}: {detail}") from exc
    except urllib.error.URLError as exc:
        raise SystemExit(f"Falha de rede em {url}: {exc.reason}") from exc


def default_queries(dogma_id: str) -> list[str]:
    readable = dogma_id.replace("_", " ")
    return [
        f"{readable} Catholic dogma magisterial document",
        f"{readable} Catechism of the Catholic Church",
        f"{readable} council papal document Catholic Church",
    ]


def build_chat_prompt(dogma_id: str, queries: list[str]) -> str:
    readable = dogma_id.replace("_", " ")
    joined_queries = "; ".join(queries)
    return (
        "For a personal study database about Catholic dogmas, identify official "
        f"magisterial sources for the dogma '{readable}'. Return concise notes, "
        "short citations when available, document references, and public source URLs. "
        "Do not invent sources. Search focus: "
        f"{joined_queries}"
    )


def extract_search_items(response: dict) -> list[dict]:
    data = response.get("data", response)
    if isinstance(data, list):
        return data
    if isinstance(data, dict):
        for key in ("results", "documents", "items", "sources"):
            value = data.get(key)
            if isinstance(value, list):
                return value
    return []


def normalize_result(item: dict) -> dict:
    return {
        "id": item.get("id") or item.get("document_id") or item.get("source_id") or "",
        "title": item.get("title") or item.get("document_title") or item.get("name") or "",
        "author": item.get("author") or item.get("document_author") or "",
        "year": item.get("year") or item.get("document_year") or "",
        "reference": item.get("reference") or item.get("document_reference") or "",
        "source_url": item.get("source_url") or item.get("url") or "",
        "snippet": item.get("snippet") or item.get("text") or item.get("content") or "",
    }


def write_markdown(candidate: dict, path: Path) -> None:
    lines = [
        f"# Pesquisa Magisterium: {candidate['dogma_id']}",
        "",
        f"- Data: {candidate['date']}",
        f"- Status: {candidate['status']}",
        f"- Requests usados nesta execucao: {candidate['request_count']}",
        "",
        "## Consultas",
        "",
    ]
    lines.extend(f"- {query}" for query in candidate["queries"])
    lines.extend(["", "## Resultados Search", ""])
    for result in candidate["search_results"]:
        title = result.get("title") or result.get("id") or "Fonte sem titulo"
        lines.append(f"### {title}")
        for label, key in (
            ("Autor", "author"),
            ("Ano", "year"),
            ("Referencia", "reference"),
            ("URL", "source_url"),
        ):
            value = result.get(key)
            if value:
                lines.append(f"- {label}: {value}")
        if result.get("snippet"):
            lines.append("")
            lines.append(f"> {result['snippet']}")
        lines.append("")
    if candidate.get("chat_summary"):
        lines.extend(["## Sintese Chat", "", candidate["chat_summary"].get("content", ""), ""])
        citations = candidate["chat_summary"].get("citations", [])
        if citations:
            lines.extend(["## Citacoes", ""])
            for citation in citations:
                title = citation.get("document_title") or "Documento"
                ref = citation.get("document_reference") or ""
                url = citation.get("source_url") or ""
                lines.append(f"- {title} {ref} {url}".strip())
    path.write_text("\n".join(lines).rstrip() + "\n", encoding="utf-8")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Research one dogma with Magisterium API.")
    parser.add_argument("dogma_id", help="Dogma id, for example: trindade")
    parser.add_argument("--query", action="append", dest="queries", help="Search query. May be repeated.")
    parser.add_argument("--chat", action="store_true", help="Also request a cited synthesis from Chat API.")
    parser.add_argument("--dry-run", action="store_true", help="Print planned requests without calling the API.")
    parser.add_argument("--max-requests", type=int, default=DEFAULT_DAILY_LIMIT, help="Daily local request cap.")
    parser.add_argument("--out-dir", type=Path, default=DEFAULT_OUT_DIR, help="Candidate output directory.")
    parser.add_argument("--save-raw", action="store_true", help="Save raw API responses under ignored cache dir.")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    today = dt.date.today().isoformat()
    queries = args.queries or default_queries(args.dogma_id)
    planned_requests = len(queries) + (1 if args.chat else 0)

    ledger = load_ledger()
    used = requests_used_today(ledger, today)
    if used + planned_requests > args.max_requests:
        print(
            f"Limite diario local excedido: usados={used}, planejados={planned_requests}, "
            f"limite={args.max_requests}",
            file=sys.stderr,
        )
        return 2

    search_payloads = [
        {"query": query, "numResults": 10, "category": "magisterial"}
        for query in queries
    ]
    chat_payload = {
        "model": "magisterium-1",
        "messages": [{"role": "user", "content": build_chat_prompt(args.dogma_id, queries)}],
        "stream": False,
    }

    if args.dry_run:
        print(json.dumps({
            "dogma_id": args.dogma_id,
            "planned_requests": planned_requests,
            "search": search_payloads,
            "chat": chat_payload if args.chat else None,
        }, indent=2, ensure_ascii=False))
        return 0

    api_key = os.getenv("MAGISTERIUM_API_KEY")
    if not api_key:
        print("Defina MAGISTERIUM_API_KEY antes de chamar a API.", file=sys.stderr)
        return 1

    raw_responses = []
    normalized_results = []
    requests_made = 0
    for payload in search_payloads:
        response = request_json(SEARCH_URL, api_key, payload)
        requests_made += 1
        raw_responses.append({"endpoint": "search", "payload": payload, "response": response})
        normalized_results.extend(normalize_result(item) for item in extract_search_items(response))

    chat_summary = None
    if args.chat:
        response = request_json(CHAT_URL, api_key, chat_payload)
        requests_made += 1
        raw_responses.append({"endpoint": "chat", "payload": chat_payload, "response": response})
        choices = response.get("choices", [])
        content = ""
        if choices:
            content = choices[0].get("message", {}).get("content", "")
        chat_summary = {
            "content": content,
            "citations": response.get("citations", []),
        }

    add_requests(ledger, today, requests_made)

    stamp = dt.datetime.now().strftime("%Y%m%d-%H%M%S")
    base_name = f"{today}-{slugify(args.dogma_id)}-{stamp}"
    args.out_dir.mkdir(parents=True, exist_ok=True)
    candidate = {
        "status": "candidate",
        "dogma_id": args.dogma_id,
        "date": today,
        "request_count": requests_made,
        "queries": queries,
        "search_results": normalized_results,
        "chat_summary": chat_summary,
        "promotion_policy": "manual_review_required",
    }
    json_path = args.out_dir / f"{base_name}.json"
    md_path = args.out_dir / f"{base_name}.md"
    json_path.write_text(json.dumps(candidate, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    write_markdown(candidate, md_path)

    if args.save_raw:
        DEFAULT_CACHE_DIR.mkdir(parents=True, exist_ok=True)
        raw_path = DEFAULT_CACHE_DIR / f"{base_name}.raw.json"
        raw_path.write_text(json.dumps(raw_responses, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    print(f"Candidato JSON: {json_path}")
    print(f"Resumo Markdown: {md_path}")
    print(f"Requests usados hoje: {used + requests_made}/{args.max_requests}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
