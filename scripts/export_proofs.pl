% ======================================================================
% scripts/export_proofs.pl
% Gera JSONs em docs/proofs/ para cada dogma definido.
% Uso: swipl -s scripts/export_proofs.pl
% ======================================================================

:- use_module(library(filesex)).
:- use_module(library(http/json)).

main :-
    % Carrega o sistema (main.pl deve carregar as bases e o tracador)
    consult('main.pl'),
    % Garante pasta de saída
    make_directory_path('docs/proofs'),
    findall(Id, dogma(Id,_), Dogmas),
    forall(member(Id, Dogmas), export_one(Id)),
    % Generate index.json with list of dogmas
    findall(_{id:Id, nome:Name}, dogma(Id,Name), DogmaDicts),
    atom_json_dict(IndexJson, DogmaDicts, [compact(true), spacing(2)]),
    setup_call_cleanup(open('docs/proofs/index.json', write, SI), write(SI, IndexJson), close(SI)),
    halt.

export_one(Id) :-
    format('Exporting ~w~n',[Id]),
    atomic_list_concat(['docs/proofs/', Id, '.json'], Path),
    ( catch(tracador:export_proof_json(Id, Path), E, (print_message(error,E), fail)) -> true ; format('Failed to export ~w~n',[Id]) ).

:- initialization(main).
