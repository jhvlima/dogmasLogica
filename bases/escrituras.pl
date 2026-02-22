% ==============================================================================
% ARQUIVO: escritura.pl
% DESCRIÇÃO: Base de dados de versículos bíblicos (Fatos).
% FORMATO: passagem(Livro, Capitulo, Versiculo, ConteudoSimbolico).
% ==============================================================================

% ==============================================================================
% Novo Testamento
% ==============================================================================

% --- Evangelho de João ---
passagem(joao, 1, 1, o_verbo_era_deus).
passagem(joao, 10, 30, eu_e_pai_somos_um).
passagem(joao, 14, 28, pai_maior_que_eu).

% --- Mateus ---
% Suporte para Primado de Pedro
passagem(mateus, 16, 18, tu_es_pedro_pedra).
% Suporte para Eucaristia
passagem(mateus, 26, 26, isto_e_o_meu_corpo).
% Suporte para Trindade
passagem(mateus, 28, 19, batizai_em_nome_da_trindade).
% Suporte para Ressurreição
passagem(mateus, 28, 6, ele_nao_esta_aqui_ressuscitou).

% --- Lucas ---
% Suporte para Maternidade Divina
passagem(lucas, 1, 43, mae_do_meu_senhor).

% ==============================================================================
% Antigo Testamento
% ==============================================================================

% --- Deuteronômio ---
passagem(deuteronomio, 6, 4, o_senhor_e_um).

