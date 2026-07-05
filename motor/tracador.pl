% ======================================================================
% motor/tracador.pl
% Traçador de provas e exportador JSON para árvores de decisão de dogmas
% ======================================================================

:- use_module(library(http/json)).

% tracar_dogma(+DogmaId, -Veredito, -ProvaDict)
% Retorna um dict com dogma, nome, significado, definicao_dogmatica,
% pressupostos_assentimento, revelacoes_base, sustentacao, objecoes,
% referencias_magisteriais e veredito.
tracar_dogma(DogmaId, Veredito, ProvaDict) :-
    ( dogma(DogmaId, Nome) -> true ; Nome = '' ),
    % significado
    ( significado(DogmaId, Significado) -> true ; Significado = '' ),
    % Suportes biblicos
    findall(RefStr,
        (suporte(DogmaId, Ref), term_string(Ref, RefStr)),
        Biblicos),
    % fundamento_axiomatico (fato/axioma que sustenta o dogma)
    ( fundamento_axiomatico(DogmaId, Axi) -> Axioma = Axi ; Axioma = '' ),
    % documentos e concilios (opcionais)
    findall(Doc, suporte_documento(DogmaId, Doc), Documentos),
    findall(Conc, concilio(DogmaId, Conc), Concilios),

    % Objeções enriquecidas
    findall(ObjDict,
        ( objecao(DogmaId, Ref, Arg),
          term_string(Ref, RefStr),
          ( resolucao(Arg, ResText) -> ResFlag = true, ResInfo = _{texto:ResText} ; ResFlag = false, ResInfo = _{} ),
          ( tipo_heresia(Arg, Her, Periodo) -> Heresia = Her, PeriodoHeresia = Periodo ; Heresia = '', PeriodoHeresia = '' ),
          ( suporte_argumento(Arg, SupArg) -> SupArgVal = SupArg ; SupArgVal = '' ),
          ObjDict = _{versiculo:RefStr, argumento:Arg, resolvida:ResFlag, resolucao:ResInfo, tipo_heresia:Heresia, periodo_heresia:PeriodoHeresia, suporte_argumento:SupArgVal}
        ),
        Objecoes),

    % montar sustentacao
    Sustentacao = _{biblicos:Biblicos, axioma:Axioma, documentos:Documentos, concilios:Concilios},
    definicao_dogmatica_dict(DogmaId, DefinicaoDogmatica),
    pressupostos_assentimento_dicts(DogmaId, PressupostosAssentimento),
    revelacoes_base_dicts(DogmaId, RevelacoesBase),
    referencias_magisteriais(DogmaId, ReferenciasMagisteriais),

    determine_veredito(DogmaId, _{biblicos:Biblicos, objecoes:Objecoes}, Veredito),
    ProvaDict = _{
        dogma:DogmaId,
        nome:Nome,
        significado:Significado,
        definicao_dogmatica:DefinicaoDogmatica,
        pressupostos_assentimento:PressupostosAssentimento,
        revelacoes_base:RevelacoesBase,
        sustentacao:Sustentacao,
        referencias_magisteriais:ReferenciasMagisteriais,
        objecoes:Objecoes,
        veredito:Veredito
    }.

determine_veredito(DogmaId, _Contexto, Veredito) :-
    veredito_modelagem(DogmaId, Veredito).

% export_proof_json(+DogmaId, +FilePath)
% Gera um arquivo JSON com a prova do dogma
export_proof_json(DogmaId, FilePath) :-
    tracar_dogma(DogmaId, _Ver, Proof),
    atom_json_dict(JSONAtom, Proof, [compact(true), spacing(2)]),
    setup_call_cleanup(open(FilePath, write, S), write(S, JSONAtom), close(S)).

referencias_magisteriais(DogmaId, Referencias) :-
    findall(RefDict,
        ( dogma_fonte(DogmaId, FonteId, Papel, Nota),
          status_revisao(FonteId, aprovado_manual),
          fonte_magisterial(FonteId, Titulo, Autor, Ano, Referencia, UrlPublica),
          findall(CitReferencia-TextoCurto,
              citacao_fonte(FonteId, CitReferencia, TextoCurto),
              Citacoes),
          maplist(citacao_dict, Citacoes, CitacaoDicts),
          RefDict = _{
              id:FonteId,
              titulo:Titulo,
              autor:Autor,
              ano:Ano,
              referencia:Referencia,
              url:UrlPublica,
              papel:Papel,
              nota:Nota,
              citacoes:CitacaoDicts
          }
        ),
        Referencias).

citacao_dict(Referencia-TextoCurto, _{referencia:Referencia, texto:TextoCurto}).

definicao_dogmatica_dict(DogmaId, DefinicaoDict) :-
    ( definicao_dogmatica(DogmaId, Texto, FonteId, Grau, ConexaoRevelacao)
    -> ( fonte_aprovada(FonteId) -> FonteAprovada = true ; FonteAprovada = false ),
       DefinicaoDict = _{
        texto:Texto,
        fonte_id:FonteId,
        grau:Grau,
        conexao_revelacao:ConexaoRevelacao,
        fonte_aprovada:FonteAprovada
       }
    ;  DefinicaoDict = _{}
    ).

pressupostos_assentimento_dicts(DogmaId, Pressupostos) :-
    findall(PDict,
        ( pressuposto_essencial(DogmaId, PressupostoId),
          pressuposto_assentimento(PressupostoId, Nivel, Papel, Proposicao),
          PDict = _{
              id:PressupostoId,
              nivel:Nivel,
              papel:Papel,
              proposicao:Proposicao
          }
        ),
        Pressupostos).

revelacoes_base_dicts(DogmaId, Revelacoes) :-
    findall(RDict,
        ( dogma_explica_revelacao(DogmaId, RevelacaoId, Modo, Nota),
          revelacao_base(RevelacaoId, Proposicao, TipoRevelacao),
          RDict = _{
              id:RevelacaoId,
              proposicao:Proposicao,
              tipo:TipoRevelacao,
              modo:Modo,
              nota:Nota
          }
        ),
        Revelacoes).
