# Dogmas da Lógica 📜

> Fides et Ratio Computatrum

Este projeto utiliza a linguagem de programação lógica Prolog para modelar e validar a consistência interna de dogmas da fé católica. O sistema verifica se uma verdade de fé possui fundamento bíblico e se as objeções lógicas conhecidas foram devidamente resolvidas pela doutrina.

## 🛠️ Estrutura do Ecossistema

O projeto está dividido em duas frentes principais:

1. **Motor Lógico (Back-end/Prolog)**: O núcleo de processamento que carrega as bases de conhecimento e executa o validador.
2. **Explorador Interativo (Front-end/Web)** *(Em Desenvolvimento)*: Uma interface visual (HTML/Tailwind) para exploração didática dos dogmas e laboratórios de lógica.

## 📁 Organização dos Arquivos

- `main.pl` — Ponto de entrada que orquestra o carregamento do sistema
- `bases/`
  - `escrituras.pl` — Base de dados de versículos bíblicos
  - `magisterio.pl` — Definições dogmáticas e resoluções teológicas
  - `objecoes.pl` — Argumentos que aparentemente contradizem a doutrina
- `motor/`
  - `validador.pl` — Regras lógicas para análise de consistência
- `index.html` — Interface web para exploração interativa

## 🚀 Como Começar

### Pré-requisitos

- **SWI-Prolog** instalado ([swi-prolog.org](https://www.swi-prolog.org))

### Instalação

```bash
git clone https://github.com/jhvlima/dogmaslogica.git
cd dogmaslogica
sudo apt install swi-prolog  # Linux
```

## 💻 Uso do Motor Lógico (Terminal)

Inicie o interpretador:

```bash
swipl main.pl
```

### Comandos Disponíveis

```prolog
?- analisar(trindade).           % Analisar um dogma específico
?- dogma(X, Descricao).          % Listar dogmas cadastrados
```

### Como Funciona a Validação?

Um dogma é considerado sólido se:

1. Possui ao menos um suporte bíblico em `bases/escrituras.pl`
2. Todas as objeções em `bases/objecoes.pl` possuem resolução em `bases/magisterio.pl`

## ✍️ Como Contribuir

### Modelo de Preenchimento

**1. `escrituras.pl` — Adicione a passagem bíblica:**

```prolog
passagem(livro, capitulo, versiculo, conteudo_simbolico).
```

**2. `magisterio.pl` — Defina o dogma:**

```prolog
dogma(id_dogma, 'Nome do Dogma').
suporte(id_dogma, passagem(livro, capitulo, versiculo)).
```

**3. `objecoes.pl` — Cadastre argumentos contrários:**

```prolog
objecao(id_dogma, passagem(livro, capitulo, versiculo), id_argumento).
```

**4. `magisterio.pl` — Registre a resolução teológica:**

```prolog
resolucao(id_argumento, 'Explicação Teológica').
```

## 📚 Guia de Modelagem em Prolog

### Os Quatro Pilares de um Dogma

| Pilar | Arquivo | Sintaxe |
|-------|---------|---------|
| **Fato** | `magisterio.pl` | `dogma(id, 'Nome')` |
| **Suporte** | `magisterio.pl` + `escrituras.pl` | `suporte(id, passagem(...))` |
| **Objeção** | `objecoes.pl` | `objecao(id, passagem(...), id_critica)` |
| **Resolução** | `magisterio.pl` | `resolucao(id_critica, 'Texto')` |

### Exemplo: Ressurreição de Cristo

```prolog
% Suporte bíblico
passagem(mateus, 28, 6, ressuscitou_como_disse).

% Objeção comum
objecao(ressurreicao, passagem(mateus, 28, 13), roubo_do_corpo).

% Resolução teológica
resolucao(roubo_do_corpo, 'O testemunho dos mártires e as aparições confirmam a vitória sobre a morte').
```

### Lógica Deôntica (Mandamentos)

Use regras condicionais para suposições:

```prolog
eh_bom(X) :-
    cumpre_condicao_A(X),
    cumpre_condicao_B(X).
```

### Dogma vs. Suposição

- **Dogmas**: Constantes — `dogma(...)`
- **Suposições**: Variáveis — `hipotese(...)` com controle via `ativa(...)`

### Checklist de Boas Práticas

- ✓ Use minúsculas para átomos: `jesus`, `maria`, `analisar`
- ✓ Use maiúsculas para variáveis: `Pessoa`, `X`, `Dogma`
- ✓ Termine toda linha com ponto (`.`)
- ✓ Use aspas simples (`'...'`) para textos com espaços
- ✓ Para debug: `?- gtrace.` antes da consulta

### Operadores Lógicos (Referência Rápida)

| Símbolo | Significado |
|---------|-------------|
| `:-` | Porque / Depende de |
| `,` | E |
| `;` | Ou |
| `\+` | Não |
| `fail` | Contradição |

---

Que este tribunal lógico ajude a iluminar a harmonia entre a Fé e a Razão.

## 📤 Exportação JSON e Esquema de Saída

O sistema agora exporta uma representação JSON enriquecida de cada dogma em `docs/proofs/{id}.json`.

- Gerar todos os JSONs (script de exportação):

```bash
swipl -q -s main.pl -g "['scripts/export_proofs.pl'], main, halt."
```

- Exemplo de campos gerados no JSON (`docs/proofs/trindade.json`):

  - `dogma`: id do dogma (átomo/string)
  - `nome`: nome legível do dogma
  - `significado`: descrição curta (novo)
  - `sustentacao`: objeto com:
    - `biblicos`: lista de referências bíblicas (strings)
    - `axioma`: texto do axioma/fato que sustenta o dogma (novo)
    - `documentos`: lista de documentos de suporte (opcional)
    - `concilios`: lista de concílios (opcional)
  - `objecoes`: lista de objetos com:
    - `versiculo`: referência (string)
    - `argumento`: id do argumento
    - `resolvida`: boolean
    - `resolucao.texto`: texto da resolução (quando existir)
    - `tipo_heresia`: nome da heresia associada (opcional)
    - `suporte_argumento`: texto/nota sobre a fonte do argumento (opcional)
  - `veredito`: status final (`"solido"`, `"sem_fundamento"`, `"objecao_nao_resolvida"`)

O frontend em `docs/proof_browser.html` já foi atualizado para exibir `significado`, `sustentacao.axioma`, `sustentacao.documentos`/`concilios`, e os campos `tipo_heresia` e `suporte_argumento` nas objeções quando presentes.

## 🔎 Testes e Verificação

- Para gerar os JSONs e inspecioná-los localmente, execute o comando de exportação acima e abra `docs/proof_browser.html` em um navegador. Para servir localmente (recomendado):

```bash
python3 -m http.server 8000 --directory docs
# então abra http://localhost:8000/proof_browser.html
```

- Testes Prolog (unitários): veja `tests/tracador_tests.pl`. Para executar os testes via SWI-Prolog, carregue `main.pl` e então execute o arquivo de testes conforme sua configuração de testes no repositório.

## 🏛️ Hierarquia de Crenças: AXIOMAS → FUNDAMENTOS → DOGMAS

O sistema implementa uma hierarquia de três níveis de fundamentação de crenças:

### 1. AXIOMAS FUNDAMENTAIS (Auto-evidentes)

Verdades universais que não requerem justificação adicional. São os pilares lógicos sobre os quais tudo se baseia:

| Id | Descrição | Peso | Categorias |
|----|-----------|------|-----------|
| `deus_existe` | Deus existe como causa primeira | **10** | deus, ontologia |
| `biblia_verdadeira` | A Bíblia fala verdades incontestáveis | **9** | biblia, revelacao |
| `evangelhos_palavra_de_deus` | Os Evangelhos são Palavra de Deus | **8** | biblia, jesus |
| `jesus_existe` | Jesus existe historicamente | **9** | jesus, historia |

**Consultar neste nível:**
```prolog
?- lista_axiomas.  % Mostra todos os axiomas com suas propriedades
?- axioma_def(deus_existe, Desc, Cats, Peso).  % Query um axioma específico
```

### 2. FUNDAMENTOS (Axiomas + Passagens Bíblicas Específicas)

Proposições derivadas que combinam axiomas com referências bíblicas concretas. São a "ponte" entre teoria (axiomas) e prática (passagens bíblicas):

| Id | BaseAdo em Axiomas | Passagens Bíblicas | Peso |
|----|--------------------|--------------------|------|
| `humano_criado_em_comunhao` | `biblia_verdadeira` | Gênesis 1:27, Gênesis 2:8 | **8** |
| `humano_escolheu_afastar` | `biblia_verdadeira` | Gênesis 3:1-6, Romanos 5:12 | **9** |
| `jesus_reconciliou_humanidade` | `evangelhos_palavra_de_deus`, `jesus_existe` | João 3:16, Romanos 5:10, Colossenses 1:20 | **10** |

**Exemplo de um fundamento:**
```prolog
fundamento(humano_criado_em_comunhao,
           'A Bíblia declara que o ser humano foi criado em comunhão com Deus.',
           [biblia_verdadeira],              % Lista de axiomas sustentadores
           [passagem(genesis, 1, 27),        % Passagens específicas
            passagem(genesis, 2, 8)],
           [humanidade, criacao],            % Categorias
           8).                               % Peso

justifica(humano_criado_em_comunhao, redencao,
          'A redenção restaura a comunhão original que foi perdida').
```

**Consultar neste nível:**
```prolog
?- listar_fundamentos.  % Mostra todos os fundamentos
?- mostrar_fundamento(humano_criado_em_comunhao).  % Detalha um fundamento
```

### 3. DOGMAS (Proposições que derivam da hierarquia)

Verdades de fé oficial suportadas pela cadeia completa: AXIOMAS → FUNDAMENTOS → DOGMA.

**Exemplo: Dogma da Redenção**

```
AXIOMAS FUNDAMENTAIS (3):
  ├─ deus_existe
  ├─ biblia_verdadeira
  └─ evangelhos_palavra_de_deus

FUNDAMENTOS (3):
  ├─ humano_criado_em_comunhao (biblia_verdadeira + Gênesis 1:27, 2:8)
  ├─ humano_escolheu_afastar (biblia_verdadeira + Gênesis 3:1-6, Romanos 5:12)
  └─ jesus_reconciliou_humanidade (evangelhos + joão 3:16, Romanos 5:10, Col 1:20)

DOGMA:
  └─ 🔴 REDENÇÃO: "Cristo redimiu e reconciliou a humanidade com Deus"
```

Ao crer no dogma da Redenção, você está **implicitamente comprometido** com:
- 3 axiomas universais
- 3 fundamentos específicos
- 9 passagens bíblicas que os sustentam

**Consultar neste nível:**
```prolog
?- teste_redencao.  % Mostra a cadeia completa para redencao
?- rastrear_axiomas_fundamentos_para_dogma(redencao).  % Trace completo
?- consequencias_de_crer(redencao).  % Axiomas/fundamentos que você assume
```

---

## 🔎 Sistema de Rastreamento Causal

O projeto agora inclui um sistema de **rastreamento causal** que mostra como crenças em dogmas implicam logicamente em crenças em axiomas e fundamentos básicos.

### Como Usar

```bash
swipl main.pl
```

Comandos disponíveis:

```prolog
% Nível 1: AXIOMAS FUNDAMENTAIS
?- lista_axiomas.                      % Mostra todos os axiomas
?- axioma_implica(deus_existe).        % Implicações de um axioma
?- axioma_justifica_dogmas(deus_existe). % Dogmas que um axioma sustenta

% Nível 2: FUNDAMENTOS  
?- listar_fundamentos.                 % Mostra todos os fundamentos
?- mostrar_fundamento(humano_criado_em_comunhao). % Detalha um fundamento

% Nível 3: DOGMAS + RASTREAMENTO COMPLETO
?- teste_redencao.                     % Demonstração integrada completa
?- rastrear_axiomas_fundamentos_para_dogma(redencao).  % Trace axiomas→fundamentos→dogma
?- consequencias_de_crer(redencao).    % O que você assume ao crer (lista numerada)
?- arvore_causal(redencao).            % Visualiza árvore visual
?- mostrar_axiomas_do_dogma(redencao). % Lista rápida de sustentadores
```

### Exemplo: Como Crer em Redenção

Quando você afirma: **"Acredito que Cristo redimiu a humanidade"**

...você está logicamente comprometido com uma cadeia de 6 níveis de entidades:

**NÍVEL 1: 3 AXIOMAS UNIVERSAIS** (auto-evidentes, sem passagens específicas)
1. Deus existe (peso 10)
2. A Bíblia é verdadeira (peso 9)
3. Os Evangelhos são Palavra de Deus (peso 8)

**NÍVEL 2: 3 FUNDAMENTOS** (axiomas + passagens bíblicas específicas)
1. O ser humano foi criado em comunhão com Deus
   - Baseado em: Axioma "bíblia_verdadeira"
   - Com passagens: Gênesis 1:27, Gênesis 2:8
   
2. O ser humano escolheu se afastar de Deus
   - Baseado em: Axioma "bíblia_verdadeira"
   - Com passagens: Gênesis 3:1-6, Romanos 5:12
   
3. Jesus reconciliou a humanidade com Deus
   - Baseado em: Axiomas "evangelhos_palavra_de_deus" + "jesus_existe"
   - Com passagens: João 3:16, Romanos 5:10, Colossenses 1:20

**NÍVEL 3: DOGMA**
- Redenção: "Cristo redimiu e reconciliou a humanidade com Deus"

Execute isto para ver a cadeia completa:

```bash
swipl main.pl
?- teste_redencao.
```

## 📝 Notas de Modelagem (mudanças recentes)

- Novos predicados adicionados em `bases/`:
  - `significado(DogmaId, Texto)` — descrição resumida do dogma.
  - `axioma(DogmaId, Texto)` — o fato/axioma que sustenta a consequência lógica do dogma.
  - `suporte_documento(DogmaId, Documento)` — documentos de apoio (opcional).
  - `concilio(DogmaId, NomeConcilio)` — concílios relevantes (opcional).
  - `tipo_heresia(ArgumentoId, NomeHeresia)` — classifica argumentos quando aplicável.
  - `suporte_argumento(ArgumentoId, Fonte)` — notas/ fontes para o argumento.

- Novo arquivo `bases/axiomas.pl`:
  - Define axiomas fundamentais e suas implicações lógicas
  - Liga axiomas a dogmas específicos com justificativas
  - Fornece cadeias causais completas para dogmas principais

Essas extensões foram adicionadas para enriquecer a exportação JSON e permitir tanto a visualização textual quanto a visual (árvore) no explorador, além do rastreamento causal de crenças.

## ⚙️ Refatoração v2.1: Hierarquia AXIOMAS → FUNDAMENTOS

### O que foi refatorado

Na versão 2.1, o sistema de axiomas foi completamente reestruturado para implementar uma **hierarquia de três níveis** clara e encapsulada:

**Estrutura Anterior (v1.0):**
```prolog
axioma(deus_existe, 'Descrição...', [categoria]).
implicacao(deus_existe, biblia_verdadeira, 'Porque...').
axioma_sustenta_dogma(deus_existe, redencao, 'Justificativa...').
```

**Estrutura Intermediária (v2.0):**
```prolog
axioma_def(deus_existe, 'Deus existe...', [deus, ontologia], 10).
implica_em(deus_existe, [biblia_verdadeira, ...]).
justifica(deus_existe, redencao, 'Deus é a causa primeira...').
```

**Estrutura Atual (v2.1) — HIERARQUIA COM FUNDAMENTOS:**
```prolog
% Nível 1: AXIOMAS FUNDAMENTAIS (universais, auto-evidentes)
axioma_def(deus_existe, 
           'Deus existe como verdade fundamental...',
           [deus, ontologia],           % Categorias semânticas
           10).                          % Peso relativo (1-10)

implica_em(deus_existe, [biblia_verdadeira, ...]).

% Nível 2: FUNDAMENTOS (Axiomas + Passagens Bíblicas Específicas)
fundamento(humano_criado_em_comunhao,
           'A Bíblia declara que o ser humano foi criado em comunhão...',
           [biblia_verdadeira],                    % Axiomas que sustentam
           [passagem(genesis, 1, 27),              % Passagens específicas
            passagem(genesis, 2, 8)],
           [humanidade, criacao],                  % Categorias
           8).                                      % Peso

% Nível 3: LIGAÇÃO PARA DOGMAS (ambos axiomas e fundamentos)
justifica(deus_existe, redencao, 'Deus é a causa primeira...').
justifica(humano_criado_em_comunhao, redencao, 'Redenção restaura...').
```

### Arquivos Principais

**`bases/axiomas.pl`** (505 linhas)
- 4 axiomas fundamentais: deus_existe, biblia_verdadeira, jesus_existe, evangelhos_palavra_de_deus
- 3 fundamentos: humano_criado_em_comunhao, humano_escolheu_afastar, jesus_reconciliou_humanidade
- 13 axiomas derivados (necessidade_reconciliacao, corpo_e_alma_necessario, etc.)
- Predicados utilitários:
  - `lista_axiomas/0` — Lista todos com hierarquia
  - `axioma_implica/1` — Mostra implicações diretas
  - `axioma_justifica_dogmas/1` — Dogmas que um axioma sustenta
  - `listar_fundamentos/0` — Lista fundamentos com passagens bíblicas
  - `mostrar_fundamento/1` — Detalha um fundamento específico
  - `rastrear_axiomas_fundamentos_para_dogma/1` — **NOVO**: Mostra cadeia completa

**`motor/causalidade.pl`** (181 linhas) — ATUALIZADO
- `teste_redencao/0` — Integração completa com hierarquia
- `rastrear_axiomas_fundamentos_para_dogma/1` — **NOVO**: Mostra axiomas + fundamentos + passagens
- `consequencias_de_crer/1` — **ATUALIZADO**: Diferencia axiomas de fundamentos
- Predicados existentes: arvore_causal, mostrar_axiomas_do_dogma, rastrear_cadeia_axioma

### Vantagens da Nova Arquitetura

✅ **Clareza epistêmica**: Axiomas universais vs. fundamentos específicos com base textual  
✅ **Rastreabilidade**: Cada fundamento mostra quais axiomas usa e quais passagens as justificam  
✅ **Reutilização**: Um axioma pode justificar múltiplos fundamentos sem duplicação  
✅ **Extensibilidade**: Novos fundamentos se conectam automaticamente aos axiomas existentes  
✅ **Validação**: Fácil verificar se todas as passagens bíblicas estão referenciadas  

### Comandos Úteis para a Nova Estrutura

```prolog
% Explorar axiomas
?- axioma_def(Id, Desc, Cats, Peso).  % Buscar axiomas por propriedades
?- implica_em(deus_existe, L).         % Ver implicações de um axioma

% Explorar fundamentos  
?- fundamento(Id, Desc, Axiomas, Passagens, Cats, Peso).  % Buscar fundamentos
?- mostrar_fundamento(humano_criado_em_comunhao).         % Detalhar um

% Rastreamento completo
?- rastrear_axiomas_fundamentos_para_dogma(redencao).  % Cadeia AXIOMA→FUNDAMENTO→DOGMA
?- justifica(Sustentador, redencao, Justificativa).    % Todos os sustentadores

% Teste integrado
?- teste_redencao.  % Demonstração completa para o dogma da redenção
```

### Próximos Passos Recomendados

1. **Expandir fundamentos**: Adicionar mais fundamentos para outros dogmas (trindade, eucaristia, etc.)
2. **Validação de passagens**: Criar predicado que valida se passagens existem em `escrituras.pl`
3. **Frontend visual**: Atualizar `proof_browser.html` para mostrar a árvore AXIOMA→FUNDAMENTO→DOGMA
4. **CLI estendida**: Adicionar mais comandos em `main.pl` para consultar a hierarquia

---

