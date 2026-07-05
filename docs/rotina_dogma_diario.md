# Rotina do Dogma Diário

O objetivo é estudar e construir um dogma por dia, com calma, sem esgotar a API e sem automatizar a aprovação doutrinária.

## 1. Escolher o dogma

Selecione um `DogmaId` existente em `bases/nucleo/magisterio_definicoes.pl`.

Exemplo:

```prolog
dogma(trindade, Nome).
```

## 2. Planejar as perguntas

Prepare de 3 a 8 consultas. Priorize documentos oficiais:

- Catecismo da Igreja Católica
- concílios ecumênicos
- constituições dogmáticas
- encíclicas ou documentos papais
- referências bíblicas usadas pelo Magistério

O objetivo principal do dia é confirmar a definição magisterial e uma fonte pública revisada. Cadeias causais, pressupostos e objeções podem ficar para ciclos posteriores.

## 3. Rodar dry-run

```bash
scripts/magisterium_research.py trindade \
  --query "Trinity Catechism Catholic Church" \
  --query "Council of Nicaea Trinity consubstantial" \
  --dry-run
```

Confira o número de requests planejado antes de chamar a API.

## 4. Pesquisar com limite diário

```bash
scripts/magisterium_research.py trindade \
  --query "Trinity Catechism Catholic Church" \
  --query "Council of Nicaea Trinity consubstantial" \
  --chat
```

O limite local padrão é 50 requests/dia. Se o ledger indicar limite excedido, pare e retome no dia seguinte.

## 5. Revisar candidatos

Leia os arquivos gerados em `research/candidates/`.

Para cada fonte, decida:

- é documento oficial ou suficientemente confiável?
- sustenta diretamente o dogma?
- possui referência verificável?
- tem link público?
- a citação é curta e fiel ao documento?

## 6. Promover fonte e definição aprovadas

Adicione apenas fontes aprovadas manualmente em `bases/nucleo/fontes_magisteriais.pl`.

Modelo:

```prolog
fonte_magisterial(mag_trindade_catecismo_232,
                  'Catecismo da Igreja Catolica',
                  'Igreja Catolica',
                  '1992',
                  '232',
                  'https://www.vatican.va/...').

dogma_fonte(trindade,
            mag_trindade_catecismo_232,
            definicao,
            'Fonte aprovada manualmente para a doutrina trinitaria.').

citacao_fonte(mag_trindade_catecismo_232,
              '232',
              'Trecho curto aprovado manualmente.').

status_revisao(mag_trindade_catecismo_232, aprovado_manual).
```

Depois registre a definição em `bases/nucleo/definicoes_dogmaticas.pl`:

```prolog
definicao_dogmatica(trindade,
                    'Um so Deus subsiste em tres Pessoas distintas: Pai, Filho e Espirito Santo.',
                    mag_trindade_catecismo_232,
                    definitivo,
                    'Verdade contida na Revelacao e proposta pela Igreja.').
```

Pressupostos de assentimento e revelações base são úteis para explicar o caminho de inteligibilidade, mas não bloqueiam a construção diária.

## 7. Validar e exportar

```bash
swipl -s tests/tracador_tests.pl
swipl -s scripts/export_proofs.pl
```

Abra `docs/proof_browser.html` e confira se o dogma mostra as referências aprovadas.

## Regra de ouro

A API ajuda a encontrar caminhos de estudo. A base oficial nasce somente depois da sua leitura, decisão e revisão manual.
