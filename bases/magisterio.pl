% ==============================================================================
% ARQUIVO: magisterio.pl
% DESCRIÇÃO: Definições dogmáticas e resoluções teológicas de conflitos.
% ==============================================================================

% DEFINIÇÃO DOS DOGMAS
% dogma(Id, NomeLegivel).

% --- 1. SOBRE DEUS ---
dogma(existencia_deus_razao, 'A Existencia de Deus (conhecivel pela razao)').
dogma(existencia_deus_fe, 'A Existencia de Deus como Objeto de Fe').
dogma(unidade_deus, 'A Unidade de Deus').
dogma(deus_eterno, 'Deus e Eterno').
dogma(trindade, 'A Santissima Trindade').

% --- 2. SOBRE JESUS CRISTO ---
dogma(jesus_deus_essencia, 'Jesus Cristo e verdadeiro Deus e Filho de Deus por Essencia').
dogma(duas_naturezas, 'Jesus possui duas naturezas (divina e humana) sem confusao').
dogma(vontade_propria, 'Cada natureza em Cristo possui uma vontade e operacao proprias').
dogma(filho_natural, 'Jesus Cristo e o Filho Natural de Deus').
dogma(sacrificio_cruz, 'O sacrificio de Cristo na Cruz foi um verdadeiro sacrificio').
dogma(redencao, 'Cristo redimiu e reconciliou a humanidade com Deus').
dogma(ressurreicao, 'Cristo ressuscitou dos mortos ao terceiro dia').
dogma(ascensao, 'Cristo ascendeu em Corpo e Alma aos Ceus').

% --- 3. SOBRE A CRIAÇÃO ---
dogma(criacao_ex_nihilo, 'Tudo o que existe foi criado por Deus a partir do Nada (ex nihilo)').
dogma(mundo_inicio_tempo, 'O mundo teve um inicio no tempo').
dogma(conservacao_existencia, 'Deus conserva todas as coisas criadas na existencia').

% --- 4. SOBRE O SER HUMANO ---
dogma(corpo_e_alma, 'O ser humano e composto de corpo material e alma espiritual').
dogma(pecado_original, 'O pecado de Adao propaga-se por geracao (Pecado Original)').
dogma(homem_nao_se_redime, 'O homem caido nao pode redimir-se a si mesmo').

% --- 5. DOGMAS MARIANOS ---
dogma(maternidade_divina, 'A Maternidade Divina de Maria (Theotokos)').
dogma(virgindade_perpetua, 'A Virgindade Perpetua de Maria').
dogma(imaculada_conceicao, 'A Imaculada Conceicao de Maria').
dogma(assuncao_maria, 'A Assuncao de Maria em Corpo e Alma').

% --- 6. SOBRE O PAPA E A IGREJA ---
dogma(fundacao_igreja, 'A Igreja foi fundada por Jesus Cristo').
dogma(primado_pedro, 'Cristo conferiu a Pedro o primado de jurisdicao sobre toda a Igreja').
dogma(jurisdicao_papa, 'O Papa possui poder de jurisdicao pleno e supremo sobre a Igreja').
dogma(infalibilidade_papa, 'O Papa e infalivel quando fala ex cathedra').
dogma(infalibilidade_igreja, 'A Igreja e infalivel ao definir materia de fe e costumes').

% --- 7. SOBRE OS SACRAMENTOS ---
dogma(batismo_sacramento, 'O Batismo e um verdadeiro Sacramento instituido por Cristo').
dogma(confirmacao_sacramento, 'A Confirmacao e um verdadeiro Sacramento').
dogma(poder_perdoar_pecados, 'A Igreja tem o poder de perdoar os pecados cometidos apos o Batismo').
dogma(confissao_necessaria, 'A Confissao Sacramental e de direito divino e necessaria para a salvacao').
dogma(eucaristia_sacramento, 'A Eucaristia e um verdadeiro Sacramento instituido por Cristo').
dogma(presenca_real, 'A Presenca Real de Cristo na Eucaristia pela Transubstanciacao').
dogma(uncao_enfermos, 'A Uncao dos Enfermos e um verdadeiro Sacramento').
dogma(ordem_sacramento, 'A Ordem e um verdadeiro Sacramento').
dogma(matrimonio_sacramento, 'O Matrimonio e um verdadeiro Sacramento').

% --- 8. SOBRE AS ÚLTIMAS COISAS ---
dogma(morte_pecado, 'A Morte e consequencia do pecado').
dogma(ceu_justos, 'O Ceu (visao beatifica) e o destino dos justos').
dogma(inferno_eterno, 'O Inferno existe e e eterno').
dogma(purgatorio_existencia, 'O Purgatorio existe como estado de purificacao').
dogma(volta_cristo, 'No fim do mundo, Cristo voltara para julgar').
dogma(ressurreicao_mortos, 'A Ressurreicao dos mortos no Ultimo Dia').
dogma(juizo_universal, 'Havera um Juizo Universal').

% SUPORTE BÍBLICO
% suporte(Dogma, Referencia).

suporte(trindade, passagem(joao, 1, 1)).      % Jesus é Deus
suporte(trindade, passagem(mateus, 28, 19)).  % Fórmula Trinitária
suporte(trindade, passagem(mateus, 28, 19)).
suporte(maternidade_divina, passagem(lucas, 1, 43)).
suporte(primado_pedro, passagem(mateus, 16, 18)).
suporte(presenca_real, passagem(mateus, 26, 26)).

% SIGNIFICADO E AXIOMA (NOVOS)
% significado(Dogma, Texto): descrição resumida do que o dogma significa.
significado(trindade, 'Um so Deus subsiste em tres Pessoas distintas: Pai, Filho e Espirito Santo.').

% axioma(Dogma, Texto): afirmaçao-fundamento (o "fato" ou axioma) que sustenta a consequencia logica.
axioma(trindade, 'O Verbo era Deus (Joao 1:1) e a formula batismal (Mt 28:19) indicam a pluralidade de Pessoas na Unidade de Deus.').

% Suporte documental e concilios (opcionais)
% suporte_documento(Dogma, Documento)
suporte_documento(trindade, 'Credo de Niceia (325)').
suporte_documento(trindade, 'Catecismo da Igreja Catolica, nn. 232-267').

% concilio(Dogma, NomeConcilio)
concilio(trindade, 'Primeiro Concilio de Niceia (325)').
concilio(trindade, 'Concilio de Constantinopla (381)').

% RESOLUÇÕES
% resolucao(ArgumentoDaObjecao, ExplicacaoTeologica).

resolucao(simbolismo_eucaristia, 'Cristo disse "Isto E meu corpo", nao "Isto representa". A mudanca e de substancia.').

% Resolução para João 14:28 (Pai maior que eu)
% Explicação: Jesus falava enquanto homem. A desigualdade é na humanidade, não na divindade.
resolucao(desigualdade_divina, 'Distincao entre Natureza Humana e Divina (Uniao Hipostatica)').

% Resolução para Deuteronômio 6:4 (Deus é um)
% Explicação: A unidade é de Substância (Ousia), a trindade é de Pessoas (Hypostasis).
resolucao(unicidade_numerica_estrita, 'Unidade de Substancia vs Pluralidade de Pessoas').
