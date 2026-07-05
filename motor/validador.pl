% ==============================================================================
% ARQUIVO: validador.pl
% DESCRIÇÃO: Regras lógicas para validar a consistência dos dogmas.
% ==============================================================================

% Regra 1: Identifica se existe alguma objeção SEM resolução para o dogma.
% Isso é o que chamamos de "Heresia não tratada" ou "Falha Lógica".
falha_encontrada(Dogma, Argumento, Ref) :-
    objecao(Dogma, Ref, Argumento),     % Existe uma objeção
    \+ resolucao(Argumento, _).         % E NÃO existe resolução (\+ significa NOT)

% Regra 2: Verifica se há suporte bíblico cadastrado como dado informativo.
tem_fundamento(Dogma) :-
    suporte(Dogma, _), !. % O '!' (cut) serve para parar de procurar se achar um.

% Regra 3: O Veredito Final (Dogma Sólido)
% Compatibilidade histórica: hoje "sólido" significa que há uma definição
% magisterial aprovada e que os dados não possuem conflitos conhecidos.
dogma_solido(Dogma) :-
    veredito_modelagem(Dogma, Veredito),
    member(Veredito, [definicao_magisterial_presente, definicao_magisterial_resistente]).

% ============================================================================
% --- Veredito de Qualidade de Modelagem ---
% ============================================================================

fonte_aprovada(FonteId) :-
    fonte_magisterial(FonteId, _, _, _, _, Url),
    Url \== '',
    status_revisao(FonteId, aprovado_manual).

definicao_magisterial_aprovada(Dogma) :-
    definicao_dogmatica(Dogma, _, FonteId, _, _),
    fonte_aprovada(FonteId).

tem_objecoes(Dogma) :-
    objecao(Dogma, _, _), !.

dados_parciais(Dogma) :-
    dogma(Dogma, _),
    (
        suporte(Dogma, _)
    ;   dogma_fonte(Dogma, _, _, _)
    ;   pressuposto_essencial(Dogma, _)
    ;   dogma_explica_revelacao(Dogma, _, _, _)
    ;   fundamento_axiomatico(Dogma, _)
    ).

integridade_definicao_valida(Dogma, FonteId) :-
    dogma(Dogma, _),
    fonte_aprovada(FonteId).

integridade_erro(definicao_sem_dogma(Dogma)) :-
    definicao_dogmatica(Dogma, _, _, _, _),
    \+ dogma(Dogma, _).

integridade_erro(definicao_sem_fonte_aprovada(Dogma, FonteId)) :-
    definicao_dogmatica(Dogma, _, FonteId, _, _),
    \+ fonte_aprovada(FonteId).

integridade_erro(pressuposto_inexistente(Dogma, PressupostoId)) :-
    pressuposto_essencial(Dogma, PressupostoId),
    ( \+ dogma(Dogma, _) ; \+ pressuposto_assentimento(PressupostoId, _, _, _) ).

integridade_erro(revelacao_inexistente(Dogma, RevelacaoId)) :-
    dogma_explica_revelacao(Dogma, RevelacaoId, _, _),
    ( \+ dogma(Dogma, _) ; \+ revelacao_base(RevelacaoId, _, _) ).

integridade_erro(objecao_sem_resolucao(Dogma, Argumento)) :-
    falha_encontrada(Dogma, Argumento, _).

conflito_nos_dados(Dogma) :-
    integridade_erro(definicao_sem_dogma(Dogma));
    integridade_erro(definicao_sem_fonte_aprovada(Dogma, _));
    integridade_erro(pressuposto_inexistente(Dogma, _));
    integridade_erro(revelacao_inexistente(Dogma, _));
    integridade_erro(objecao_sem_resolucao(Dogma, _)).

veredito_modelagem(Dogma, nao_modelado) :-
    \+ dogma(Dogma, _), !.

veredito_modelagem(Dogma, conflito_nos_dados) :-
    conflito_nos_dados(Dogma), !.

veredito_modelagem(Dogma, definicao_magisterial_resistente) :-
    definicao_magisterial_aprovada(Dogma),
    tem_objecoes(Dogma), !.

veredito_modelagem(Dogma, definicao_magisterial_presente) :-
    definicao_magisterial_aprovada(Dogma), !.

veredito_modelagem(Dogma, incompleto) :-
    dados_parciais(Dogma), !.

veredito_modelagem(_, nao_modelado).

% Regra Auxiliar: Explica por que falhou (para o usuário ver)
diagnostico(Dogma) :-
    veredito_modelagem(Dogma, Veredito),
    write('VEREDITO DE MODELAGEM: '), write(Veredito), nl,
    explicar_veredito_modelagem(Veredito), nl.

explicar_veredito_modelagem(nao_modelado) :-
    write('Motivo: ainda nao ha definicao dogmatica aprovada para este item.').

explicar_veredito_modelagem(incompleto) :-
    write('Motivo: existem dados parciais, mas ainda falta definicao magisterial aprovada.').

explicar_veredito_modelagem(definicao_magisterial_presente) :-
    write('Motivo: ha definicao dogmatica com fonte magisterial aprovada.').

explicar_veredito_modelagem(definicao_magisterial_resistente) :-
    write('Motivo: ha definicao aprovada e as objecoes cadastradas possuem resolucao.').

explicar_veredito_modelagem(conflito_nos_dados) :-
    write('Motivo: ha inconsistencia estrutural ou objecao sem resolucao nos dados.').

% diagnostico_detalhado(+Dogma)
% Mostra um trace legivel, argumento por argumento, com versiculo, resolucao,
% tipo de heresia (se houver) e suporte do argumento.
diagnostico_detalhado(Dogma) :-
        nl, write('=== TRACE DETALEHADO ==='), nl,
        ( dogma(Dogma, Nome) -> format('Dogma: ~w (~w)~n',[Nome,Dogma]) ; format('Dogma: ~w~n',[Dogma]) ),
        ( significado(Dogma, Sign) -> format('Significado: ~w~n',[Sign]) ; true ),
        ( fundamento_axiomatico(Dogma, Axi) -> format('Fundamento Axiomático: ~w~n',[Axi]) ; true ),
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
        veredito_modelagem(Dogma, Veredito),
        format('VEREDITO DE MODELAGEM: ~w~n',[Veredito]).

listar_objecoes([], _).
listar_objecoes([Arg-Ref|Rest], N) :-
        term_string(Ref, RefStr),
        format('~n~w) Argumento: ~w~n',[N,Arg]),
        format('   Versículo: ~w~n',[RefStr]),
        ( resolucao(Arg, ResText) -> format('   Resolvida: SIM~n   Resolução: ~w~n',[ResText]) ; format('   Resolvida: NÃO~n') ),
        ( tipo_heresia(Arg, H, Periodo) -> format('   Heresia associada: ~w (~w)~n',[H, Periodo]) ; true ),
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
