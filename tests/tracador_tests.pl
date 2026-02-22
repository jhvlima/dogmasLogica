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
    write('=== TODOS OS TESTES PASSARAM ==='), nl,
    halt.

% Teste 1: tracar_dogma para 'trindade' retorna veredito "solido"
test1 :-
    write('Teste 1: Trindade deve retornar veredito solido... '),
    tracar_dogma(trindade, Veredito, Prova),
    Veredito = solido,
    get_dict(suportes, Prova, Suportes),
    length(Suportes, N),
    N > 0,
    write('PASSOU'), nl.

% Teste 2: tracar_dogma para 'unidade_deus' retorna "sem_fundamento"
test2 :-
    write('Teste 2: Unidade de Deus sem fundamento... '),
    tracar_dogma(unidade_deus, Veredito, Prova),
    Veredito = sem_fundamento,
    get_dict(suportes, Prova, []),
    write('PASSOU'), nl.

% Teste 3: Estrutura de prova completa com todos os campos
test3 :-
    write('Teste 3: Estrutura de prova completa... '),
    tracar_dogma(trindade, _, Prova),
    get_dict(dogma, Prova, _),
    get_dict(nome, Prova, _),
    get_dict(suportes, Prova, _),
    get_dict(objecoes, Prova, _),
    get_dict(veredito, Prova, _),
    write('PASSOU'), nl.

:- initialization(main).


