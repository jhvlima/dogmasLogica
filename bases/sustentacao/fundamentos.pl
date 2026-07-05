% ==============================================================================
% ARQUIVO: fundamentos.pl
% DESCRIÇÃO: Proposições derivadas de axiomas + passagens bíblicas específicas.
%            Um FUNDAMENTO é distinguido de um AXIOMA por requerer suporte bíblico.
% DEPENDÊNCIAS: escrituras.pl (para definições de passagem/4)
% ==============================================================================

:- discontiguous fundamento/6.

% fundamento(Id, Descrição, [AxiomasSustentadores], [PassagensBíblicas], Categorias, Peso)
%
% Um FUNDAMENTO é uma proposição que necessita de:
% 1. Um ou mais axiomas como fundação lógica
% 2. Passagens bíblicas específicas que o sustentam
%
% Isso os distingue de PRESSUPOSTOS/AXIOMAS do modelo, que não carregam passagens específicas.

% ==============================================================================
% FUNDAMENTO 1: HUMANIDADE CRIADA EM COMUNHÃO COM DEUS
% ==============================================================================
% Sustentado por: Axioma "bíblia_verdadeira"
% Passagens: Gênesis 1:27 (criação à imagem de Deus), Gênesis 2:8 (comunhão no Éden)

fundamento(humano_criado_em_comunhao,
           'A Bíblia declara que o ser humano foi criado em comunhão com Deus.',
           [biblia_verdadeira],                % Axiomas que sustentam este fundamento
           [passagem(genesis, 1, 27),          % "Criou Deus o homem à sua imagem"
            passagem(genesis, 2, 8)],          % "E plantou o SENHOR Deus um jardim"
           [humanidade, criacao, relacao_divina],
           8).

% ==============================================================================
% FUNDAMENTO 2: HUMANIDADE ESCOLHEU AFASTAR-SE DE DEUS
% ==============================================================================
% Sustentado por: Axioma "bíblia_verdadeira"
% Passagens: Gênesis 3:1-7 (tentação e escolha), Romanos 5:12 (propagação do pecado)

fundamento(humano_escolheu_afastar,
           'A Bíblia diz que o ser humano escolheu se afastar de Deus (Pecado Original).',
           [biblia_verdadeira],                % Axiomas que sustentam este fundamento
           [passagem(genesis, 3, 1),           % "A serpente era o mais astuto"
            passagem(genesis, 3, 6),           % "Tomou do fruto da árvore"
            passagem(romanos, 5, 12)],         % "Portanto, como por um homem entrou o pecado"
           [humanidade, pecado, livre_arbítrio],
           9).

% ==============================================================================
% FUNDAMENTO 3: JESUS RECONCILIOU A HUMANIDADE COM DEUS
% ==============================================================================
% Sustentado por: Axiomas "evangelhos_palavra_de_deus" e "jesus_existe"
% Passagens: João 3:16 (propósito da encarnação), Romanos 5:10 (reconciliação)

fundamento(jesus_reconciliou_humanidade,
           'O Evangelho declara que Jesus reconciliou a humanidade com Deus.',
           [evangelhos_palavra_de_deus, jesus_existe],  % Axiomas que sustentam este fundamento
           [passagem(joao, 3, 16),             % "Deus amou o mundo"
            passagem(romanos, 5, 10),          % "Éramos inimigos, reconciliados pela morte"
            passagem(colossenses, 1, 20)],     % "Aprouve a Deus reconciliar todas as coisas"
           [jesus, reconciliacao, salvacao],
           10).
