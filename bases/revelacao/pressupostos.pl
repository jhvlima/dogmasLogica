% ==============================================================================
% ARQUIVO: pressupostos.pl
% DESCRIÇÃO: Pressupostos de assentimento que ajudam a explicar por que uma
%            pessoa pode reconhecer racionalmente e pela fé uma definição dogmática.
%
% IMPORTANTE:
% - Pressupostos não tornam o dogma verdadeiro por si mesmos.
% - Eles modelam condições de inteligibilidade e assentimento.
% - A verdade objetiva do dogma permanece vinculada à Revelação e ao Magistério.
% ==============================================================================

:- discontiguous pressuposto_assentimento/4.
:- discontiguous pressuposto_essencial/2.

% pressuposto_assentimento(Id, Nivel, Papel, Proposicao).
%
% Níveis permitidos:
% - natural: pressupostos filosóficos ou racionais.
% - historico: fatos históricos mínimos.
% - revelacional: aceitação de que Deus revelou verdades.
% - eclesial: mediação da Igreja e autoridade do Magistério.

pressuposto_assentimento(
    deus_existe,
    natural,
    'Abre a possibilidade racional de uma Revelacao divina.',
    'Deus existe e pode comunicar-se com a humanidade.'
).

pressuposto_assentimento(
    jesus_existe,
    historico,
    'Situa a Revelacao crista na historia.',
    'Jesus de Nazare existiu historicamente.'
).

pressuposto_assentimento(
    revelacao_divina,
    revelacional,
    'Permite reconhecer conteudos comunicados por Deus.',
    'Deus revelou verdades para a salvacao.'
).

pressuposto_assentimento(
    escritura_normativa,
    revelacional,
    'Reconhece a Escritura como testemunho normativo da Revelacao.',
    'A Sagrada Escritura transmite verdade revelada sob inspiracao divina.'
).

pressuposto_assentimento(
    igreja_guardia_deposito,
    eclesial,
    'Explica por que a Igreja pode reconhecer, guardar e propor a Revelacao.',
    'A Igreja guarda e interpreta autenticamente o deposito da fe.'
).

pressuposto_assentimento(
    magisterio_autoritativo,
    eclesial,
    'Distingue uma conclusao privada de uma definicao dogmatica vinculante.',
    'O Magisterio pode propor de modo definitivo verdades contidas na Revelacao ou conexas a ela.'
).

% Pressupostos essenciais para o piloto.
pressuposto_essencial(trindade, deus_existe).
pressuposto_essencial(trindade, revelacao_divina).
pressuposto_essencial(trindade, escritura_normativa).
pressuposto_essencial(trindade, igreja_guardia_deposito).
pressuposto_essencial(trindade, magisterio_autoritativo).

pressuposto_essencial(maternidade_divina, deus_existe).
pressuposto_essencial(maternidade_divina, jesus_existe).
pressuposto_essencial(maternidade_divina, revelacao_divina).
pressuposto_essencial(maternidade_divina, escritura_normativa).
pressuposto_essencial(maternidade_divina, igreja_guardia_deposito).
pressuposto_essencial(maternidade_divina, magisterio_autoritativo).
