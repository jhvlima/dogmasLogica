% ==============================================================================
% ARQUIVO: fontes_magisteriais.pl
% DESCRIÇÃO: Fontes magisteriais aprovadas manualmente para sustentar dogmas.
%
% IMPORTANTE:
% - A API do Magisterium gera apenas candidatos de pesquisa.
% - Somente registros revisados pelo autor devem receber status aprovado_manual.
% - Textos citados devem ser curtos e acompanhados de referência e URL pública.
% ==============================================================================

:- discontiguous fonte_magisterial/6.
:- discontiguous dogma_fonte/4.
:- discontiguous citacao_fonte/3.
:- discontiguous status_revisao/2.

% fonte_magisterial(FonteId, Titulo, Autor, Ano, Referencia, UrlPublica).
% dogma_fonte(DogmaId, FonteId, Papel, Nota).
% citacao_fonte(FonteId, Referencia, TextoCurto).
% status_revisao(FonteId, aprovado_manual).

fonte_magisterial(
    mag_trindade_catecismo_232,
    'Catecismo da Igreja Catolica',
    'Igreja Catolica',
    '1992',
    '232',
    'https://www.vatican.va/archive/cathechism_po/index_new/p1s2cap1_198-421_po.html'
).

dogma_fonte(
    trindade,
    mag_trindade_catecismo_232,
    definicao,
    'Fonte aprovada manualmente para introduzir a doutrina trinitaria no Catecismo.'
).

citacao_fonte(
    mag_trindade_catecismo_232,
    '232',
    'Os cristãos são batizados em nome do Pai e do Filho e do Espírito Santo.'
).

status_revisao(mag_trindade_catecismo_232, aprovado_manual).

fonte_magisterial(
    mag_maternidade_divina_catecismo_495,
    'Catecismo da Igreja Catolica',
    'Igreja Catolica',
    '1992',
    '495',
    'https://www.vatican.va/archive/cathechism_po/index_new/p1s2cap2_422-682_po.html'
).

dogma_fonte(
    maternidade_divina,
    mag_maternidade_divina_catecismo_495,
    definicao,
    'Fonte aprovada manualmente para a Maternidade Divina de Maria.'
).

citacao_fonte(
    mag_maternidade_divina_catecismo_495,
    '495',
    'A Igreja confessa que Maria e verdadeiramente Mae de Deus.'
).

status_revisao(mag_maternidade_divina_catecismo_495, aprovado_manual).
