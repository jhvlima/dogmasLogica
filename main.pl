% ==============================================================================
% ARQUIVO: main.pl
% DESCRIÇÃO: Arquivo principal. Carrega as bases e o motor.
% COMO RODAR: No terminal, digite: swipl main.pl
% ==============================================================================

% Carrega as bases e os motores
:- consult('bases/load.pl').
:- consult('motor/validador.pl').
:- consult('motor/tracador.pl').
:- consult('motor/causalidade.pl').

% Mensagem de boas-vindas automática
:- initialization(boas_vindas).

boas_vindas :-
    nl,
    write('=============================================='), nl,
    write('   TRIBUNAL LOGICO DOS DOGMAS (Prolog)'), nl,
    write('=============================================='), nl,
    write('Comandos disponiveis:'), nl,
    write('  1. analisar(trindade).  -> Verifica a consistencia.'), nl,
    write('  2. dogma(X, Desc).      -> Lista os dogmas.'), nl,
    write('  3. analisar_tracado(trindade). -> Trace detalhado argumento-por-argumento.'), nl,
    write('  4. cadeia_axioma(redencao). -> Mostra a cadeia causal axiomas->dogma.'), nl,
    write('=============================================='), nl, nl.

% Atalho para o diagnóstico
analisar(Dogma) :-
    write('Analisando o dogma: '), write(Dogma), nl,
    write('----------------------------------------------'), nl,
    diagnostico(Dogma).

% Versão trajada do analisador: mostra um trace detalhado argumento por argumento.
analisar_tracado(Dogma) :-
    write('Analisando (trace) o dogma: '), write(Dogma), nl,
    write('----------------------------------------------'), nl,
    diagnostico_detalhado(Dogma).

% Atalho para rastreamento causal: mostra axiomas que levam ao dogma.
cadeia_axioma(Dogma) :-
    write('Rastreando cadeia causal para: '), write(Dogma), nl,
    write('----------------------------------------------'), nl,
    rastrear_cadeia_axioma(Dogma, 3).
