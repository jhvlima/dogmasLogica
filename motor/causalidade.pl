% ==============================================================================
% ARQUIVO: motor/causalidade.pl
% DESCRIÇÃO: Motor de rastreamento causal que mostra como axiomas 
%            levam aos dogmas através de cadeias de implicações
% ==============================================================================

% ============================================================================
% RASTREAMENTO DIRETO: Axiomas -> Dogma
% ============================================================================

% mostrar_axiomas_do_dogma(+DogmaId).
% Lista todos os axiomas que sustentam um dogma específico.
mostrar_axiomas_do_dogma(DogmaId) :-
    write('Axiomas que sustentam o dogma: '), write(DogmaId), nl,
    findall(AxId-Just, justifica(AxId, DogmaId, Just), Axiomas),
    ( Axiomas == []
    -> write('  (nenhum axioma cadastrado para este dogma)'), nl
    ; (
        forall(
          member(AxId-Just, Axiomas),
          (
            write('  ✓ '), write(AxId), nl,
            write('    Justificativa: '), write(Just), nl, nl
          )
        )
      )
    ).

% ============================================================================
% RASTREAMENTO PROFUNDO: Cadeia completa Axioma -> ... -> Dogma
% ============================================================================

% rastrear_cadeia_axioma(+DogmaId, +Profundidade).
% Mostra a cadeia completa de implicações que leva dos axiomas ao dogma.
rastrear_cadeia_axioma(DogmaId, Profundidade) :-
    nl,
    write('=== RASTREAMENTO CAUSAL ==='), nl,
    format('Dogma: ~w (busca em profundidade: ~w)~n~n',[DogmaId, Profundidade]),
    
    % Passo 1: Determinar axiomas diretos
    findall(AxId-Just,
            justifica(AxId, DogmaId, Just),
            AxiomasDirectos),
    
    ( AxiomasDirectos == [] 
    -> write('Nenhuma relação direta axioma->dogma encontrada.'), nl
    ; (
        write('Axiomas que sustentam diretamente este dogma:'), nl,
        forall( member(AxId-Just, AxiomasDirectos),
                (
                  write('  [AXIOMA] '), write(AxId), nl,
                  ( axioma_def(AxId, Desc, _, _) -> format('  └─ ~w~n',[Desc]) ; true ),
                  format('  └─ Justificativa: ~w~n~n',[Just])
                )
              )
      )
    ),
    
    % Passo 2: Mostrar implicações conectadas
    write('Implicações lógicas conectadas a este dogma:'), nl,
    mostrar_implicacoes_relacionadas(DogmaId, 1),
    nl.

% Helper: mostrar_implicacoes_relacionadas/2
mostrar_implicacoes_relacionadas(_, _) :-
    % Placeholder para futuras expansões de análise de implicações diretas
    true.

% ============================================================================
% ANÁLISE HOLÍSTICA: "Se você acredita no dogma X, logicamente acredita em..."
% ============================================================================

% consequencias_de_crer(+DogmaId).
% Mostra quais axiomas você está implicitamente aceitando ao crer em um dogma.
consequencias_de_crer(DogmaId) :-
    nl,
    write('=== CONSEQUÊNCIAS LÓGICAS ==='), nl,
    format('Se você acredita no dogma: ~w~n~n',[DogmaId]),
    
    % Encontrar axiomas que sustentam este dogma
    findall(AxId, justifica(AxId, DogmaId, _), Axiomas),
    
    ( Axiomas == []
    -> write('Nenhum axioma base identificado.'), nl
    ; (
        write('Você está logicamente comprometido com os seguintes axiomas:'), nl, nl,
        listar_axiomas_fundamentais(Axiomas, 1)
      )
    ).

% Helper: listar_axiomas_fundamentais/2
listar_axiomas_fundamentais([], _).
listar_axiomas_fundamentais([AxId|Rest], N) :-
    write('  '), write(N), write('. '),
    ( axioma_def(AxId, Desc, Categorias, Peso)
    -> (
        write('[AXIOMA] '), write(AxId), nl,
        format('     Descrição: ~w~n',[Desc]),
        format('     Categorias: ~w~n',[Categorias]),
        format('     Peso: ~w~n~n',[Peso])
      )
    ; (
        write('[FUNDAMENTO] '), write(AxId), nl,
        ( fundamento(AxId, FDesc, AxiomasSust, Passagens, _, FPeso)
        -> (
            format('     Descrição: ~w~n',[FDesc]),
            format('     Baseado em axiomas: ~w~n',[AxiomasSust]),
            format('     Passagens bíblicas: ~w~n',[Passagens]),
            format('     Peso: ~w~n~n',[FPeso])
          )
        ; format('     (fundamento não cadastrado)~n~n')
        )
      )
    ),
    N1 is N + 1,
    listar_axiomas_fundamentais(Rest, N1).

% ============================================================================
% VISUALIZAÇÃO EM ÁRVORE: Mostrar fluxo axiomas -> dogma em forma visual
% ============================================================================

% arvore_causal(+DogmaId).
% Exibe uma árvore visual mostrando como os axiomas causam o dogma.
arvore_causal(DogmaId) :-
    nl,
    write('=== ÁRVORE CAUSAL ==='), nl,
    format('Dogma: ~w~n~n',[DogmaId]),
    
    ( dogma(DogmaId, NomeDogma)
    -> format('  ~w~n~n',[NomeDogma])
    ; true
    ),
    
    write('  ▲ Sustentação em Axiomas:'), nl,
    write('  │'), nl,
    
    findall(AxId-Just,
            justifica(AxId, DogmaId, Just),
            AxiomasDirectos),
    
    ( AxiomasDirectos == []
    -> write('  └─ (nenhum axioma cadastrado)'), nl
    ; mostrar_arvore_axiomas(AxiomasDirectos)
    ),
    nl.

% Helper: mostrar_arvore_axiomas/1
mostrar_arvore_axiomas([]).
mostrar_arvore_axiomas([AxId-Just|Rest]) :-
    ( Rest == []
    -> write('  └─[AXIOMA] '), write(AxId), nl
    ;  write('  ├─[AXIOMA] '), write(AxId), nl
    ),
    format('     Justificativa: ~w~n',[Just]),
    ( Rest \== [] -> write('  │'), nl ; true ),
    mostrar_arvore_axiomas(Rest).

% ============================================================================
% TESTE INTEGRADO: Exemplo pronto - redencao
% ============================================================================

% teste_redencao/0.
% Executa um trace completo para o dogma "redencao"
% Mostra a hierarquia completa: AXIOMAS → FUNDAMENTOS → DOGMA
teste_redencao :-
    write('╔════════════════════════════════════════════════════════╗'), nl,
    write('║ TESTE: Rastreamento Causal - Dogma da Redenção       ║'), nl,
    write('║ Hierarquia: Axiomas → Fundamentos → Dogma            ║'), nl,
    write('╚════════════════════════════════════════════════════════╝'), nl, nl,
    
    DogmaId = redencao,
    
    % 1. Árvore visual
    arvore_causal(DogmaId), nl,
    
    % 2. Rastreamento completo (Axiomas + Fundamentos + Passagens)
    rastrear_axiomas_fundamentos_para_dogma(DogmaId), nl,
    
    % 3. Consequências de crer
    consequencias_de_crer(DogmaId), nl,
    
    write('╔════════════════════════════════════════════════════════╗'), nl,
    write('║ Conclusão: Crer em Redenção implica em:              ║'), nl,
    write('║ • 3 Axiomas/pressupostos fundamentais do modelo      ║'), nl,
    write('║ • 1 Fundamento que se baseia em 3 axiomas +          ║'), nl,
    write('║   passagens específicas de Gênesis e Evangelhos      ║'), nl,
    write('║ • Por causalidade lógica e textual                   ║'), nl,
    write('╚════════════════════════════════════════════════════════╝'), nl.
