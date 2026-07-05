% ==============================================================================
% ARQUIVO: definicoes_dogmaticas.pl
% DESCRIÇÃO: Definições dogmáticas aprovadas manualmente e ligadas a fontes.
%
% A definição dogmática é o núcleo mínimo do dogma no MVP:
% dogma + fonte magisterial aprovada + conexão com a Revelação.
% ==============================================================================

:- discontiguous definicao_dogmatica/5.

% definicao_dogmatica(DogmaId, TextoDefinicao, FonteId, Grau, ConexaoRevelacao).
%
% Graus permitidos:
% - definicao_solene
% - definitivo
% - ordinario
% - a_confirmar

definicao_dogmatica(
    trindade,
    'Um so Deus subsiste em tres Pessoas distintas: Pai, Filho e Espirito Santo.',
    mag_trindade_catecismo_232,
    definitivo,
    'Verdade contida na Revelacao e proposta pela Igreja como misterio central da fe crista.'
).

definicao_dogmatica(
    maternidade_divina,
    'Maria e verdadeiramente Mae de Deus, pois gerou segundo a carne o Verbo de Deus feito homem.',
    mag_maternidade_divina_catecismo_495,
    definitivo,
    'A definicao explicita a identidade da Pessoa de Cristo e a maternidade real de Maria em relacao ao Verbo encarnado.'
).
