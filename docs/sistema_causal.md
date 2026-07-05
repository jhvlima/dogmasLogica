# Sistema Causal e Hierarquia de Crenças

O projeto evoluiu para incluir um robusto **sistema de rastreamento causal**. Isso significa que as relações de sustentação foram aprofundadas para exibir exatamente o que suporta logicamente o quê. 

A arquitetura atual implementa uma hierarquia de três níveis de fundamentação de crenças:

## 🏛️ AXIOMAS → FUNDAMENTOS → DOGMAS

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

**Exemplo de um fundamento em código:**
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

Verdades de fé oficial suportadas pela cadeia completa: `AXIOMAS` → `FUNDAMENTOS` → `DOGMA`.

**Exemplo Visual: Dogma da Redenção**

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

---

## 🔎 Usando o Sistema de Rastreamento Causal no Terminal

Execute o interpretador:
```bash
swipl main.pl
```

### Comandos de Exploração Causal

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

Quando você afirma: **"Acredito que Cristo redimiu a humanidade"**, você está logicamente comprometido com uma cadeia de 6 níveis de entidades:

**NÍVEL 1: 3 AXIOMAS/PRESSUPOSTOS UNIVERSAIS** (sem passagens específicas nesta camada)
1. Deus existe (peso 10)
2. A Bíblia é verdadeira (peso 9)
3. Os Evangelhos são Palavra de Deus (peso 8)

**NÍVEL 2: 3 FUNDAMENTOS** (axiomas + passagens bíblicas específicas)
1. O ser humano foi criado em comunhão com Deus
   - Baseado em: Axioma `biblia_verdadeira`
   - Com passagens: Gênesis 1:27, Gênesis 2:8
2. O ser humano escolheu se afastar de Deus
   - Baseado em: Axioma `biblia_verdadeira`
   - Com passagens: Gênesis 3:1-6, Romanos 5:12
3. Jesus reconciliou a humanidade com Deus
   - Baseado em: Axiomas `evangelhos_palavra_de_deus` + `jesus_existe`
   - Com passagens: João 3:16, Romanos 5:10, Colossenses 1:20

**NÍVEL 3: DOGMA**
- Redenção: "Cristo redimiu e reconciliou a humanidade com Deus"
