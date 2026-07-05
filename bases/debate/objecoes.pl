% ==============================================================================
% ARQUIVO: objecoes.pl
% DESCRIÇÃO: Objeções teológicas contra dogmas com resoluções.
%            22 das objeções teológicas mais famosas e importantes da história.
% ==============================================================================

:- discontiguous tipo_heresia/3.
:- discontiguous suporte_argumento/2.

% ==============================================================================
% SEÇÃO 1: OBJEÇÕES (objecao/3)
% ESTRUTURA: objecao(DogmaAlvo, ReferenciaBiblica, ArgumentoId)
% Argumentos que aparentemente contradizem um dogma.
% ==============================================================================

% --- Objeções contra TRINDADE (4) ---
objecao(trindade, passagem(proverbios, 8, 22), arianismo_subordinacionismo).
objecao(trindade, passagem(deuteronomio, 6, 4), monarquianismo_dinamico).
objecao(trindade, passagem('1_corintios', 8, 6), tritheismo).
objecao(trindade, passagem('1_joao', 1, 1), monarquianismo_modal).

% --- Objeções contra JESUS CRISTO - Naturezas (4) ---
objecao(jesus_deus_essencia, passagem('1_joao', 4, 2), docetismo).
objecao(duas_naturezas, passagem(joao, 1, 14), nestorianismo).
objecao(duas_naturezas, passagem(colossenses, 1, 19), eutiquianismo).
objecao(jesus_deus_essencia, passagem(romanos, 1, 4), adocionismo).

% --- Objeções contra JESUS CRISTO - Ressurreição (1) ---
objecao(ressurreicao, passagem('1_corintios', 15, 13), ceticismo_ressurreicao).

% --- Objeções contra SACRAMENTOS - Eucaristia (3) ---
objecao(presenca_real, passagem(lucas, 22, 19), simbolismo_eucaristia).
objecao(presenca_real, passagem(mateus, 26, 28), memorialismo_protestante).
objecao(eucaristia_sacramento, passagem(joao, 6, 51), antropofagia_aparente).

% --- Objeções contra SACRAMENTOS - Batismo (1) ---
objecao(batismo_sacramento, passagem(romanos, 10, 9), solifidianismo_batismo).

% --- Objeções contra SACRAMENTOS - Penitência (1) ---
objecao(confissao_necessaria, passagem(joao, 20, 22), sola_scriptura_confissao).

% --- Objeções contra SACRAMENTOS - Número (1) ---
objecao(confirmacao_sacramento, passagem(efesios, 4, 5), sacramentos_apenas_dois).

% --- Objeções contra MARIA - Virgindade (2) ---
objecao(virgindade_perpetua, passagem(mateus, 13, 55), irmaos_de_jesus).
objecao(virgindade_perpetua, passagem(mateus, 1, 25), consumacao_matrimonio).

% --- Objeções contra MARIA - Assunção (1) ---
objecao(assuncao_maria, passagem(romanos, 5, 12), morte_universal_pecado).

% --- Objeções contra MARIA - Imaculada Conceição (1) ---
objecao(imaculada_conceicao, passagem(romanos, 3, 23), universalidade_pecado).

% --- Objeções contra PAPA E IGREJA (2) ---
objecao(infalibilidade_papa, passagem('1_corintios', 11, 3), sola_scriptura_papa).
objecao(primado_pedro, passagem('1_timoteo', 3, 2), qualificacoes_episcopo).

% --- Objeções contra PURGATÓRIO (1) ---
objecao(purgatorio_existencia, passagem(lucas, 23, 43), nenhum_lugar_intermediario).

% --- Objeções contra CRIAÇÃO (2) ---
objecao(criacao_ex_nihilo, passagem(genesis, 1, 2), dualismo_gnostico).
objecao(criacao_ex_nihilo, passagem(genesis, 1, 28), evolucao_ateista).

% --- Objeções contra LIVRE ARBÍTRIO (3) ---
objecao(corpo_e_alma, passagem(romanos, 9, 15), pelagianismo_livre_arbítrio).
objecao(redencao, passagem(efesios, 2, 8), jansenismo_graca).
objecao(redencao, passagem(romanos, 9, 18), calvinismo_predestinacao).

% ==============================================================================
% SEÇÃO 2: METADADOS DE ARGUMENTOS
% ESTRUTURA: tipo_heresia(ArgumentoId, NomeHeresia, PeríodoHistórico)
% ESTRUTURA: suporte_argumento(ArgumentoId, FonteHistórica)
% ==============================================================================

% Trindade
tipo_heresia(arianismo_subordinacionismo, 'Arianismo', 'Século IV').
tipo_heresia(monarquianismo_dinamico, 'Monarquianismo Dinâmico', 'Século II-III').
tipo_heresia(tritheismo, 'Tritheismo', 'Diversos períodos').
tipo_heresia(monarquianismo_modal, 'Sabelianismo/Monarquianismo Modal', 'Século III+').

suporte_argumento(arianismo_subordinacionismo, 'Ário de Alexandria (256-336 d.C.)').
suporte_argumento(monarquianismo_dinamico, 'Tertuliano e teólogos do século II-III').
suporte_argumento(tritheismo, 'Crítica protestante (séc. XVI-XVII)').
suporte_argumento(monarquianismo_modal, 'Sabélio de Roma (séc. III)').

% Jesus Cristo - Naturezas
tipo_heresia(docetismo, 'Docetismo', 'Século I-II').
tipo_heresia(nestorianismo, 'Nestorianismo', 'Século V').
tipo_heresia(eutiquianismo, 'Eutiquianismo/Monofisismo', 'Século V').
tipo_heresia(adocionismo, 'Adocionismo', 'Século I-II').

suporte_argumento(docetismo, 'Docetas gnósticos, influência platônica').
suporte_argumento(nestorianismo, 'Nestório, Bispo de Constantinopla (381-451)').
suporte_argumento(eutiquianismo, 'Eutiques, monge de Constantinopla (378-454)').
suporte_argumento(adocionismo, 'Ebionitas (séc. I-II), teólogos islâmicos').

% Jesus Cristo - Ressurreição
tipo_heresia(ceticismo_ressurreicao, 'Ceticismo Histórico', 'Século XIX+').
suporte_argumento(ceticismo_ressurreicao, 'Crítica bíblica moderna (Bultmann, Strauss)').

% Sacramentos
tipo_heresia(simbolismo_eucaristia, 'Sacramentarianismo Protestante', 'Século XVI+').
tipo_heresia(memorialismo_protestante, 'Memorialismo (Zuínglio)', 'Século XVI+').
tipo_heresia(antropofagia_aparente, 'Objeção Popular', 'Diversos períodos').
tipo_heresia(solifidianismo_batismo, 'Solifidianismo Protestante', 'Século XVI+').
tipo_heresia(sola_scriptura_confissao, 'Sola Scriptura', 'Século XVI+').
tipo_heresia(sacramentos_apenas_dois, 'Protestantismo', 'Século XVI+').

suporte_argumento(simbolismo_eucaristia, 'Teólogos protestantes (Calvino, Zuínglio)').
suporte_argumento(memorialismo_protestante, 'Huldrych Zuínglio').
suporte_argumento(antropofagia_aparente, 'Crítico de Rómulo (crítico pagão do século II)').
suporte_argumento(solifidianismo_batismo, 'Martinho Lutero, teólogos protestantes').
suporte_argumento(sola_scriptura_confissao, 'Protestantismo, crítica evangélica').
suporte_argumento(sacramentos_apenas_dois, 'Lutero e tradição reformada').

% Maria
tipo_heresia(irmaos_de_jesus, 'Protestantismo/Ceticismo', 'Século XVI+').
tipo_heresia(consumacao_matrimonio, 'Interpretação Literal Medieval', 'Diversos períodos').
tipo_heresia(morte_universal_pecado, 'Arminianismo', 'Século XVII+').
tipo_heresia(universalidade_pecado, 'Pelagianismo mal entendido', 'Diversos períodos').

suporte_argumento(irmaos_de_jesus, 'Reforma Protestante (Lutero, Calvino)').
suporte_argumento(consumacao_matrimonio, 'Interpretação literal de Mateus 1:25').
suporte_argumento(morte_universal_pecado, 'Jacobus Arminius').
suporte_argumento(universalidade_pecado, 'Má leitura de Romanos 3:23').

% Papa e Igreja
tipo_heresia(sola_scriptura_papa, 'Sola Scriptura', 'Século XVI+').
tipo_heresia(qualificacoes_episcopo, 'Crítica Protestante', 'Século XVI+').

suporte_argumento(sola_scriptura_papa, 'Reforma Protestante').
suporte_argumento(qualificacoes_episcopo, 'Leitura de 1 Timóteo 3:2').

% Purgatório
tipo_heresia(nenhum_lugar_intermediario, 'Protestantismo', 'Século XVI+').
suporte_argumento(nenhum_lugar_intermediario, 'Negação protestante do Purgatório').

% Criação
tipo_heresia(dualismo_gnostico, 'Gnosticismo', 'Século II').
tipo_heresia(evolucao_ateista, 'Evolucionismo Ateu', 'Século XIX+').

suporte_argumento(dualismo_gnostico, 'Sistemas gnósticos antigos').
suporte_argumento(evolucao_ateista, 'Darwinismo materialista (séculos XIX-XX)').

% Livre Arbítrio
tipo_heresia(pelagianismo_livre_arbítrio, 'Pelagianismo', 'Século IV-V').
tipo_heresia(jansenismo_graca, 'Jansenismo', 'Século XVII').
tipo_heresia(calvinismo_predestinacao, 'Calvinismo', 'Século XVI+').

suporte_argumento(pelagianismo_livre_arbítrio, 'Pelágio de Bretanha (360-418)').
suporte_argumento(jansenismo_graca, 'Cornelius Jansen (1585-1638)').
suporte_argumento(calvinismo_predestinacao, 'João Calvino').

% ==============================================================================
% SEÇÃO 3: RESOLUÇÕES (resolucao/2)
% ESTRUTURA: resolucao(ArgumentoId, ExplicacaoTeologica)
% Explicações teológicas que resolvem aparentes contradições.
% ==============================================================================

resolucao(arianismo_subordinacionismo, 'Concílio de Niceia (325) definiu a consubstancialidade. "Criado" em Pv 8:22 refere-se à Encarnação. João 14:28 expressa o estado de humilhação, não a natureza eterna.').

resolucao(monarquianismo_dinamico, 'A unidade divina é de natureza, não de número. São três Pessoas em uma única Substância. Deuteronômio 6:4 expressa monoteísmo, não monarquismo.').

resolucao(tritheismo, 'As três Pessoas não dividem a substância divina; cada uma é integralmente Deus. A operação é una ad extra; ad intra há relações reais distintas.').

resolucao(monarquianismo_modal, 'O Batismo mostra simultaneamente Pai (voz), Filho (corpo) e Espírito Santo (pomba). Se fossem modos sucessivos, não haveria manifestação simultânea.').

resolucao(docetismo, '1 João 1:1-2 afirma que o Verbo foi "tocado", tido como real. Hebreus 2:14-17 diz que Cristo assumiu realmente a natureza humana. Seu sofrimento foi real (Hebreus 5:8-9).').

resolucao(nestorianismo, 'Concílio de Éfeso (431) condenou o nestorianismo. Cristo é uma única Pessoa (hypostase), o Lógos, em duas naturezas. Maria é Theotokos (Mãe de Deus).').

resolucao(eutiquianismo, 'Concílio de Calcedônia (451) definiu que Cristo tem duas naturezas distintas mas inseparáveis, não confundidas. Uma única natureza negaria a verdadeira humanidade.').

resolucao(adocionismo, 'João 1:1, 1:3 afirmam que o Lógos preexistia e criava todas as coisas. Colossenses 1:15 o descreve como imagem do Pai desde eternidade.').

resolucao(ceticismo_ressurreicao, 'Primeira Epístola de Clemente (95 d.C.) e Inácio de Antioquia (110 d.C.) atestam ressurreição histórica. Transformação dos apóstolos de covardes a mártires é evidência. Aparições a 500+ testemunhas (1 Cor 15:6).').

resolucao(simbolismo_eucaristia, 'Cristo disse "Isto É meu corpo", não "Isto representa". Transubstanciação foi definida em Latrão IV (1215). João 6:51-56 afirma "comer minha carne e beber meu sangue".').

resolucao(memorialismo_protestante, 'Instituição de Cristo: "Isto fiz em memória de meu corpo". Memória é verdade presente, não meramente simbólica. A Eucaristia é sacrifício real (Malaquias 1:11).').

resolucao(antropofagia_aparente, 'Os apóstolos compreenderam a realeza de Cristo na Eucaristia (João 6:60-66). Canibalismo é consumo selvagem; Eucaristia é comunhão sacramental venerável.').

resolucao(solifidianismo_batismo, 'Atos 2:38 liga fé ao Batismo para remissão. 1 Pedro 3:21 afirma que o Batismo salva. Fé sem obras é morta (Tiago 2:26).').

resolucao(sola_scriptura_confissao, 'João 20:22-23 confere explicitamente poder de absolver. Tiago 5:16 exorta confissão mútua. Tradição Apostólica (Hipólito) atesta confissão desde o século III.').

resolucao(sacramentos_apenas_dois, 'Trento (1547) definiu 7 sacramentos como divinos. Cada um tem matéria, forma, intenção e pode ser rastreado ao ministério de Cristo ou Apóstolos.').

resolucao(irmaos_de_jesus, '"Irmãos" em Mateus 13:55 refere-se provavelmente a primos (termo aramaico "ach" = parente próximo). Protoevangelium de Tiago (século II) atesta perpetuidade desde o início.').

resolucao(consumacao_matrimonio, 'Mateus 1:25 ("até que") não implica consumação. Muitos textos usam "até" sem implicação de mudança (Mateus 28:20). Caráter sacramental de Maria transcende casamento normal.').

resolucao(morte_universal_pecado, 'Romanos 5:12 diz morte veio através do pecado, não que todos pecaram pessoalmente. Igreja sempre ensinou isenção de Maria por privilégio especial divino.').

resolucao(universalidade_pecado, 'Roma 3:23 refere-se a todos os seres humanos que alcançam uso da razão. Maria recebeu preservação preventiva (preservatio) pela graça, não remissão posterior.').

resolucao(sola_scriptura_papa, 'Mateus 16:17-19 confere a Pedro primado sobre a Igreja. Lc 22:31-32 promete que fé de Pedro não falhará. Tradição desde Clemente I (96 d.C.) atesta primado de Roma.').

resolucao(qualificacoes_episcopo, 'Uma esposa é "esposa de um marido único" (priscamente casado). Isso não exclui sucessão apostólica ou jurisdição universal do Sucessor de Pedro sobre todos os bispos.').

resolucao(nenhum_lugar_intermediario, '2 Macabeus 12:46 ordena orações pelos mortos. Mateus 12:32 indica pecados sobre os quais não há remissão "neste mundo, nem no vindouro" - implicando remissão possível depois. 1 Coríntios 3:13-15 fala de "fogo" que prova as obras.').

resolucao(dualismo_gnostico, 'Gênesis 1 afirma explicitamente que Deus "viu que era bom" ao criar matéria. Dualismo é contrário ao texto. Concílio de Niceia I confirmou bondade da criação,').

resolucao(evolucao_ateista, 'Evolução como processo natural é compatível com fé: Deus pode operar através de causas secundárias. Mas origem da primeira vida e alma racional exigem criação especial. João Paulo II afirmou compatibilidade em 1996.').

resolucao(pelagianismo_livre_arbítrio, 'Concílio de Orange (529) definiu que graça precede livre arbítrio. Romanos 9:15 mostra que Deus tem misericórdia soberana, mas oferece a todos. Livre arbítrio existe mas necessita graça conatural.').

resolucao(jansenismo_graca, 'Efésios 2:8 afirma salvação por graça através de fé. Mas fé é obra nossa com graça (cooperação). Inocêncio X (1653) condenou o jansenismo: graça oferecida a todos universalmente.').

resolucao(calvinismo_predestinacao, 'Romanos 9:18 refere-se a Faraó cujo coração Deus endureceu (após recusa voluntária). Predestinação é compatível com livre arbítrio (Deus conhece futuros atos livres). 1 Timóteo 2:4 afirma que Deus quer todos salvos.').
