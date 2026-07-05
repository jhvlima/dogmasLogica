# Relatorio de Pesquisa: {{dogma_nome}}

## Entrada do Autor

- Dogma: `{{dogma_id}}`
- Consideracoes pessoais:
  - {{consideracao_1}}
  - {{consideracao_2}}

## Foco do Dia

Objetivo principal: encontrar ou confirmar uma definicao magisterial com fonte publica verificavel.

## Consultas Planejadas

1. `{{query_1}}`
2. `{{query_2}}`
3. `{{query_3}}`

Requests planejados: `{{n}}`

## Candidatos de Fonte

### {{fonte_titulo}}

- Status: `candidate`
- Avaliacao: `forte | util | fraca | descartar`
- Autor: {{autor}}
- Ano: {{ano}}
- Referencia: {{referencia}}
- URL publica: {{url}}
- Citacao curta: "{{citacao_curta}}"
- Relacao com o dogma: {{relacao}}
- Observacao de revisao: {{observacao}}

## Sintese de Estudo

{{sintese_curta}}

## Resposta as Consideracoes Pessoais

- Consideracao: {{consideracao}}
- O que as fontes ajudam a esclarecer: {{nota}}
- O que ainda precisa de estudo: {{pendencia}}

## Rascunho Prolog Nao Aprovado

```prolog
% RASCUNHO: promover somente apos revisao humana.
fonte_magisterial({{fonte_id}}, '{{titulo}}', '{{autor}}', '{{ano}}', '{{referencia}}', '{{url}}').
dogma_fonte({{dogma_id}}, {{fonte_id}}, definicao, '{{nota}}').
citacao_fonte({{fonte_id}}, '{{referencia}}', '{{citacao_curta}}').
% status_revisao({{fonte_id}}, aprovado_manual). % adicionar somente apos aprovacao.
```

## Checklist de Revisao Humana

- [ ] A fonte e oficial ou suficientemente confiavel?
- [ ] A referencia foi conferida no documento publico?
- [ ] A citacao curta e fiel ao documento?
- [ ] A fonte sustenta diretamente o dogma?
- [ ] O texto nao extrapola o que a fonte afirma?
- [ ] A promocao para Prolog foi decidida manualmente?
