% ==============================================================================
% ARQUIVO: hipoteses.pl
% DESCRIÇÃO: Suposições e interpretações pessoais com fundamentos bíblicos.
% ==============================================================================

% Estrutura: hipotese(ID, Descricao, ReferenciaBiblica).

% Exemplo: Suposição sobre a relação entre o 6º mandamento e a ecologia do corpo
hipotese(ecologia_corpo,
'O corpo humano tem uma linguagem natural que deve ser respeitada como uma ecologia divina.',
passagem(genesis, 1, 27, homem_mulher_criou)).

% Exemplo: Suposição sobre a primazia da caridade na interpretação da lei
hipotese(primado_caridade,
'Qualquer interpretacao moral deve ser subordinada ao mandamento do amor.',
passagem(joao, 13, 34, novo_mandamento)).

% --- Controle de Ativação ---
% Use este predicado para decidir quais suposições você quer validar no momento.
ativa(ecologia_corpo).
ativa(primado_caridade).