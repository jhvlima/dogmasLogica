# Notas de Modelagem e Refatoração v2.1

## 📝 Notas de Modelagem Recentes

As bases receberam novos predicados para enriquecer a exportação JSON e permitir tanto a visualização textual quanto a visual (árvore) no explorador, além do rastreamento causal de crenças.

- Novos predicados adicionados em `bases/`:
  - `significado(DogmaId, Texto)` — descrição resumida do dogma.
  - `axioma(DogmaId, Texto)` — o fato/axioma que sustenta a consequência lógica do dogma.
  - `suporte_documento(DogmaId, Documento)` — documentos de apoio (opcional).
  - `concilio(DogmaId, NomeConcilio)` — concílios relevantes (opcional).
  - `tipo_heresia(ArgumentoId, NomeHeresia, PeriodoHistorico)` — classifica argumentos quando aplicável.
  - `suporte_argumento(ArgumentoId, Fonte)` — notas/ fontes para o argumento.

- Novo arquivo `bases/sustentacao/axiomas.pl`:
  - Define axiomas fundamentais e suas implicações lógicas
  - Liga axiomas a dogmas específicos com justificativas
  - Fornece cadeias causais completas para dogmas principais

---

## ⚙️ Refatoração v2.1: Hierarquia AXIOMAS → FUNDAMENTOS

### O que foi refatorado

Na versão 2.1, o sistema de axiomas foi completamente reestruturado para implementar uma **hierarquia de três níveis** clara e encapsulada.

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
% Nível 1: AXIOMAS/PRESSUPOSTOS FUNDAMENTAIS (sem passagens específicas nesta camada)
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

### Arquivos Principais Atualizados

**`bases/sustentacao/axiomas.pl`** (505 linhas)
- 4 axiomas fundamentais: deus_existe, biblia_verdadeira, jesus_existe, evangelhos_palavra_de_deus
- 3 fundamentos: humano_criado_em_comunhao, humano_escolheu_afastar, jesus_reconciliou_humanidade
- 13 axiomas derivados (necessidade_reconciliacao, corpo_e_alma_necessario, etc.)
- Predicados utilitários implementados:
  - `lista_axiomas/0` — Lista todos com hierarquia
  - `axioma_implica/1` — Mostra implicações diretas
  - `axioma_justifica_dogmas/1` — Dogmas que um axioma sustenta
  - `listar_fundamentos/0` — Lista fundamentos com passagens bíblicas
  - `mostrar_fundamento/1` — Detalha um fundamento específico
  - `rastrear_axiomas_fundamentos_para_dogma/1` — Mostra cadeia completa

**`motor/causalidade.pl`** (181 linhas)
- `teste_redencao/0` — Integração completa com hierarquia
- `rastrear_axiomas_fundamentos_para_dogma/1` — Mostra axiomas + fundamentos + passagens
- `consequencias_de_crer/1` — Diferencia axiomas de fundamentos
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
