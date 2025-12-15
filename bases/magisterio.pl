% ==============================================================================
% ARQUIVO: magisterio.pl
% DESCRIÇÃO: Definições dogmáticas e resoluções teológicas de conflitos.
% ==============================================================================

% 1. DEFINIÇÃO DOS DOGMAS
% dogma(Id, NomeLegivel).
dogma(trindade, 'Santissima Trindade').
dogma(imaculada_conceicao, 'Imaculada Conceicao de Maria').

% 2. SUPORTE BÍBLICO (A Defesa Positiva)
% suporte(Dogma, Referencia).
suporte(trindade, passagem(joao, 1, 1)).      % Jesus é Deus
suporte(trindade, passagem(mateus, 28, 19)).  % Fórmula Trinitária

% 3. RESOLUÇÃO DE OBJEÇÕES (A Jurisprudência)
% resolucao(ArgumentoDaObjecao, ExplicacaoTeologica).

% Resolução para João 14:28 (Pai maior que eu)
% Explicação: Jesus falava enquanto homem. A desigualdade é na humanidade, não na divindade.
resolucao(desigualdade_divina, 'Distincao entre Natureza Humana e Divina (Uniao Hipostatica)').

% Resolução para Deuteronômio 6:4 (Deus é um)
% Explicação: A unidade é de Substância (Ousia), a trindade é de Pessoas (Hypostasis).
resolucao(unicidade_numerica_estrita, 'Unidade de Substancia vs Pluralidade de Pessoas').