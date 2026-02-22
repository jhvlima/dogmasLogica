% ======================================================================
% motor/tracador.pl
% Traçador de provas e exportador JSON para árvores de decisão de dogmas
% ======================================================================

:- use_module(library(http/json)).

% tracar_dogma(+DogmaId, -Veredito, -ProvaDict)
% Retorna um dict com os campos: dogma, nome, suportes, objecoes, veredito
tracar_dogma(DogmaId, Veredito, ProvaDict) :-
    ( dogma(DogmaId, Nome) -> true ; Nome = '' ),
    findall(RefStr, 
            (suporte(DogmaId, Ref), term_string(Ref, RefStr)),
            Suportes),
    findall(ObjDict,
            ( objecao(DogmaId, Ref, Arg),
              term_string(Ref, RefStr),
              ( resolucao(Arg, ResText) -> ResFlag = true, ResInfo = _{texto:ResText} ; ResFlag = false, ResInfo = _{} ),
              ObjDict = _{versiculo:RefStr, argumento:Arg, resolvida:ResFlag, resolucao:ResInfo}
            ),
            Objecoes),
    determine_veredito(Suportes, Objecoes, Veredito),
    ProvaDict = _{dogma:DogmaId, nome:Nome, suportes:Suportes, objecoes:Objecoes, veredito:Veredito}.

determine_veredito(Suportes, Objecoes, Veredito) :-
    ( Suportes == [] -> Veredito = "sem_fundamento"
    ; ( member(Obj, Objecoes), get_dict(resolvida, Obj, false) -> Veredito = "objecao_nao_resolvida" ; Veredito = "solido" )
    ).

% export_proof_json(+DogmaId, +FilePath)
% Gera um arquivo JSON com a prova do dogma
export_proof_json(DogmaId, FilePath) :-
    tracar_dogma(DogmaId, _Ver, Proof),
    atom_json_dict(JSONAtom, Proof, [compact(true), spacing(2)]),
    setup_call_cleanup(open(FilePath, write, S), write(S, JSONAtom), close(S)).
