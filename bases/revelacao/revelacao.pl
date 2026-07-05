% ==============================================================================
% ARQUIVO: revelacao.pl
% DESCRIÇÃO: Verdades reveladas de base e relações de explicitação dogmática.
%
% Um dogma pode ser apresentado como explicitação de verdades reveladas mais
% elementares, sem reduzir a definição dogmática a uma dedução privada.
% ==============================================================================

:- discontiguous revelacao_base/3.
:- discontiguous dogma_explica_revelacao/4.

% revelacao_base(Id, Proposicao, TipoRevelacao).
%
% Tipos permitidos:
% - explicita: enunciada diretamente na Revelacao.
% - implicita: contida de modo implícito no deposito da fe.
% - virtual: conectada necessariamente a verdades reveladas.

revelacao_base(
    deus_unico,
    'Ha um so Deus.',
    explicita
).

revelacao_base(
    pai_filho_espirito,
    'A Revelacao nomeia Pai, Filho e Espirito Santo de modo distinto.',
    explicita
).

revelacao_base(
    verbo_e_deus,
    'O Verbo e Deus.',
    explicita
).

revelacao_base(
    verbo_encarnado,
    'O Verbo se fez carne em Jesus Cristo.',
    explicita
).

revelacao_base(
    maria_mae_do_senhor,
    'Maria e apresentada como mae do Senhor.',
    explicita
).

dogma_explica_revelacao(
    trindade,
    deus_unico,
    via_unidade_da_revelacao,
    'A Trindade conserva o monoteismo ao distinguir Pessoas sem dividir a substancia divina.'
).

dogma_explica_revelacao(
    trindade,
    pai_filho_espirito,
    via_formula_batismal,
    'A formula batismal manifesta a distincao pessoal em uma unica comunhao divina.'
).

dogma_explica_revelacao(
    trindade,
    verbo_e_deus,
    via_cristologia,
    'A divindade do Verbo integra a confessao trinitaria.'
).

dogma_explica_revelacao(
    maternidade_divina,
    verbo_encarnado,
    via_uniao_hipostatica,
    'Se o Verbo encarnado e uma unica Pessoa divina, Maria e Mae de Deus segundo a Pessoa gerada em carne.'
).

dogma_explica_revelacao(
    maternidade_divina,
    maria_mae_do_senhor,
    via_testemunho_evangelico,
    'A expressao mae do Senhor e lida pela Igreja no contexto da identidade divina de Cristo.'
).
