% ==============================================================================
% ARQUIVO: axiomas.pl
% DESCRIÇÃO: Sistema modular de axiomas fundamentais encapsulados para reutilização
%            Cada axioma é autocontido com: id, descrição, categorias,
%            implicações diretas e justificativas para dogmas.
% ==============================================================================

:- discontiguous axioma_def/4.
:- discontiguous implica_em/2.
:- discontiguous justifica/3.
% Nota: fundamento/6 foi movido para bases/sustentacao/fundamentos.pl

% ==============================================================================
% ESTRUTURA CENTRAL: axioma_def(Id, Descricao, Categorias, Peso)
% ==============================================================================
% - AxiomaId: identificador único
% - Descricao: texto descritivo (string)
% - Categorias: lista de categorias [deus, biblia, jesus, humanidade, logica, etc.]
% - Peso: importância relativa (1-10)
%
% implica_em(AxiomaId, [ListaAxiomasQueImplica])
%   Define quais axiomas decorrem logicamente deste axioma
%
% justifica(AxiomaId, TargetId, Texto)
%   TargetId pode ser outro axioma ou dogma; Texto explica a relação

% ==============================================================================
% AXIOMA 1: DEUS EXISTE (Fundamental)
% ==============================================================================

axioma_def(deus_existe,
           'Deus existe como verdade fundamental, causa primeira de tudo que existe.',
           [deus, ontologia],
           10).

implica_em(deus_existe, [
    biblia_verdadeira,
    jesus_pode_existir,
    necessidade_reconciliacao
]).

justifica(deus_existe, existencia_deus_razao,
          'A razão pode conhecer que Deus existe pela causalidade universal.').
justifica(deus_existe, existencia_deus_fe,
          'Deus é objeto de fé para os que O buscam.').
justifica(deus_existe, homem_nao_se_redime,
          'O ser humano é finito; apenas Deus infinito pode redimir.').
justifica(deus_existe, redencao,
          'Deus é a causa primeira e possibilitador de toda redenção.').

% ==============================================================================
% AXIOMA 2: BÍBLIA VERDADEIRA (Fundamental)
% ==============================================================================

axioma_def(biblia_verdadeira,
           'A Bíblia é verdadeira e fala verdades incontestáveis.',
           [biblia, revelacao, palavra_de_deus],
           9).

implica_em(biblia_verdadeira, [
    humano_criado_em_comunhao,
    humano_escolheu_afastar,
    evangelhos_palavra_de_deus
]).

justifica(biblia_verdadeira, existencia_deus_fe,
          'A Bíblia atesta que Deus é objeto de fé.').
justifica(biblia_verdadeira, corpo_e_alma,
          'A Bíblia declara que o ser humano é corpo e alma unificados.').
justifica(biblia_verdadeira, pecado_original,
          'A Bíblia testemunha que o pecado original propagou-se por gerações.').
justifica(biblia_verdadeira, redencao,
          'A Bíblia testemunha que Deus reconciliou a humanidade através de Cristo.').

% ==============================================================================
% AXIOMA 3: JESUS EXISTE (Fundamental)
% ==============================================================================

axioma_def(jesus_existe,
           'Jesus existe historicamente e fala verdades incontestáveis através do Evangelho.',
           [jesus, historia, testemunho],
           9).

implica_em(jesus_existe, [
    evangelhos_palavra_de_deus,
    jesus_pode_reconciliar,
    duas_naturezas_possivel
]).

justifica(jesus_existe, jesus_deus_essencia,
          'Se Jesus fala verdades e os Evangelhos O declaram Deus, Ele é verdadeiro Deus.').
justifica(jesus_existe, sacrificio_cruz,
          'Jesus, existente e divino, ofereceu-Se em sacrifício.').
justifica(jesus_existe, ressurreicao,
          'Jesus ressuscitou dos mortos, validando Suas afirmações.').

% ==============================================================================
% AXIOMA 4: EVANGELHOS SÃO PALAVRA DE DEUS (Fundamental)
% ==============================================================================

axioma_def(evangelhos_palavra_de_deus,
           'Os Evangelhos são a Palavra de Deus, revelação divina em forma narrativa.',
           [biblia, jesus, revelacao, palavra_de_deus],
           8).

implica_em(evangelhos_palavra_de_deus, [
    biblia_verdadeira,
    jesus_existe,
    reconciliacao_em_cristo
]).

justifica(evangelhos_palavra_de_deus, jesus_deus_essencia,
          'Os Evangelhos declaram explicitamente que Jesus é Deus.').
justifica(evangelhos_palavra_de_deus, duas_naturezas,
          'Os Evangelhos mostram Cristo com duas operações: divina e humana.').
justifica(evangelhos_palavra_de_deus, redencao,
          'O Evangelho atesta que Cristo redimiu a humanidade.').
justifica(evangelhos_palavra_de_deus, presenca_real,
          'Os Evangelhos registram a instituição da Eucaristia por Cristo.').

% ==============================================================================
% FUNDAMENTOS (Derivam de Axiomas + Passagens Bíblicas Específicas)
% ==============================================================================
% fundamento(Id, Descricao, [AxiomasSustentadores], [PassagensBiblicas], Categorias, Peso)
% 
% Um FUNDAMENTO é uma proposição que necessita de:
% 1. Um ou mais axiomas como fundação lógica
% 2. Passagens bíblicas específicas que o sustentam
%
% Isso os distingue de AXIOMAS/PRESSUPOSTOS do modelo, que não carregam passagens específicas.

% ==============================================================================
% FUNDAMENTO 1: HUMANIDADE CRIADA EM COMUNHÃO COM DEUS
% ==============================================================================
% Nota: Fundamentos foram movidos para bases/sustentacao/fundamentos.pl

% ==============================================================================
% AXIOMAS DERIVADOS (compostos de axiomas fundamentais)
% ==============================================================================

axioma_def(necessidade_reconciliacao,
           'A reconciliação é necessária porque o ser humano se afastou de Deus.',
           [humanidade, reconciliacao, logica],
           8).

implica_em(necessidade_reconciliacao, [
    jesus_reconciliou_humanidade,
    redencao_necessaria
]).

axioma_def(jesus_pode_existir,
           'Se Deus existe, Deus pode encarnar em Jesus.',
           [deus, jesus, logica],
           7).

axioma_def(jesus_pode_reconciliar,
           'Jesus, sendo Deus encarnado, tem poder para reconciliar.',
           [jesus, reconciliacao, logica],
           8).

axioma_def(duas_naturezas_possivel,
           'Sendo Deus, Jesus pode ter duas naturezas completas sem contradição.',
           [jesus, cristologia, logica],
           7).

axioma_def(corpo_e_alma_necessario,
           'A comunhão com Deus requer uma pessoa integrada de corpo e alma.',
           [humanidade, antropologia, logica],
           7).

axioma_def(homem_nao_redime_a_si_mesmo,
           'O ser humano, sendo finito e culpado, não tem poder para se redimir.',
           [humanidade, soteriologia, logica],
           8).

axioma_def(necessidade_sacrificio,
           'Um afastamento de Deus requer reconciliação através de sacrifício.',
           [deus, sacrificio, logica],
           8).

axioma_def(sacrificio_necessario,
           'O sacrifício é necessário para reconciliar a criatura com o Criador.',
           [sacrificio, reconciliacao, logica],
           8).

axioma_def(reconciliacao_em_cristo,
           'A reconciliação se realiza através de Cristo, a encarnação do Verbo.',
           [jesus, reconciliacao, logica],
           9).

axioma_def(redencao_em_cristo,
           'A redenção ocorre através de Cristo, a encarnação do Verbo.',
           [jesus, redencao, logica],
           9).

axioma_def(redencao_restauracao,
           'A redenção restaura a comunhão original entre Deus e humanidade.',
           [reconciliacao, redencao, logica],
           8).

axioma_def(redencao_necessaria,
           'A redenção é necessária porque a humanidade se afastou de Deus.',
           [humanidade, redencao, logica],
           8).

axioma_def(ressurreicao_validacao,
           'A ressurreição de Cristo valida e completa Seu sacrifício redentor.',
           [jesus, ressurreicao, logica],
           9).

% ==============================================================================
% FUNÇÕES UTILITÁRIAS PARA EXPLORARAXIOMAS
% ==============================================================================

%, lista_axiomas/0 - Lista todos os axiomas com suas descrições e implicações
lista_axiomas :-
    write('╔════════════════════════════════════════════════════════╗'), nl,
    write('║         SISTEMA DE AXIOMAS ENCAPSULADOS               ║'), nl,
    write('╚════════════════════════════════════════════════════════╝'), nl, nl,
    findall(Id, axioma_def(Id, _, _, _), Axiomas),
    length(Axiomas, N),
    format('Total de axiomas cadastrados: ~w~n~n',[N]),
    forall(member(Id, Axiomas),
           (axioma_def(Id, Desc, Cats, Peso),
            format('~w (peso: ~w)~n',[Id, Peso]),
            format('  │ Descrição: ~w~n',[Desc]),
            format('  │ Categorias: ~w~n',[Cats]),
            ( implica_em(Id, Implicandos), Implicandos \== []
            -> (
              format('  └─ Implica em (~w axiomas):~n',[Implicandos]),
              forall(member(I, Implicandos), format('       • ~w~n',[I]))
                )
            ; format('  └─ (nenhuma implicação direta)~n')
            ),
            nl
           )).

% axioma_implica/1 - Mostra o que um axioma implica e seu impacto
axioma_implica(Id) :-
    ( axioma_def(Id, Desc, Cats, Peso)
    -> (
        format('╔════════════════════════════════════════════════════════╗~n'),
        format('║ ANÁLISE DE IMPACTO: ~w~n',[Id]),
        format('╚════════════════════════════════════════════════════════╝~n~n'),
        format('Descrição: ~w~n~n',[Desc]),
        format('Categorias: ~w~n',[Cats]),
        format('Peso/Importância: ~w~n~n',[Peso]),
        ( implica_em(Id, Implicandos), Implicandos \== []
        -> (
            write('Implica logicamente em:'), nl,
            forall(member(I, Implicandos),
                   (write('  • '), write(I), nl))
          )
        ; write('Nenhuma implicação registrada.'), nl
        ),
        nl
      )
    ; format('Axioma ~w não encontrado.~n',[Id])
    ).

% axioma_justifica_dogmas/1 - Mostra quais dogmas um axioma sustenta
axioma_justifica_dogmas(Id) :-
    findall(Target-Texto, justifica(Id, Target, Texto), Targets),
    ( Targets == []
    -> format('Axioma ~w não justifica nenhum dogma diretamente.~n',[Id])
    ; (
        format('╔════════════════════════════════════════════════════════╗~n'),
        format('║ DOGMAS JUSTIFICADOS: ~w~n',[Id]),
        format('╚════════════════════════════════════════════════════════╝~n~n'),
        forall(member(T-Texto, Targets),
               (format('  ✓ ~w~n',[T]),
                format('    └─ ~w~n~n',[Texto])
              )
        )
      )
    ).

% rastrear_axiomas_para_dogma/1 - Mostra todos os axiomas que sustentam um dogma
rastrear_axiomas_para_dogma(DogmaId) :-
    findall(AxId-Texto, justifica(AxId, DogmaId, Texto), Axiomas),
    ( Axiomas == []
    -> format('Nenhum axioma cadastrado para o dogma ~w.~n',[DogmaId])
    ; (
        format('╔════════════════════════════════════════════════════════╗~n'),
        format('║ AXIOMAS QUE SUSTENTAM: ~w~n',[DogmaId]),
        format('╚════════════════════════════════════════════════════════╝~n~n'),
        forall(member(AxId-Texto, Axiomas),
               (axioma_def(AxId, Desc, _, Peso),
                format('~w (peso: ~w)~n',[AxId, Peso]),
                format('  │ ~w~n',[Desc]),
                format('  └─ Justificativa: ~w~n~n',[Texto])
              )
        )
      )
    ).

% grafo_implicacoes/1 - Mostra o grafo de implicações diretas de um axioma
grafo_implicacoes(Id) :-
    ( axioma_def(Id, Desc, _, _)
    -> (
        format('╔════════════════════════════════════════════════════════╗~n'),
        format('║ GRAFO DE IMPLICAÇÕES: ~w~n',[Id]),
        format('╚════════════════════════════════════════════════════════╝~n~n'),
        format('~w~n',[Desc]), nl,
        format('  ⬇️  implica em:~n~n'),
        ( implica_em(Id, Implicandos), Implicandos \== []
        -> forall(member(I, Implicandos),
                  (format('      ◆ ~w~n',[I]),
                   ( axioma_def(I, _, _, _)
                   -> ( axioma_def(I, D, _, _),
                       format('        └─ ~w~n',[D])
                     )
                   ; true
                   ),
                   nl
                  )
            )
        ; write('      (nenhuma implicação)'), nl
        )
      )
    ; format('Axioma ~w não encontrado.~n',[Id])
    ).

% ============================================================================
% FUNÇÕES UTILITÁRIAS PARA FUNDAMENTOS
% ============================================================================

% listar_fundamentos/0 - Lista todos os fundamentos com axiomas sustentadores e passagens
listar_fundamentos :-
    write('╔════════════════════════════════════════════════════════╗'), nl,
    write('║           SISTEMA DE FUNDAMENTOS                      ║'), nl,
    write('║  (Axiomas + Passagens Bíblicas)                       ║'), nl,
    write('╚════════════════════════════════════════════════════════╝'), nl, nl,
    findall(Id, fundamento(Id, _, _, _, _, _), Fundamentos),
    length(Fundamentos, N),
    format('Total de fundamentos cadastrados: ~w~n~n',[N]),
    forall(member(Id, Fundamentos),
           mostrar_fundamento(Id)).

% mostrar_fundamento/1 - Mostra um fundamento com seus axiomas e passagens bíblicas
mostrar_fundamento(Id) :-
    ( fundamento(Id, Desc, AxiomasSust, Passagens, Cats, Peso)
    -> (
        format('╭─── [FUNDAMENTO] ~w~n',[Id]),
        format('│ Peso: ~w | Categorias: ~w~n',[Peso, Cats]),
        format('├─ Descrição:~n'),
        format('│  ~w~n',[Desc]),
        format('├─ Sustentado por AXIOMAS:~n'),
        forall(member(AxId, AxiomasSust),
               (format('│  • ~w~n',[AxId]),
                (axioma_def(AxId, AxDesc, _, _) -> 
                  format('│    └─ ~w~n',[AxDesc]) 
                ; true)
               )),
        format('├─ Sustentado por PASSAGENS BÍBLICAS:~n'),
        forall(member(Passagem, Passagens),
               (Passagem = passagem(Livro, Cap, Ver) ->
                 format('│  📖 ~w ~w:~w~n',[Livro, Cap, Ver])
               ; format('│  📖 ~w~n',[Passagem])
               )),
        format('╰─────────────────────────────────────────────────────~n~n')
      )
    ; format('Fundamento ~w não encontrado.~n~n',[Id])
    ).

% rastrear_axiomas_fundamentos_para_dogma/1 - Mostra AXIOMAS + FUNDAMENTOS que sustentam um dogma
rastrear_axiomas_fundamentos_para_dogma(DogmaId) :-
    write('╔════════════════════════════════════════════════════════╗'), nl,
    format('║ RASTREAMENTO COMPLETO: ~w~n',[DogmaId]),
    write('╚════════════════════════════════════════════════════════╝'), nl, nl,
    
    % Parte 1: Axiomas/pressupostos fundamentais do modelo
    write('═══ AXIOMAS FUNDAMENTAIS ════════════════════════════════'), nl,
    findall(AxId, (axioma_def(AxId, _, _, _), justifica(AxId, DogmaId, _)), Axiomas),
    ( Axiomas == []
    -> write('(nenhum axioma diretamente justifica este dogma)'), nl
    ; forall(member(AxId, Axiomas),
             (axioma_def(AxId, Desc, _, Peso),
              justifica(AxId, DogmaId, Texto),
              write('  ╔════════════════════════════════════════════╗'), nl,
              format('  ║ [AXIOMA] ~w~n',[AxId]),
              format('  ║ Peso: ~w~n',[Peso]),
              write('  ├─ Descrição:'), nl,
              format('  │  ~w~n',[Desc]),
              write('  └─ Justificativa para este dogma:'), nl,
              format('     ~w~n',[Texto]),
              write('  ╚════════════════════════════════════════════╝'), nl
             ))
    ), nl,
    
    % Parte 2: Fundamentos (baseados em axiomas + passagens específicas)
    write('═══ FUNDAMENTOS (axiomas + passagens bíblicas) ══════════'), nl,
    findall(FundId, (fundamento(FundId, _, _, _, _, _), justifica(FundId, DogmaId, _)), Fundamentos),
    ( Fundamentos == []
    -> write('(nenhum fundamento justifica diretamente este dogma)'), nl
    ; forall(member(FundId, Fundamentos),
             (fundamento(FundId, FDesc, AxiomasSust, Passagens, _, FPeso),
              justifica(FundId, DogmaId, FTexto),
              write('  ╔════════════════════════════════════════════╗'), nl,
              format('  ║ [FUNDAMENTO] ~w~n',[FundId]),
              format('  ║ Peso: ~w~n',[FPeso]),
              write('  ├─ Descrição:'), nl,
              format('  │  ~w~n',[FDesc]),
              write('  ├─ Baseado em AXIOMAS:'), nl,
              forall(member(Ax, AxiomasSust),
                     (format('  │  • ~w', [Ax]),
                      (axioma_def(Ax, _, _, _) -> nl ; nl))),
              write('  ├─ Com PASSAGENS BÍBLICAS:'), nl,
              forall(member(Passagem, Passagens),
                     (Passagem = passagem(Livro, Cap, Ver) ->
                       format('  │  📖 ~w ~w:~w~n',[Livro, Cap, Ver])
                     ; format('  │  📖 ~w~n',[Passagem])
                     )),
              write('  └─ Justificativa para este dogma:'), nl,
              format('     ~w~n',[FTexto]),
              write('  ╚════════════════════════════════════════════╝'), nl
             ))
    ), nl.

% ============================================================================
% MAPEAMENTO COMPLETO: JUSTIFICAÇÕES DE AXIOMAS PARA DOGMAS
% ============================================================================
% justifica(AxiomaId, DogmaId, TextoJustificativa)
% Consolidado acima na seção de axiomas fundamentais e derivados
