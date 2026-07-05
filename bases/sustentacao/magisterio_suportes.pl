% ==============================================================================
% ARQUIVO: magisterio_suportes.pl
% DESCRIÇÃO: Suportes complementares dos dogmas (OPCIONAL).
%            Inclui: referências bíblicas, fundamentos axiomáticos,
%            documentação da Igreja, concílios e resoluções de objeções.
% ==============================================================================

% ==============================================================================
% SEÇÃO 1: SUPORTE BÍBLICO (suporte/2) [OPCIONAL]
% ESTRUTURA: suporte(DogmaId, Referencia)
% Passagens bíblicas que sustentam cada dogma.
% ==============================================================================

suporte(trindade, passagem(joao, 1, 1)).
suporte(trindade, passagem(mateus, 28, 19)).
suporte(maternidade_divina, passagem(lucas, 1, 43)).
suporte(primado_pedro, passagem(mateus, 16, 18)).
suporte(presenca_real, passagem(mateus, 26, 26)).

% ==============================================================================
% SEÇÃO 2: FUNDAMENTO AXIOMÁTICO (fundamento_axiomatico/2) [OPCIONAL]
% ESTRUTURA: fundamento_axiomatico(DogmaId, AxiomaTeologico)
% O axioma-fundamento teológico que sustenta o dogma (distinto de axioma_def).
% ==============================================================================

fundamento_axiomatico(trindade, 'O Verbo era Deus (Joao 1:1) e a formula batismal (Mt 28:19) indicam a pluralidade de Pessoas na Unidade de Deus.').

% ==============================================================================
% SEÇÃO 3: SUPORTE DOCUMENTAL E CONCÍLIOS (suporte_documento/2, concilio/2) [OPCIONAL]
% ESTRUTURA: suporte_documento(DogmaId, Documento)
% ESTRUTURA: concilio(DogmaId, NomeConcilio)
% Documentos da Igreja e Concílios ecumênicos que definiram cada dogma.
% ==============================================================================

% Documentação para Trindade
suporte_documento(trindade, 'Credo de Niceia (325)').
suporte_documento(trindade, 'Catecismo da Igreja Catolica, nn. 232-267').
concilio(trindade, 'Primeiro Concilio de Niceia (325)').
concilio(trindade, 'Concilio de Constantinopla (381)').
