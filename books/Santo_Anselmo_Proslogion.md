# Proslogion — Santo Anselmo de Cantuária

> **Título Original**: *Proslogion seu Fides Quaerens Intellectum* (A Fé que Procura a Compreensão)  
> **Autor**: Santo Anselmo de Cantuária (1033 – 1109 d.C.)  
> **Relevância para o Projeto**: Texto fundador da demonstração ontológico-dedutiva da existência de Deus.

---

## ✦ Prefácio do Autor

Após ter publicado uma obra exemplar sobre a razão da fé (*Monologion*), considerando que esta tinha sido composta através do encadeamento de muitos argumentos, comecei a perguntar a mim mesmo se não seria possível encontrar um único argumento que não necessitasse de nenhum outro para além de si mesmo para se provar, e que fosse suficiente para demonstrar que Deus existe verdadeiramente...

---

## ✦ Capítulo II: Que Deus Verdadeiramente Existe

> *"Ergo, Domine, qui das fidei intellectum, da mihi, ut, quantum scis expedire, intelligam, quia es sicut credimus, et hoc es quod credimus. Et quidem credimus te esse aliquid quo nihil maius cogitari possit."*

**Tradução**:  
Senhor, vós que dais a compreensão à fé, concedei-me que compreenda, tanto quanto sabeis ser conveniente, que vós existis tal como cremos, e que sois aquilo que cremos. Ora, nós cremos que vós sois **algo do qual nada maior pode ser pensado** (*aliquid quo nihil maius cogitari possit*).

Acaso não existe tal natureza, porque "o insensato disse no seu coração: não há Deus" (Salmo 13:1)? 

Mas certamente esse mesmo insensato, ao ouvir isto mesmo que eu digo — "algo do qual nada maior pode ser pensado" —, entende o que ouve; e o que ele entende está no seu intelecto, mesmo que não entenda que isso exista na realidade. Pois uma coisa é ter um objeto no intelecto, e outra é entender que o objeto existe.

Assim, até o insensato é obrigado a confessar que existe no intelecto algo do qual nada maior pode ser pensado, porque, quando ouve isto, entende-o, e tudo o que é entendido está no intelecto.

E certamente aquilo do qual nada maior pode ser pensado não pode existir apenas no intelecto. Pois se existisse apenas no intelecto, poder-se-ia pensar que existisse também na realidade, o que seria maior.

Se, portanto, aquilo do qual nada maior pode ser pensado existisse apenas no intelecto, esse mesmo objeto do qual nada maior pode ser pensado seria algo do qual se pode pensar algo maior; o que é manifestamente impossível e contraditório.

Logo, **existe sem dúvida algo do qual nada maior pode ser pensado, tanto no intelecto quanto na realidade.**

---

## ✦ Capítulo III: Que Deus Não Pode Ser Pensado Como Não Existente

Aquilo que é tão verdadeiro que nem sequer pode ser pensado como não existente existe de modo mais pleno do que aquilo que pode ser pensado como não existente. 

Se, pois, aquilo do qual nada maior pode ser pensado pode ser pensado como não existente, esse mesmo objeto não seria aquilo do qual nada maior pode ser pensado; o que é uma contradição insustentável.

Logo, existe tão verdadeiramente algo do qual nada maior pode ser pensado, que **nem sequer pode ser pensado como não existente**. E este ser sois vós, Senhor nosso Deus.

---

## ✦ Estrutura Lógica do Argumento Anselmiano (Prolog Schema)

```prolog
% Definição do Conceito de Deus (Axioma de Anselmo)
conceito_deus(conceito('Aquele do qual nada maior pode ser pensado')).

% Premissa 1: Entendimento do Conceito
no_intelecto(god_concept).

% Premissa 2: Existir na realidade é maior que existir apenas no intelecto
maior_que(existencia_real_e_intelecto, existencia_apenas_intelecto).

% Conclusão Dedutiva por Reductio ad Absurdum:
% Se Deus existisse apenas no intelecto, poderíamos conceber um ser maior (existente na realidade).
% Isso contradiria a definição de Deus como "o ser do qual nada maior pode ser pensado".
% Logo, Deus existe na realidade.
existencia_real(deus) :- 
    no_intelecto(god_concept),
    not(apenas_intelecto(god_concept)).
```
