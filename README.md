# Dogmas da Lógica 📜

> Fides et Ratio Computatrum

Este projeto utiliza a linguagem de programação lógica Prolog para modelar e validar a consistência interna de dogmas da fé católica. O sistema verifica se uma verdade de fé possui fundamento bíblico e se as objeções lógicas conhecidas foram devidamente resolvidas pela doutrina.

## 🛠️ Estrutura do Ecossistema

O projeto está dividido em duas frentes principais:

1. Motor Lógico (Back-end/Prolog): O núcleo de processamento que carrega as bases de conhecimento e executa o validador.

2. (Em Desenvolvimento) Explorador Interativo (Front-end/Web): Uma interface visual (HTML/Tailwind) para exploração didática dos dogmas e laboratórios de lógica.

## 📁 Organização dos Arquivos

- main.pl: Ponto de entrada que orquestra o carregamento do sistema.

- bases/:
  - escrituras.pl: Base de dados de versículos bíblicos (Factos).
  - magisterio.pl: Definições dogmáticas, suportes e resoluções teológicas.
  - objecoes.pl: Argumentos que aparentemente contradizem a doutrina.

- motor/:
  - validador.pl: Regras lógicas para análise de consistência e diagnóstico de falhas.

- index.html: Interface web para exploração interativa.

## 🚀 Como Começar

### Pré-requisitos

Você precisará ter o SWI-Prolog instalado em sua máquina.

Windows/Linux/macOS: Baixe em swi-prolog.org.

### Instalação

Clone este repositório:

```bash
git clone https://github.com/jhvlima/dogmaslogica.git
```

Navegue até a pasta do projeto:

```bash
cd dogmaslogica
```

Intale as dependências (se houver):

```bash
sudo apt install swi-prolog
```

## 💻 Uso do Motor Lógico (Terminal)

Para iniciar o "Tribunal Lógico dos Dogmas", execute o arquivo principal:

```bash
swipl main.pl
```

Dentro do interpretador Prolog, você pode usar os seguintes comandos:

> Analisar um dogma específico:

```prolog
?- analisar(trindade).
```

> Listar dogmas cadastrados:

```prolog
?- dogma(X, Descricao).
```

### **Como funciona a validação?**

O motor lógico (motor/validador.pl) define que um dogma é sólido se:

1. Possui ao menos um suporte bíblico cadastrado em bases/escrituras.pl.

2. Não possui "falhas encontradas" — ou seja, todas as objeções em bases/objecoes.pl possuem uma resolução teológica correspondente em bases/magisterio.pl.

## ✍️ Como Contribuir (Adicionando Novos Dogmas)

Para incluir um novo dogma, siga este modelo de preenchimento nos arquivos da pasta bases/:

1. escrituras.pl: Adicione a passagem bíblica de suporte.

```Prolog
passagem(livro, capitulo, versiculo, conteudo_simbolico).
```

2. magisterio.pl: Defina o dogma e vincule-o ao suporte.

```Prolog
dogma(id_dogma, 'Nome do Dogma').
suporte(id_dogma, passagem(livro, capitulo, versiculo)).
```

3. objecoes.pl: Cadastre argumentos contrários.

```Prolog
objecao(id_dogma, passagem(livro, capitulo, versiculo), id_argumento).
```

4. magisterio.pl (Resolução): Cadastre a resposta teórica para a objeção.

```Prolog
resolucao(id_argumento, 'Explicação Teológica').
```
