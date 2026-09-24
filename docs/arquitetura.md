# Arquitetura do Modelo Dogmático

O projeto usa Prolog como base canônica para estudar dogmas católicos com rastreabilidade lógica e documental. A arquitetura atual evita tratar o dogma como simples dedução privada a partir de versículos ou axiomas: o núcleo mínimo é **dogma + definição magisterial + fonte aprovada**.

## Princípios

- **Dogma objetivo**: a verdade dogmática não depende do estado do banco de dados.
- **Qualidade de modelagem**: o veredito do sistema indica se o projeto já modelou bem aquele dogma.
- **Magistério como núcleo**: a definição dogmática aprovada é o primeiro dado obrigatório no MVP.
- **Escritura e Tradição como sustentação**: passagens bíblicas, concílios e documentos entram como apoios rastreáveis.
- **Pressupostos de assentimento**: explicam condições de inteligibilidade para crer, sem “causar” a verdade do dogma.
- **Revelações base**: permitem mostrar como um dogma explicita verdades reveladas mais elementares.

## Camadas Canônicas

### 1. Dogmas e significado

Arquivo principal: `bases/nucleo/magisterio_definicoes.pl`

```prolog
dogma(DogmaId, NomeLegivel).
significado(DogmaId, Texto).
```

Esses predicados identificam o dogma e dão uma explicação inicial para o estudo.

### 2. Fontes magisteriais aprovadas

Arquivo principal: `bases/nucleo/fontes_magisteriais.pl`

```prolog
fonte_magisterial(FonteId, Titulo, Autor, Ano, Referencia, UrlPublica).
dogma_fonte(DogmaId, FonteId, Papel, Nota).
citacao_fonte(FonteId, Referencia, TextoCurto).
status_revisao(FonteId, aprovado_manual).
```

Somente fontes com `aprovado_manual` entram no JSON público.

### 3. Definição dogmática

Arquivo principal: `bases/nucleo/definicoes_dogmaticas.pl`

```prolog
definicao_dogmatica(DogmaId, TextoDefinicao, FonteId, Grau, ConexaoRevelacao).
```

Graus aceitos:

- `definicao_solene`
- `definitivo`
- `ordinario`
- `a_confirmar`

Essa camada é o novo critério mínimo para considerar um dogma modelado.

### 4. Pressupostos de assentimento

Arquivo principal: `bases/revelacao/pressupostos.pl`

```prolog
pressuposto_assentimento(Id, Nivel, Papel, Proposicao).
pressuposto_essencial(DogmaId, PressupostoId).
```

Níveis aceitos:

- `natural`: razões filosóficas ou epistemológicas.
- `historico`: fatos históricos mínimos.
- `revelacional`: aceitação de Revelação divina.
- `eclesial`: mediação da Igreja e autoridade do Magistério.

Exemplo: `deus_existe` é natural; `magisterio_autoritativo` é eclesial.

### 5. Revelações base e explicitação

Arquivo principal: `bases/revelacao/revelacao.pl`

```prolog
revelacao_base(Id, Proposicao, TipoRevelacao).
dogma_explica_revelacao(DogmaId, RevelacaoId, Modo, Nota).
```

Tipos aceitos:

- `explicita`
- `implicita`
- `virtual`

Essa camada mostra que um dogma pode explicitar verdades reveladas, sem reduzir sua autoridade a uma dedução privada.

### 6. Sustentação complementar

Arquivo principal: `bases/sustentacao/magisterio_suportes.pl`

```prolog
suporte(DogmaId, passagem(Livro, Capitulo, Versiculo)).
fundamento_axiomatico(DogmaId, Texto).
suporte_documento(DogmaId, Documento).
concilio(DogmaId, NomeConcilio).
```

Suporte bíblico agora é evidência rastreável, não o único critério de validade.

### 7. Objeções e resoluções

Arquivo principal: `bases/debate/objecoes.pl`

```prolog
objecao(DogmaId, Referencia, ArgumentoId).
tipo_heresia(ArgumentoId, NomeHeresia, PeriodoHistorico).
suporte_argumento(ArgumentoId, Fonte).
resolucao(ArgumentoId, Texto).
```

Uma resolução significa resposta doutrinal cadastrada. Ela não pretende esgotar o mistério.

## Vereditos de Modelagem

O motor retorna estados sobre o banco de dados:

- `nao_modelado`: dogma sem definição dogmática aprovada.
- `incompleto`: há dados parciais, mas ainda falta definição aprovada.
- `definicao_magisterial_presente`: há definição com fonte aprovada.
- `definicao_magisterial_resistente`: há definição aprovada e objeções cadastradas estão resolvidas.
- `conflito_nos_dados`: há referência quebrada ou objeção sem resolução.

Esses estados não dizem que o dogma é falso ou verdadeiro; dizem quão bem ele foi modelado no projeto.

## Fluxo de Dados

```text
Prolog canônico
  -> scripts/export_proofs.pl
  -> data/proofs/*.json
  -> prova.html
  -> GitHub Pages
```

## Modelo Mental

```text
PRESSUPOSTOS DE ASSENTIMENTO
  ajudam a compreender e assentir

REVELAÇÕES BASE
  são explicitadas no conjunto da fé

DEFINIÇÃO MAGISTERIAL
  propõe o conteúdo como dogma

SUSTENTAÇÕES E OBJEÇÕES
  enriquecem estudo, rastreio e resistência dos dados
```
