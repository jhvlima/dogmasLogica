% ==============================================================================
% ARQUIVO: main.pl
% DESCRIÇÃO: Arquivo principal. Carrega as bases e o motor.
% COMO RODAR: No terminal, digite: swipl main.pl
% ==============================================================================

% Carrega os arquivos
:- consult('bases/escrituras.pl').
:- consult('bases/magisterio.pl').
:- consult('bases/objecoes.pl').
:- consult('motor/validador.pl').

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
    write('=============================================='), nl, nl.

% Atalho para o diagnóstico
analisar(Dogma) :-
    write('Analisando o dogma: '), write(Dogma), nl,
    write('----------------------------------------------'), nl,
    diagnostico(Dogma).