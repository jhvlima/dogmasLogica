% ==============================================================================
% ARQUIVO: objecoes.pl
% DESCRIÇÃO: Argumentos e versículos que aparentemente contradizem um dogma.
% FORMATO: objecao(DogmaAlvo, ReferenciaBiblica, ArgumentoLogico).
% ==============================================================================

% --- Objeções contra a Trindade ---

% Argumento: Se o Pai é maior que Jesus, eles não são iguais (Arianismo).
objecao(trindade, passagem(joao, 14, 28), desigualdade_divina).

% Argumento: Se Deus é um só, não podem ser três (Unitarianismo).
objecao(trindade, passagem(deuteronomio, 6, 4), unicidade_numerica_estrita).

% Metadados de argumentos (novos)
% tipo_heresia(ArgumentoId, NomeHeresia)
tipo_heresia(desigualdade_divina, 'Arianismo').
tipo_heresia(unicidade_numerica_estrita, 'Unitarianismo').

% suporte_argumento(ArgumentoId, Fonte)
suporte_argumento(desigualdade_divina, 'Interpretações literais de Joao 14:28 em tradições arianas').

% Adicione novas objeções abaixo...