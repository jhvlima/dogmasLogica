# Uso da Magisterium API

Este projeto usa a Magisterium REST API como ferramenta auxiliar de pesquisa. A API ajuda a encontrar documentos, referências, citações curtas e links públicos, mas não decide automaticamente a validade lógica ou doutrinária de um dogma.

## Endpoints usados

- Search API: `POST https://www.magisterium.com/api/v1/search`
- Chat API: `POST https://www.magisterium.com/api/v1/chat/completions`

Documentação consultada:

- Pricing: https://www.magisterium.com/developers/pricing
- Search API: https://www.magisterium.com/developers/docs/search/api-reference
- Chat API: https://www.magisterium.com/developers/docs/chat/making-first-request
- Citações no Chat: https://www.magisterium.com/developers/docs/chat/citations
- MCP pricing: https://www.magisterium.com/developers/docs/mcp/pricing
- Termos: https://www.magisterium.com/developers/terms

## Limites e escolha de integração

O plano Preview documenta 100 requests por dia para Search e 100 requests por dia para Chat. O limite operacional deste projeto é mais conservador: **50 requests por dia**.

MCP e A2A ficam fora da primeira versão porque a documentação informa que contas gratuitas não podem fazer tool calls nesses protocolos. A integração planejada usa apenas REST.

## Autenticação

Configure a chave fora do repositório:

```bash
export MAGISTERIUM_API_KEY=<sua-chave>
```

Não commite `.env`, chaves, ledger local ou cache bruto. O `.gitignore` já ignora `.env`, `.magisterium_ledger.json` e `research/cache/`.

## Pesquisa local

Dry-run, sem chamar a API:

```bash
scripts/magisterium_research.py trindade --dry-run
```

Pesquisa real usando Search API:

```bash
scripts/magisterium_research.py trindade \
  --query "Trinity Catechism Catholic Church" \
  --query "Council of Nicaea Trinity consubstantial"
```

Pesquisa com síntese citada via Chat API:

```bash
scripts/magisterium_research.py trindade --chat
```

O script gera candidatos em `research/candidates/`. Esses arquivos são material de estudo e revisão; não entram automaticamente na base oficial.

## Promoção manual para Prolog

Após revisar uma fonte candidata, registre manualmente:

```prolog
fonte_magisterial(FonteId, Titulo, Autor, Ano, Referencia, UrlPublica).
dogma_fonte(DogmaId, FonteId, Papel, Nota).
citacao_fonte(FonteId, Referencia, TextoCurto).
status_revisao(FonteId, aprovado_manual).
```

Somente fontes com `status_revisao(FonteId, aprovado_manual)` são exportadas para `docs/proofs/*.json`.

## Política de uso

- A API é assistente de pesquisa, não autoridade automática.
- Toda citação deve ser curta, referenciada e acompanhada de link público quando disponível.
- Saídas da API alteradas ou resumidas devem ser tratadas como elaboração do projeto, não como transcrição original do Magisterium.
- O autor humano aprova cada fonte antes de ela aparecer no explorador público.
