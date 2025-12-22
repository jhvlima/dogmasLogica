% ==============================================================================
% ARQUIVO: validador.pl
% DESCRIÇÃO: Regras lógicas para validar a consistência dos dogmas.
% ==============================================================================

% Regra 1: Identifica se existe alguma objeção SEM resolução para o dogma.
% Isso é o que chamamos de "Heresia não tratada" ou "Falha Lógica".
falha_encontrada(Dogma, Argumento, Ref) :-
    objecao(Dogma, Ref, Argumento),     % Existe uma objeção
    \+ resolucao(Argumento, _).         % E NÃO existe resolução (\+ significa NOT)

% Regra 2: Verifica se o dogma tem suporte bíblico mínimo.
tem_fundamento(Dogma) :-
    suporte(Dogma, _), !. % O '!' (cut) serve para parar de procurar se achar um.

% Regra 3: O Veredito Final (Dogma Sólido)
% Um dogma é sólido se:
% 1. Tem fundamento bíblico
% 2. NÃO possui falhas encontradas (todas as objeções foram resolvidas)
dogma_solido(Dogma) :-
    tem_fundamento(Dogma),
    \+ falha_encontrada(Dogma, _, _).

% Regra Auxiliar: Explica por que falhou (para o usuário ver)
diagnostico(Dogma) :-
    dogma_solido(Dogma),
    write('VEREDITO: O dogma e SOLIDO.'), nl,
    write('Todas as objecoes foram respondidas pela Doutrina.'), nl.

diagnostico(Dogma) :-
    \+ tem_fundamento(Dogma),
    write('VEREDITO: FALHA.'), nl,
    write('Motivo: O dogma nao possui versiculos de suporte cadastrados.'), nl.

diagnostico(Dogma) :-
    falha_encontrada(Dogma, Argumento, _),
    write('VEREDITO: FALHA.'), nl,
    write('Motivo: Objecao nao resolvida encontrada: '), write(Argumento), nl,
    write('Cadastre uma resolucao em magisterio.pl para consertar.'), nl.

% ==============================================================================
% --- Validação de Hipóteses Pessoais ---
% DESCRIÇÃO: Adição de motor para verificar suposições pessoais.
% ==============================================================================

% Uma hipótese é considerada "Verificável" se:
% 1. Está marcada como 'ativa' (você quer testar ela agora)
% 2. O fundamento bíblico citado existe na base de escrituras.
testar_hipotese(ID) :-
    hipotese(ID, Desc, Ref),
    write('Testando Hipotese: '), write(ID), nl,
    (   \+ ativa(ID) 
    ->  write('STATUS: Inativa (Ative em hipoteses.pl para validar).'), nl
    ;   Ref, % Verifica se a passagem existe
        write('DESCRICAO: '), write(Desc), nl,
        write('FUNDAMENTO: Encontrado em escrituras.pl'), nl,
        write('STATUS: Verificada com sucesso.'), nl
    ).

testar_hipotese(ID) :-
    \+ hipotese(ID, _, _),
    write('ERRO: Hipotese não encontrada.').