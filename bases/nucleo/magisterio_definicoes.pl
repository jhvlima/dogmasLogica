% ==============================================================================
% ARQUIVO: magisterio_definicoes.pl
% DESCRIÇÃO: Definições essenciais dos dogmas da Igreja Católica.
%            Cada dogma possui: identificador, nome legível e significado teológico.
% ==============================================================================

% ==============================================================================
% SEÇÃO 1: DEFINIÇÕES DE DOGMAS (dogma/2)
% ESTRUTURA: dogma(Id, NomeLegivel)
% ==============================================================================

% --- 1.1 SOBRE DEUS ---
dogma(existencia_deus_razao, 'A Existencia de Deus (conhecivel pela razao)').
dogma(existencia_deus_fe, 'A Existencia de Deus como Objeto de Fe').
dogma(unidade_deus, 'A Unidade de Deus').
dogma(deus_eterno, 'Deus e Eterno').
dogma(trindade, 'A Santissima Trindade').

% --- 1.2 SOBRE JESUS CRISTO ---
dogma(jesus_deus_essencia, 'Jesus Cristo e verdadeiro Deus e Filho de Deus por Essencia').
dogma(duas_naturezas, 'Jesus possui duas naturezas (divina e humana) sem confusao').
dogma(vontade_propria, 'Cada natureza em Cristo possui uma vontade e operacao proprias').
dogma(filho_natural, 'Jesus Cristo e o Filho Natural de Deus').
dogma(sacrificio_cruz, 'O sacrificio de Cristo na Cruz foi um verdadeiro sacrificio').
dogma(redencao, 'Cristo redimiu e reconciliou a humanidade com Deus').
dogma(ressurreicao, 'Cristo ressuscitou dos mortos ao terceiro dia').
dogma(ascensao, 'Cristo ascendeu em Corpo e Alma aos Ceus').

% --- 1.3 SOBRE A CRIAÇÃO ---
dogma(criacao_ex_nihilo, 'Tudo o que existe foi criado por Deus a partir do Nada (ex nihilo)').
dogma(mundo_inicio_tempo, 'O mundo teve um inicio no tempo').
dogma(conservacao_existencia, 'Deus conserva todas as coisas criadas na existencia').

% --- 1.4 SOBRE O SER HUMANO ---
dogma(corpo_e_alma, 'O ser humano e composto de corpo material e alma espiritual').
dogma(pecado_original, 'O pecado de Adao propaga-se por geracao (Pecado Original)').
dogma(homem_nao_se_redime, 'O homem caido nao pode redimir-se a si mesmo').

% --- 1.5 DOGMAS MARIANOS ---
dogma(maternidade_divina, 'A Maternidade Divina de Maria (Theotokos)').
dogma(virgindade_perpetua, 'A Virgindade Perpetua de Maria').
dogma(imaculada_conceicao, 'A Imaculada Conceicao de Maria').
dogma(assuncao_maria, 'A Assuncao de Maria em Corpo e Alma').

% --- 1.6 SOBRE O PAPA E A IGREJA ---
dogma(fundacao_igreja, 'A Igreja foi fundada por Jesus Cristo').
dogma(primado_pedro, 'Cristo conferiu a Pedro o primado de jurisdicao sobre toda a Igreja').
dogma(jurisdicao_papa, 'O Papa possui poder de jurisdicao pleno e supremo sobre a Igreja').
dogma(infalibilidade_papa, 'O Papa e infalivel quando fala ex cathedra').
dogma(infalibilidade_igreja, 'A Igreja e infalivel ao definir materia de fe e costumes').

% --- 1.7 SOBRE OS SACRAMENTOS ---
dogma(batismo_sacramento, 'O Batismo e um verdadeiro Sacramento instituido por Cristo').
dogma(confirmacao_sacramento, 'A Confirmacao e um verdadeiro Sacramento').
dogma(poder_perdoar_pecados, 'A Igreja tem o poder de perdoar os pecados cometidos apos o Batismo').
dogma(confissao_necessaria, 'A Confissao Sacramental e de direito divino e necessaria para a salvacao').
dogma(eucaristia_sacramento, 'A Eucaristia e um verdadeiro Sacramento instituido por Cristo').
dogma(presenca_real, 'A Presenca Real de Cristo na Eucaristia pela Transubstanciacao').
dogma(uncao_enfermos, 'A Uncao dos Enfermos e um verdadeiro Sacramento').
dogma(ordem_sacramento, 'A Ordem e um verdadeiro Sacramento').
dogma(matrimonio_sacramento, 'O Matrimonio e um verdadeiro Sacramento').

% --- 1.8 SOBRE AS ÚLTIMAS COISAS ---
dogma(morte_pecado, 'A Morte e consequencia do pecado').
dogma(ceu_justos, 'O Ceu (visao beatifica) e o destino dos justos').
dogma(inferno_eterno, 'O Inferno existe e e eterno').
dogma(purgatorio_existencia, 'O Purgatorio existe como estado de purificacao').
dogma(volta_cristo, 'No fim do mundo, Cristo voltara para julgar').
dogma(ressurreicao_mortos, 'A Ressurreicao dos mortos no Ultimo Dia').
dogma(juizo_universal, 'Havera um Juizo Universal').

% ==============================================================================
% SEÇÃO 2: SIGNIFICADOS TEOLÓGICOS (significado/2)
% ESTRUTURA: significado(DogmaId, DescricaoTeologica)
% Descreve o que cada dogma significa segundo a doutrina da Igreja.
% ==============================================================================

% 2.1 Sobre Deus
significado(existencia_deus_razao, 'A existencia de Deus pode ser demonstrada pela razao natural atraves de seus efeitos no universo.').
significado(existencia_deus_fe, 'A existencia de Deus como verdade revelada e objeto de fe e apresentada pela Sagrada Escritura e Tradicao.').
significado(unidade_deus, 'Ha um so e unico Deus, substancia infinita, imutavel, eterno, incompreensivel, onipotente e beatissimo.').
significado(deus_eterno, 'Deus existe desde a eternidade, sem principio nem fim, acima de toda sucessao temporal.').
significado(trindade, 'Um so Deus subsiste em tres Pessoas distintas: Pai, Filho e Espirito Santo.').

% 2.2 Sobre Jesus Cristo
significado(jesus_deus_essencia, 'Jesus Cristo e verdadeiro Deus e verdadeiro Filho de Deus unigenito por essencia, nao por adocao.').
significado(duas_naturezas, 'Jesus Cristo possui duas naturezas distintas (divina e humana) unidas hipostaticamente, sem confusao nem separacao.').
significado(vontade_propria, 'Em Cristo, a natureza divina e a humana possuem vontade e operacao proprias, mas subordinadas a um so proposito salvifica.').
significado(filho_natural, 'O Filho e gerado eternamente pelo Pai, participando da mesma natureza e substancia divina.').
significado(sacrificio_cruz, 'O sacrificio de Cristo na Cruz foi verdadeiro, voluntario e expiatoria, oferecido por toda a humanidade.').
significado(redencao, 'Cristo pela sua Paixao, Morte e Ressurreicao resgatou e reconciliou toda a humanidade com Deus.').
significado(ressurreicao, 'Cristo ressuscitou verdadeiramente dos mortos no terceiro dia com corpo glorioso e imperecivel.').
significado(ascensao, 'Cristo ascendeu aos Ceus em Corpo e Alma e se senta a direita de Deus Pai onipotente.').

% 2.3 Sobre a Criação
significado(criacao_ex_nihilo, 'Deus criou o universo inteiro do Nada, sem materia preexistente, pelo ato livre de sua vontade.').
significado(mundo_inicio_tempo, 'O mundo teve um comeco no tempo, nao e eterno, tendo sido criado por Deus em um determinado momento.').
significado(conservacao_existencia, 'Deus conserva continuamente todas as coisas criadas na existencia atraves de seu poder infinito.').

% 2.4 Sobre o Ser Humano
significado(corpo_e_alma, 'O ser humano e composto de corpo material e alma espiritual, imortal e subsistente, unidos hilemorficamente.').
significado(pecado_original, 'O pecado de Adao propaga-se a toda a humanidade por geracao, causando morte e afastamento de Deus.').
significado(homem_nao_se_redime, 'O homem caido pelo pecado nao pode redimir-se a si mesmo sem a graca salvifica de Deus.').

% 2.5 Dogmas Marianos
significado(maternidade_divina, 'Maria e verdadeiramente Mae de Deus (Theotokos), tendo gerado em carne o Verbo que e Deus.').
significado(virgindade_perpetua, 'Maria permaneceu virgem antes do parto, no parto e perpetuamente apos o parto do Filho de Deus.').
significado(imaculada_conceicao, 'Maria foi concebida sem a mancha do pecado original pela graca preventiva de Deus.').
significado(assuncao_maria, 'Maria foi elevada ao Ceu em Corpo e Alma e permanece na gloria como Mae de Deus e Rainha.').

% 2.6 Sobre o Papa e a Igreja
significado(fundacao_igreja, 'A Igreja Catolica foi fundada por Jesus Cristo para a salvacao de todos os povo ate o fim dos tempos.').
significado(primado_pedro, 'Cristo conferiu a Pedro o primado de jurisdicao sobre toda a Igreja como cabeça visivel dela.').
significado(jurisdicao_papa, 'O Papa, Bispo de Roma, titular de Pedro, possui poder de jurisdicao pleno e supremo sobre toda a Igreja.').
significado(infalibilidade_papa, 'O Papa e infalivel quando fala ex cathedra em materia de fe e costumes para toda a Igreja.').
significado(infalibilidade_igreja, 'A Igreja Apostolica e infalivel ao definir e propor doutrinas de fe e costumes para a salvacao.').

% 2.7 Sobre os Sacramentos
significado(batismo_sacramento, 'O Batismo e um Sacramento instituido por Cristo que regenera o batizado, remite o pecado original e incorpora na Igreja.').
significado(confirmacao_sacramento, 'A Confirmacao e um Sacramento que confere o Espirito Santo para o fortalecimento na fe e testemunha de Cristo.').
significado(poder_perdoar_pecados, 'A Igreja, por delegacao de Cristo, possui o poder de perdoar os pecados mortais cometidos apos o Batismo.').
significado(confissao_necessaria, 'A Confissao Sacramental para remissao de pecados mortais e de direito divino e necessaria para a salvacao.').
significado(eucaristia_sacramento, 'A Eucaristia e um Sacramento instituido por Cristo na Ultima Ceia em sinal de seu corpo e sangue.').
significado(presenca_real, 'Cristo esta verdadeira, real e substantially presente na Eucaristia pela mudanca de substancia (Transubstanciacao).').
significado(uncao_enfermos, 'A Uncao dos Enfermos e um Sacramento instituido por Cristo que confere graca para cura e perseveranca.').
significado(ordem_sacramento, 'A Ordem e um Sacramento mediante o qual homens validamente eleitos recebem o poder de exercer funcoes sagradas.').
significado(matrimonio_sacramento, 'O Matrimonio e um Sacramento que une homem e mulher em alianca permanente para constituicao de familia cristã.').

% 2.8 Sobre as Últimas Coisas
significado(morte_pecado, 'A morte corporal, experimentada por todos os homens, e consequencia e castigo do pecado de Adao.').
significado(ceu_justos, 'O Ceu (visao beatifica de Deus) e o destino dos justos que morrem em graca divina.').
significado(inferno_eterno, 'O Inferno existe e e eterno, sendo o castigo dos que morrem em pecado mortal e rejeitam a graca divina.').
significado(purgatorio_existencia, 'O Purgatorio existe como estado intermediario de purificacao para almas que morrem em amizade com Deus mas nao completamente purificadas.').
significado(volta_cristo, 'No fim do mundo, Cristo voltara visivelmente em gloria para julgar vivos e mortos e estabelecer seu reino eterno.').
significado(ressurreicao_mortos, 'No Ultimo Dia, todos os mortos ressurreirao nos corpos para comparecer perante Cristo no Juizo Final.').
significado(juizo_universal, 'Havera um Juizo Universal ao fim do mundo, em que Cristo julgara todas as nacoes e revelara o destino eterno de cada um.').
