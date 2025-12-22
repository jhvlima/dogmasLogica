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
