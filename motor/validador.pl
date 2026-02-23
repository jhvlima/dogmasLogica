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

% diagnostico_detalhado(+Dogma)
% Mostra um trace legivel, argumento por argumento, com versiculo, resolucao,
% tipo de heresia (se houver) e suporte do argumento.
diagnostico_detalhado(Dogma) :-
        nl, write('=== TRACE DETALEHADO ==='), nl,
        ( dogma(Dogma, Nome) -> format('Dogma: ~w (~w)~n',[Nome,Dogma]) ; format('Dogma: ~w~n',[Dogma]) ),
        ( significado(Dogma, Sign) -> format('Significado: ~w~n',[Sign]) ; true ),
        ( axioma(Dogma, Axi) -> format('Axioma: ~w~n',[Axi]) ; true ),
        % Suportes biblicos
        findall(RefStr, (suporte(Dogma,Ref), term_string(Ref,RefStr)), Suportes),
        ( Suportes == [] -> write('Suportes bíblicos: (nenhum)'), nl ; ( write('Suportes bíblicos:'), nl, forall(member(Su,Suportes), (write('  - '), write(Su), nl)) ) ),

        % Iterar sobre objeções
        findall(Arg-Ref, objecao(Dogma, Ref, Arg), Pairs),
        ( Pairs == [] -> write('Objeções: (nenhuma)'), nl
        ; (
                write('Objeções encontradas:'), nl,
                listar_objecoes(Pairs, 1)
            )
        ),

        % Veredito final
        ( dogma_solido(Dogma) -> write('VEREDITO FINAL: SOLIDO'), nl
        ; ( \+ tem_fundamento(Dogma) -> write('VEREDITO FINAL: FALHA - sem fundamento bíblico'), nl
            ; write('VEREDITO FINAL: FALHA - existe(s) objeção(ões) não resolvida(s)'), nl ) ).

listar_objecoes([], _).
listar_objecoes([Arg-Ref|Rest], N) :-
        term_string(Ref, RefStr),
        format('~n~w) Argumento: ~w~n',[N,Arg]),
        format('   Versículo: ~w~n',[RefStr]),
        ( resolucao(Arg, ResText) -> format('   Resolvida: SIM~n   Resolução: ~w~n',[ResText]) ; format('   Resolvida: NÃO~n') ),
        ( tipo_heresia(Arg, H) -> format('   Heresia associada: ~w~n',[H]) ; true ),
        ( suporte_argumento(Arg, SA) -> format('   Suporte do argumento: ~w~n',[SA]) ; true ),
        listar_objecoes(Rest, N+1).

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