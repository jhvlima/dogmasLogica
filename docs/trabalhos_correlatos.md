# Mapeamento do Estado da Arte e Trabalhos Correlatos

> **Projeto**: Dogmas da Lógica (*Fides et Ratio Computatrum*)  
> **Documento**: Estado da Arte, Fundamentação Teórica e Análise Comparativa  
> **Data**: Setembro de 2026  

---

## 📋 Resumo Executivo

O projeto **Dogmas da Lógica** situa-se na interseção entre a **Teologia Computacional**, a **Teologia Analítica**, a **Metafísica Computacional** e a **Ontologia Formal**. Este documento fornece um levantamento sistemático das iniciativas acadêmicas, históricas e científicas correlatas no Brasil e no exterior, analisando seus impactos, convergências e os diferenciais inovadores desta aplicação.

---

## 1. Teologia Analítica (*Analytic Theology*)

A **Teologia Analítica** é uma disciplina consolidada nas maiores universidades globais (como Oxford, Notre Dame e Saint Andrews) que emprega os métodos da filosofia analítica, da lógica formal e da teoria dos modelos para analisar a coerência interna das doutrinas cristãs e católicas.

### Principais Autores e Contribuições

* **Timothy Pawl (University of St. Thomas, Minnesota)**
  * *Obras de referência*: *In Defense of Conciliar Christology* (Oxford University Press, 2016) e *In Defense of Extended Conciliar Christology* (OUP, 2019).
  * *Contribuição*: Formalizou em estrita lógica proposicional e modal os decretos dos 7 primeiros Concílios Ecumênicos sobre a Encarnação e as duas naturezas de Cristo. Demonstrou formalmente que as acusações de inconsistência lógica no dogma cristológico são falsas.
* **Peter van Inwagen, Brian Leftow, William Hasker & Michael Rea**
  * *Obras de referência*: *The Logical Problem of the Trinity* (Oxford Studies in Philosophy of Religion).
  * *Contribuição*: Desenvolvimento de lógicas de identidade relativa e modelos de identidade social vs. latina para provar a consistência lógica da doutrina Trinitária (Três Pessoas em uma única Substância).
* **Eleonore Stump & Alvin Plantinga**
  * *Contribuição*: Apologética rigorosa e análise formal do problema do mal, da contingência divina e dos atributos divinos escolásticos.

### Relação com o *Dogmas da Lógica*
A Teologia Analítica fornece o arcabouço teórico de que o dogma católico é auditável e logicamente consistente. O **Dogmas da Lógica** pega essas premissas e as traduz em um **sistema computacional executável em Prolog e navegável na web**.

---

## 2. Metafísica Computacional e Provadores Automáticos de Teoremas (ATP)

A **Metafísica Computacional** utiliza provadores automáticos de teoremas (ATPs) e assistentes de prova interativos (ITPs) para verificar deduções metafísicas e teológicas.

### Principais Autores e Projetos

* **Christoph Benzmüller (Freie Universität Berlin) & Bruno Woltzenlogel Paleo (TU Wien)**
  * *Projeto*: Formalização e verificação computacional da *Prova Ontológica de Gödel* para a existência de Deus.
  * *Ferramentas*: Assistentes de prova **Isabelle/HOL**, **Coq**, e provadores de ordem superior **LEO-II** e **Satallax**.
  * *Impacto*: Provaram via computador que o argumento ontológico de Gödel é logicamente válido e identificaram inconsistências sutis em premissas secundárias, abrindo caminho para a teologia computacional verificada por máquina.
* **Alexander Steen & Max Wisniewski**
  * *Contribuição*: Automação de raciocínio em lógicas modais e não-clássicas aplicadas à filosofia da religião.

### Relação com o *Dogmas da Lógica*
Enquanto o trabalho de Benzmüller e Woltzenlogel Paleo foca na verificação exaustiva de 1 argumento ontológico específico usando sistemas complexos como Isabelle/HOL, o **Dogmas da Lógica** realiza um **mapeamento enciclopédico de todo o corpo dogmático (44+ dogmas nas 8 categorias)** com motor Prolog leve e visualização interativa em grafo na web.

---

## 3. Lógica Escolástica e o Círculo de Cracóvia (*Cracow Circle*)

O movimento histórico pioneiro na união entre Lógica Matemática e Teologia Católica ocorreu na década de 1930 na Polônia.

### Principais Autores e Movimento

* **Pe. Józef Maria Bocheński, O.P. (1902–1995)**
  * Frei dominicano, lógico e filósofo. Reitor da Universidade de Friburgo. Foi um dos maiores historiadores da lógica formal no século XX.
* **Pe. Jan Salamucha (1903–1944)**
  * Padre e lógico polonês. Publicou em 1934 a histórica formalização em lógica de primeira ordem da *Primeira Via de São Tomás de Aquino* (o argumento do Primeiro Motor Imóvel).
* **Jan F. Drewnowski & Bolesław Sobociński**
  * Desenvolveram o programa metodológico para re-expressar o Tomismo na linguagem da lógica de Łukasiewicz e Frege.

### Relação com o *Dogmas da Lógica*
O **Dogmas da Lógica** dá continuidade ao programa do Círculo de Cracóvia, estendendo a axiomatização tomista e conciliar para o ambiente de software moderno, linguagens de declaração lógica (Prolog) e grafos interativos.

---

## 4. Ontologia Formal, Modelagem Conceitual e o Grupo NEMO (UFES)

No campo da Ciência da Computação, a **Ontologia Formal** estuda as categorias universais de entidades, propriedades, papéis e relações para construir modelos conceituais sem ambiguidade.

### O Grupo NEMO da UFES (*Ontology & Conceptual Modeling Research Group*)

A **UFES (Universidade Federal do Espírito Santo)** é reconhecida mundialmente como o principal centro de desenvolvimento em ontologias fundamentadas e modelagem conceitual ontológica.

* **Prof. Giancarlo Guizzardi & Pesquisadores do NEMO (João Paulo A. Almeida, Monalessa Perini, Ricardo Falbo *in memoriam*)**
  * *Criadores do **UFO** (Unified Foundational Ontology)*: Ontologia de fundação utilizada internacionalmente no ambiente acadêmico e industrial.
  * *Criadores do **OntoUML***: Linguagem de modelagem conceitual ontologicamente fundamentada.
  * *Desenvolvedores da **gUFO***: Biblioteca OWL 2 DL criada para a Web Semântica.

### Aplicação da Ontologia ao *Dogmas da Lógica*

A ontologia formal permite evoluir o projeto do nível de "grafo intuitivo" para uma **Engenharia de Conhecimento Fundamentada**:

1. **Categorização Rígida Teológica**: Distinção precisa em UFO entre *Substâncias Divinas*, *Pessoas Divinas*, *Naturezas*, *Poderes*, *Eventos Históricos* e *Dogmas Definidos*.
2. **Dependência Ontológica Explicitada**: Definição formal de como um Dogma depende ontologicamente de uma *Revelação Base* ou *Decreto Conciliar*.
3. **Padrão Web Semântica (gUFO / RDF / OWL / SPARQL)**: Possibilidade de exportar a base de dogmas para um formato legível por qualquer computador ou agente de IA no mundo.

---

## 📊 5. Matriz Comparativa Sistemática

| Dimensão / Critério | **Dogmas da Lógica** (Este Projeto) | **Teologia Analítica** (Pawl, Leftow, etc.) | **Metafísica Computacional** (Benzmüller / Gödel) | **Círculo de Cracóvia** (Bocheński / Salamucha) | **Ontologias Formais** (UFES / NEMO / gUFO) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Foco Principal** | Catalogação e prova de resiliência do Magistério Católico | Rigor filosófico na consistência de dogmas específicos | Verificação computacional de provas ontológicas isoladas | Axiomatização formal das Vias de São Tomás de Aquino | Estruturação ontológica rigorosa e semântica de domínios |
| **Tecnologia / Motor** | Prolog + D3.js + Obsidian Graph View | Papel / Artigos de Filosofia Analítica | Isabelle/HOL, Coq, LEO-II, Nitpick | Lógica de Primeira Ordem / Papel | OntoUML, UFO, gUFO, OWL, SPARQL |
| **Escopo de Dogmas** | **Completo (44+ dogmas em 8 categorias)** | Tópicos selecionados (Trindade, Encarnação) | 1-2 provas ontológicas (Gödel, Anselmo) | Provas metafísicas de Deus | Estrutura ontológica genérica / domínio flexível |
| **Tratamento de Heresias** | **Sim (Análise explicita de 15+ heresias)** | Sim (foco apologético) | Não | Não | Não (foco na estrutura conceitual) |
| **Interface de Usuário** | **Web Interativa Premium (Papel Mosteiro/Verde)** | Publicações acadêmicas | Terminal / IDEs de assistentes de prova | Publicações em revistas de lógica | Ferramentas CASE / Protégé / Visualizers |

---

## 🚀 6. Roadmap de Evolução Científica para o Projeto

Com base no estado da arte levantado, recomendam-se os seguintes passos estratégicos para o desenvolvimento futuro do **Dogmas da Lógica**:

1. **Modelagem do Domínio em OntoUML**:
   * Elaborar o diagrama conceitual em OntoUML detalhando as categorias do projeto (`Dogma`, `PressupostoEpistemico`, `VerdadeRevelada`, `Heresia`, `FonteMagisterial`).
2. **Exportação Semântica para gUFO/RDF**:
   * Converter os dados dos dogmas JSON para o formato **OWL 2 DL (gUFO)**, permitindo consultas SPARQL públicas.
3. **Artigo Acadêmico e Submissão**:
   * Redigir artigo científico em parceria com o **NEMO/UFES** para submissão a conferências como **FOIS** (*Formal Ontology in Information Systems*) ou **JOWO** (*Joint Ontology Workshops*).
