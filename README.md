# Dogmas da Lógica 📜

> **Fides et Ratio Computatrum**

Este projeto utiliza a linguagem de programação lógica **Prolog** para modelar e validar a consistência interna de dogmas da fé católica. O sistema verifica se uma verdade de fé possui fundamento (passagens bíblicas, tradição e axiomas) e se as objeções lógicas conhecidas foram devidamente resolvidas (a refutação de um argumento contrário recebe uma classificação de heresia).

O objetivo principal é estudar e conhecer os dogmas da Igreja Católica, unindo esse estudo aos fundamentos da Programação Lógica. Trançando árvores de decisão lógicas, o sistema destrincha um dogma para mostrar as evidências fundamentais que o sustentam, onde nas folhas dessas árvores residem verdades irrefutáveis (axiomas).

---

## 🛠️ Estrutura do Ecossistema

O projeto é desenvolvido de forma incremental e divide-se em duas frentes principais:

1. **Motor Lógico (Back-end/Prolog)**: O núcleo de processamento em Prolog que carrega as bases de conhecimento (`bases/`) e executa os validadores.
2. **Explorador Interativo (Front-end/Web)**: Interfaces interativas (como `docs/proof_browser.html` e `terminalWeb.html`) que exibem a estrutura lógica visualmente para o usuário.

O modelo atual separa três ideias: a verdade objetiva do dogma, a capacidade de assentimento a partir de pressupostos de fé/razão, e a qualidade dos dados já cadastrados. Por isso, o veredito do sistema é um estado de **modelagem** (`nao_modelado`, `definicao_magisterial_presente`, `definicao_magisterial_resistente`, etc.), não uma sentença teológica contra o dogma.

---

## 🚀 Como Começar

### Pré-requisitos
- **SWI-Prolog** instalado ([swi-prolog.org](https://www.swi-prolog.org))

### Instalação e Execução

```bash
git clone https://github.com/jhvlima/dogmaslogica.git
cd dogmaslogica
```

Para iniciar o interpretador Prolog com todas as bases carregadas:

```bash
swipl main.pl
```

Comandos básicos de exploração:
```prolog
?- analisar(trindade).           % Analisa um dogma específico
?- dogma(X, Descricao).          % Lista os dogmas cadastrados
```

---

## 📚 Documentação do Projeto

Para evitar que este README ficasse extenso, a documentação detalhada foi dividida na pasta `docs/`. Acesse os guias abaixo para se aprofundar:

- 📖 **[Visão do Autor](docs/VISAO_DO_AUTOR.md)**: As idealizações, ideias originais e anotações do autor humano deste projeto.
- 🧱 **[Arquitetura e Relações](docs/arquitetura.md)**: O design da base de dados, diagramas UML, inversão de dependência e como as tabelas de associação funcionam no modelo lógico.
- ⚙️ **[Sistema Causal e Hierarquia](docs/sistema_causal.md)**: Explicação completa dos 3 níveis: Axiomas, Fundamentos e Dogmas. Mostra como o rastreamento lógico funciona passo a passo.
- ✍️ **[Guia de Contribuição e Modelagem](docs/guia_contribuicao.md)**: Tutorial detalhado sobre como inserir novos versículos, dogmas, objeções e resoluções na base de conhecimento.
- 🚀 **[Deployment e JSON](docs/deployment.md)**: Detalhes de como o script exporta os dados do Prolog para JSON para serem consumidos pela interface Web interativa no GitHub Pages.
- 🔎 **[Magisterium API](docs/magisterium_api.md)**: Como usar a API REST do Magisterium como ferramenta auxiliar de pesquisa.
- 📅 **[Rotina do Dogma Diário](docs/rotina_dogma_diario.md)**: Fluxo de estudo, revisão humana e promoção de fontes para a base oficial.
- 🔄 **[Notas de Refatoração (v2.1)](docs/notas_refatoracao.md)**: Detalhes técnicos sobre as mais recentes atualizações e implementações no rastreador de causalidade.

---

*Que este tribunal lógico ajude a iluminar a harmonia entre a Fé e a Razão.*
