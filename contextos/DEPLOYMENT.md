# Dogmas da Lógica — Visualizador de Árvores de Decisão

## Visão Geral

Este projeto implementa um **sistema de exploração de dogmas católicos** através de árvores de decisão geradas automaticamente em Prolog. O sistema permite aos usuários:

1. **Selecionar um dogma** de uma lista completa
2. **Visualizar a árvore de decisão** interativa mostrando:
   - Fundamentos bíblicos (suportes)
   - Objeções teológicas
   - Resoluções (explicações para os conflitos aparentes)
   - Veredito final (sólido, sem fundamento, ou objeção não resolvida)
3. **Compreender o raciocínio lógico** por trás de cada dogma

## Arquitetura

### Backend (Prolog)

- **`main.pl`** — Ponto de entrada que carrega todas as bases e módulos
- **`bases/escrituras.pl`** — Fatos sobre versículos bíblicos
- **`bases/magisterio.pl`** — Definições de dogmas e suas resoluções
- **`bases/objecoes.pl`** — Argumentos que aparentemente contradizem os dogmas
- **`motor/validador.pl`** — Lógica de validação (verifica se um dogma é sólido)
- **`motor/tracador.pl`** — **Novo**: Traça a árvore de decisão e exporta para JSON

### Build & Deploy

- **`scripts/export_proofs.pl`** — Script que gera JSONs em `docs/proofs/{dogma_id}.json` e `docs/proofs/index.json`
- **`.github/workflows/export-and-deploy.yml`** — GitHub Actions que executa o export automaticamente a cada push
- **`docs/proof_browser.html`** — Interface web estática que lista e visualiza os dogmas

## Como Usar

### Localmente

#### 1. Gerar JSONs (Backend)

```bash
swipl -s scripts/export_proofs.pl
```

Isso criará arquivos em `docs/proofs/`.

#### 2. Abrir a interface web

Abra [docs/proof_browser.html](docs/proof_browser.html) no navegador. Você verá:

- **Painel esquerdo**: Lista de dogmas (com busca)
- **Painel direito**:
  - Tabs: "Árvore Visual (D3)" e "Resumo Textual"
  - Código de cores dos nós:
    - Marrom escuro: Dogma raiz / Veredito
    - Verde: Suportes
    - Vermelho: Objeções
    - Verde claro: Resoluções

### Via GitHub Pages

Após fazer push para `main`:

1. GitHub Actions executa `swipl -s scripts/export_proofs.pl`
2. JSONs são gerados e commitados em `docs/proofs/`
3. Seu site estará disponível em: `https://<usuario>.github.io/<repo>/docs/proof_browser.html`

## Por Que JSON?

Essa é a arquitetura chave do projeto:

```
Código Prolog (verdade lógica)
    ↓
Script SWI-Prolog (export_proofs.pl)
    ↓
JSONs estáticos (docs/proofs/*.json)
    ↓
HTML estático + JavaScript (proof_browser.html)
    ↓
GitHub Pages (hospedagem gratuita)
```

**A razão de usar JSON:**

| Motivo | Benefício |
|--------|-----------|
| **Agnóstico** | Qualquer linguagem/frontend pode consumir JSON. Não prende você a Prolog no cliente. |
| **GitHub Pages** | JSONs são estáticos. Nenhum servidor necessário. Gratuito para sempre. |
| **Performance** | Todo cálculo Prolog acontece **uma vez** (no build). Usuários veem resultado instantaneamente. |
| **Portabilidade** | Você pode trocar frontend (React, Vue, etc) sem tocar o Prolog. |
| **Versionamento** | JSONs no git = histórico completo de mudanças nas provas. |
| **Sem latência** | Sem HTTP roundtrips para o servidor. HTML/JS carregam tudo localmente. |

**Alternativa descartada: Tau-Prolog no navegador**
- ❌ Lento (executa Prolog no JavaScript)
- ❌ Limitações de módulos (Tau-Prolog não tem todas as librariries)
- ❌ Não consegue rastrear árvore de decisão bem
- ✅ JSONs pré-calculados = 100x mais rápido

**Fluxo completo do usuário:**

```
1. Usuário abre proof_browser.html
   ↓
2. JavaScript faz fetch('proofs/index.json')  [lista de 42 dogmas]
   ↓
3. Usuário clica em "A Santissima Trindade"
   ↓
4. JavaScript faz fetch('proofs/trindade.json')  [árvore completa]
   ↓
5. D3.js renderiza árvore interativa
   ↓
6. Usuário vê suportes/objeções/resoluções de forma visual
   [Tudo offline, sem servidor!]
```

## Estrutura JSON

Cada prova é um JSON estruturado:

```json
{
  "dogma": "trindade",
  "nome": "A Santissima Trindade",
  "suportes": [
    "passagem(joao,1,1)",
    "passagem(mateus,28,19)"
  ],
  "objecoes": [
    {
      "versiculo": "passagem(joao,14,28)",
      "argumento": "desigualdade_divina",
      "resolvida": true,
      "resolucao": {
        "texto": "Distincao entre Natureza Humana e Divina (Uniao Hipostatica)"
      }
    }
  ],
  "veredito": "solido"
}
```

## Testes

### Rodar testes

```bash
swipl -s tests/tracador_tests.pl
```

### Ou no SWI-Prolog manual

```prolog
?- consult('main.pl').
?- tracar_dogma(trindade, Veredito, Prova).
% Veredito = solido
% Prova = _{dogma:trindade, nome:..., suportes:[...], objecoes:[...], veredito:solido}
```

## Adicionando Novos Dogmas

1. **Adicione em `bases/magisterio.pl`**:
   ```prolog
   dogma(meu_dogma, 'Descrição do Dogma').
   suporte(meu_dogma, passagem(livro, cap, vers)).
   resolucao(meu_argumento, 'Explicação').
   ```

2. **Adicione em `bases/escrituras.pl`** (se não existir):
   ```prolog
   passagem(livro, capitulo, versiculo, conteudo_simbolico).
   ```

3. **Adicione em `bases/objecoes.pl`**:
   ```prolog
   objecao(meu_dogma, passagem(livro, cap, vers), meu_argumento).
   ```

4. **Regenere JSONs**:
   ```bash
   swipl -s scripts/export_proofs.pl
   ```

5. **Seu novo dogma aparecerá** em `proof_browser.html`!

## Tecnologias

- **Backend**: SWI-Prolog 8.x+
- **Frontend**: HTML + Tailwind CSS + D3.js
- **CI/CD**: GitHub Actions
- **Hospedagem**: GitHub Pages (estático)

## Próximas Melhorias

- Adicionar pesos/confiança às resoluções
- Implementar ligações entre dogmas (hierarquia)
- Melhorar visualização de resoluções complexas
- API REST para consultas dinâmicas (opcional, backend separado)

---

**Última atualização**: Fevereiro 2026
