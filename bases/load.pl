% ==============================================================================
% ARQUIVO: bases/load.pl
% DESCRIÇÃO: Carregador central das bases Prolog por domínio.
% ==============================================================================

% Núcleo dogmático: dogmas, fontes aprovadas e definições magisteriais.
:- consult('bases/nucleo/magisterio_definicoes.pl').
:- consult('bases/nucleo/fontes_magisteriais.pl').
:- consult('bases/nucleo/definicoes_dogmaticas.pl').

% Revelação e pressupostos de assentimento.
:- consult('bases/revelacao/escrituras.pl').
:- consult('bases/revelacao/pressupostos.pl').
:- consult('bases/revelacao/revelacao.pl').

% Sustentação complementar e rastreamento causal.
:- consult('bases/sustentacao/axiomas.pl').
:- consult('bases/sustentacao/fundamentos.pl').
:- consult('bases/sustentacao/magisterio_suportes.pl').

% Debate teológico e hipóteses pessoais.
:- consult('bases/debate/objecoes.pl').
:- consult('bases/pessoal/hipoteses.pl').
