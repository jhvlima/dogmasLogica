# Summa Theologiae (I, q. 2) — São Tomás de Aquino: As Cinco Vias

> **Obra**: *Summa Theologiae*, Prima Pars, Questão 2, Artigo 3  
> **Autor**: São Tomás de Aquino, O.P. (1225 – 1274 d.C.)  
> **Relevância para o Projeto**: As 5 vias dedutivas fundamentais para a demonstração racional da existência de Deus (*Prima Via* a *Quinta Via*).

---

## ✦ Questão 2, Artigo 3: Se Deus Existe?

> *"Respondeo dicendum quod Deum esse quinque viis probari potest."*  
> (Respondo dizendo que a existência de Deus pode ser provada por **cinco vias**).

---

### 1. A Primeira Via: O Argumento do Movimento (*Prima Via*)

* **Base**: Constatação empírica do movimento e da mudança no mundo sensível.
* **Premissa 1**: Tudo o que se move é movido por outro (*Omne quod movetur ab alio movetur*).
* **Premissa 2**: Uma coisa não pode estar simultaneamente em ato e em potência sob o mesmo aspecto.
* **Premissa 3**: Não é possível avançar ao infinito na série de motores movidos, pois assim não haveria um primeiro motor e, consequentemente, nenhum outro movimento.
* **Conclusão**: Logo, é necessário chegar a um **Primeiro Motor Imóvel**, ao qual todos chamam Deus.

---

### 2. A Segunda Via: A Causa Eficiente (*Secunda Via*)

* **Base**: A ordem das causas eficientes no mundo sensível.
* **Premissa 1**: Nada pode ser causa eficiente de si mesmo, pois teria de ser anterior a si mesmo, o que é impossível.
* **Premissa 2**: Não é possível proceder ao infinito nas causas eficientes ordenadas.
* **Conclusão**: Logo, é necessário admitir uma **Primeira Causa Eficiente Não Causada**, à qual todos dão o nome de Deus.

---

### 3. A Terceira Via: O Possível e o Necessário (*Tertia Via*)

* **Base**: A contingência dos seres que nascem e se corrompem.
* **Premissa 1**: Coisas contingentes podem existir ou não existir.
* **Premissa 2**: Se tudo fosse contingente, em algum momento nada teria existido no tempo.
* **Premissa 3**: Se nada tivesse existido, nada poderia ter começado a existir.
* **Conclusão**: Logo, nem todos os seres são contingentes; deve haver um **Ser Necessário por Si Mesmo**, que causa a necessidade dos outros, ao qual chamamos Deus.

---

### 4. A Quarta Via: Os Graus de Perfeição (*Quarta Via*)

* **Base**: Encontra-se nas coisas mais ou menos bondade, verdade, nobreza e perfeição.
* **Premissa 1**: O "mais" ou "menos" se diz de coisas diversas segundo sua aproximação de um máximo (ex: o mais quente aproxima-se do que é máximo em calor).
* **Premissa 2**: O que é máximo em um gênero é causa de tudo o que pertence a esse gênero.
* **Conclusão**: Logo, há algo que é para todos os seres a causa do ser, da bondade e de qualquer perfeição: o **Ser Máximo e Perfeito**, a que chamamos Deus.

---

### 5. A Quinta Via: A Finalidade das Coisas (*Quinta Via / Argumento Teleológico*)

* **Base**: O governo das coisas e a ordem observada na natureza.
* **Premissa 1**: Coisas que carecem de conhecimento (como corpos naturais) operam por um fim para alcançar o melhor resultado.
* **Premissa 2**: Aquilo que não tem conhecimento não tende a um fim a menos que seja dirigido por um ser inteligente (como a flecha pelo arqueiro).
* **Conclusão**: Logo, existe um **Ser Inteligente pelo qual todas as coisas naturais são ordenadas ao seu fim**, ao qual chamamos Deus.

---

## ✦ Formalização das Vias em Regras Lógicas (Prolog)

```prolog
% Modelo da Primeira Via (Motor Imóvel)
movido_por(X, Y) :- causa_movimento(Y, X).

primeiro_motor(M) :-
    causa_movimento(M, _),
    not(causa_movimento(_, M)).

deus(M) :- primeiro_motor(M).

% Modelo da Segunda Via (Causa Eficiente)
primeira_causa(C) :-
    causa_eficiente(C, _),
    not(causa_eficiente(_, C)).

deus(C) :- primeira_causa(C).
```
