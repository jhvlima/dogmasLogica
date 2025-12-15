% --- Fatos (Base de Conhecimento) ---

% Jesus possui a natureza divina.
possui_natureza(jesus, divina).

% Maria é mãe de Jesus.
mae_de(maria, jesus).

% --- Regras (Inferência Lógica) ---

% Uma pessoa é Deus se ela possui a natureza divina.
eh_deus(Pessoa) :-
    possui_natureza(Pessoa, divina).

% X é mãe de Deus se X é mãe de um Filho, e esse Filho é Deus.
mae_de_deus(X) :-
    mae_de(X, Filho),
    eh_deus(Filho).


% --- FACTOS ---
pessoa(jesus).
é_divino(jesus).
natureza(divina).
natureza(humana).

possui_natureza(jesus, divina).
possui_natureza(jesus, humana).

propriedade(divina, eterno).
propriedade(humana, mortal).

% --- REGRAS ---
% Atribuição de ações à única Pessoa de Jesus
pode_fazer(jesus, Ação) :-
    possui_natureza(jesus, Natureza),
    ação_possível(Natureza, Ação).

ação_possível(divina, perdoar_pecados).
ação_possível(humana, sofrer_na_cruz).
