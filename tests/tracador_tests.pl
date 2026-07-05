% ======================================================================
% tests/tracador_tests.pl
% Testes unitários para o módulo tracador.pl (versão simplificada)
% Uso: swipl -s tests/tracador_tests.pl
% ======================================================================

% Carrega as bases e o motor
:- consult('main.pl').

% ======================================================================
% Testes manuais
% ======================================================================

main :-
    write('=== TESTES DO TRAÇADOR ==='), nl,
    test1,
    test2,
    test3,
    test4,
    test5,
    test6,
    test7,
    test8,
    test9,
    write('=== TODOS OS TESTES PASSARAM ==='), nl,
    halt.

% Teste 1: tracar_dogma para 'trindade' retorna veredito resistente
test1 :-
    write('Teste 1: Trindade deve retornar veredito resistente... '),
    tracar_dogma(trindade, Veredito, Prova),
    Veredito = definicao_magisterial_resistente,
    get_dict(sustentacao, Prova, Sustentacao),
    get_dict(biblicos, Sustentacao, Biblicos),
    length(Biblicos, N),
    N > 0,
    write('PASSOU'), nl.

% Teste 2: dogma sem definição magisterial aprovada retorna nao_modelado
test2 :-
    write('Teste 2: Unidade de Deus nao modelada... '),
    tracar_dogma(unidade_deus, Veredito, Prova),
    Veredito = nao_modelado,
    get_dict(sustentacao, Prova, Sustentacao),
    get_dict(biblicos, Sustentacao, []),
    write('PASSOU'), nl.

% Teste 3: Estrutura de prova completa com todos os campos
test3 :-
    write('Teste 3: Estrutura de prova completa... '),
    tracar_dogma(trindade, _, Prova),
    get_dict(dogma, Prova, _),
    get_dict(nome, Prova, _),
    get_dict(significado, Prova, _),
    get_dict(definicao_dogmatica, Prova, _),
    get_dict(pressupostos_assentimento, Prova, _),
    get_dict(revelacoes_base, Prova, _),
    get_dict(sustentacao, Prova, _),
    get_dict(referencias_magisteriais, Prova, _),
    get_dict(objecoes, Prova, _),
    get_dict(veredito, Prova, _),
    write('PASSOU'), nl.

% Teste 4: Fontes aprovadas devem ser exportadas para o dogma correto
test4 :-
    write('Teste 4: Referencias magisteriais aprovadas... '),
    tracar_dogma(trindade, _, Prova),
    get_dict(referencias_magisteriais, Prova, Refs),
    length(Refs, N),
    N > 0,
    member(Ref, Refs),
    get_dict(url, Ref, Url),
    Url \== '',
    write('PASSOU'), nl.

% Teste 5: Integridade referencial das fontes magisteriais
test5 :-
    write('Teste 5: Integridade das fontes magisteriais... '),
    forall(
        dogma_fonte(DogmaId, FonteId, _, _),
        (
            dogma(DogmaId, _),
            fonte_magisterial(FonteId, _, _, _, _, Url),
            Url \== '',
            status_revisao(FonteId, aprovado_manual)
        )
    ),
    write('PASSOU'), nl.

% Teste 6: Dogma com definição aprovada e sem objeções retorna presença magisterial
test6 :-
    write('Teste 6: Maternidade Divina com definicao presente... '),
    tracar_dogma(maternidade_divina, Veredito, Prova),
    Veredito = definicao_magisterial_presente,
    get_dict(definicao_dogmatica, Prova, Def),
    get_dict(fonte_aprovada, Def, true),
    write('PASSOU'), nl.

% Teste 7: Definição com fonte inexistente falha na validação de integridade
test7 :-
    write('Teste 7: Fonte inexistente falha integridade... '),
    \+ integridade_definicao_valida(trindade, fonte_inexistente),
    write('PASSOU'), nl.

% Teste 8: Pressupostos e revelações novas são exportados para Trindade
test8 :-
    write('Teste 8: Camadas novas exportadas... '),
    tracar_dogma(trindade, _, Prova),
    get_dict(pressupostos_assentimento, Prova, Pressupostos),
    get_dict(revelacoes_base, Prova, Revelacoes),
    length(Pressupostos, NP),
    length(Revelacoes, NR),
    NP > 0,
    NR > 0,
    write('PASSOU'), nl.

% Teste 9: Integridade referencial das novas camadas
test9 :-
    write('Teste 9: Integridade das novas camadas... '),
    \+ integridade_erro(_),
    write('PASSOU'), nl.

:- initialization(main).
