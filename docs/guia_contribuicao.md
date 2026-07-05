# Guia de Contribuição e Modelagem em Prolog

Este guia detalha as convenções de modelagem lógica em Prolog utilizadas no projeto. O fluxo atual prioriza a definição magisterial aprovada e trata suportes, objeções, pressupostos e revelações base como camadas progressivas de estudo.

## ✍️ Como Contribuir (Modelo de Preenchimento Básico)

**1. `magisterio_definicoes.pl` — Defina dogma e significado:**
```prolog
dogma(id_dogma, 'Nome do Dogma').
significado(id_dogma, 'Descrição teológica resumida.').
```

**2. `fontes_magisteriais.pl` — Cadastre fonte magisterial aprovada:**
```prolog
fonte_magisterial(fonte_id, 'Documento', 'Autor', 'Ano', 'Referência', 'https://url-publica').
dogma_fonte(id_dogma, fonte_id, definicao, 'Nota de uso da fonte.').
citacao_fonte(fonte_id, 'Referência', 'Trecho curto aprovado manualmente.').
status_revisao(fonte_id, aprovado_manual).
```

**3. `definicoes_dogmaticas.pl` — Registre a definição dogmática:**
```prolog
definicao_dogmatica(id_dogma,
                    'Texto da definição ou paráfrase fiel.',
                    fonte_id,
                    definitivo,
                    'Como a definição se conecta à Revelação.').
```

**4. `magisterio_suportes.pl` e `escrituras.pl` — Adicione âncoras bíblicas se já estudadas:**
```prolog
passagem(livro, capitulo, versiculo, conteudo_simbolico).
suporte(id_dogma, passagem(livro, capitulo, versiculo)).
```

**5. `objecoes.pl` — Cadastre argumentos contrários e resoluções, se já estudados:**
```prolog
objecao(id_dogma, passagem(livro, capitulo, versiculo), id_argumento).
resolucao(id_argumento, 'Explicação Teológica').
```

**6. `pressupostos.pl` e `revelacao.pl` — Acrescente camadas explicativas quando fizer sentido:**
```prolog
pressuposto_essencial(id_dogma, magisterio_autoritativo).
dogma_explica_revelacao(id_dogma, revelacao_id, via_unidade_da_revelacao, 'Nota.').
```

---

## 📚 Os Quatro Pilares de um Dogma

Na arquitetura clássica, o sistema enxergava quatro pilares lógicos principais. Eles continuam existindo, mas agora ficam subordinados ao núcleo magisterial:

| Pilar | Arquivo | Sintaxe |
|-------|---------|---------|
| **Fato** | `magisterio_definicoes.pl` | `dogma(id, 'Nome')` |
| **Definição** | `definicoes_dogmaticas.pl` | `definicao_dogmatica(id, texto, fonte, grau, conexao)` |
| **Fonte** | `fontes_magisteriais.pl` | `fonte_magisterial(...)` + `status_revisao(..., aprovado_manual)` |
| **Suporte** | `magisterio_suportes.pl` + `escrituras.pl` | `suporte(id, passagem(...))` |
| **Objeção** | `objecoes.pl` | `objecao(id, passagem(...), id_critica)` |
| **Resolução** | `objecoes.pl` | `resolucao(id_critica, 'Texto')` |

### Exemplo de Preenchimento Clássico: Ressurreição de Cristo

```prolog
% Suporte bíblico
passagem(mateus, 28, 6, ressuscitou_como_disse).

% Objeção comum
objecao(ressurreicao, passagem(mateus, 28, 13), roubo_do_corpo).

% Resolução teológica
resolucao(roubo_do_corpo, 'O testemunho dos mártires e as aparições confirmam a vitória sobre a morte').
```

---

## ⚖️ Lógica Deôntica (Mandamentos)

Para regras condicionais que geram suposições, utilize a seguinte estrutura:

```prolog
eh_bom(X) :-
    cumpre_condicao_A(X),
    cumpre_condicao_B(X).
```

### Dogma vs. Suposição
- **Dogmas**: Constantes — `dogma(...)`
- **Suposições**: Variáveis — `hipotese(...)` com controle via `ativa(...)`

---

## ✅ Checklist de Boas Práticas

- [ ] Use minúsculas para átomos: `jesus`, `maria`, `analisar`
- [ ] Use maiúsculas para variáveis: `Pessoa`, `X`, `Dogma`
- [ ] Termine toda linha com ponto (`.`)
- [ ] Use aspas simples (`'...'`) para textos com espaços
- [ ] Para debug no SWI-Prolog: execute `?- gtrace.` antes da consulta

### Operadores Lógicos em Prolog (Referência Rápida)

| Símbolo | Significado |
|---------|-------------|
| `:-` | Porque / Depende de |
| `,` | E |
| `;` | Ou |
| `\+` | Não |
| `fail` | Contradição |

---

Que este tribunal lógico ajude a iluminar a harmonia entre a Fé e a Razão.
