# Navegação e layout — lista × detalhe

Convenção de **UX transversal** da [OneRF B2B Platform](PLATFORM_VISION.md) (shell SPA): como o usuário passa da **lista** ao **detalhe** (criar, editar, visualizar).

**Escopo:** norma **platform** — válida em qualquer app B2B OneRF. Catálogo de telas por produto: ex. [b2b_analytics/docs/UI_NAVIGATION.md](../../../b2b_analytics/docs/UI_NAVIGATION.md) (Analytics IoT).

Relacionado: [API_CONTRACT.md](API_CONTRACT.md) (`ListResponse`).

---

## 1. Decisão (ADR)

| Item | Escolha |
|------|---------|
| **Padrão default** | Lista e detalhe em **rotas separadas**, com URL estável e breadcrumb |
| **Exceção** | **Modal** (ou drawer pequeno) só para CRUD leve de catálogo, sem conteúdo rico |
| **URLs** | `/recurso`, `/recurso/novo`, `/recurso/:id` — sem sufixo `*/view` |
| **Estado** | Aceito — aplicar em todo módulo novo ou refatorado |

**Regra em uma frase:** *rota por padrão; modal só quando o detalhe é trivial e não precisa de URL.*

---

## 2. Por que rota como padrão

- Formulários e fluxos complexos (entidades de **product** com árvore, gráficos, dashboards).
- **Voltar**, **favoritar**, **compartilhar** link (suporte, auditoria).
- Um modelo mental único: clique no **nome** ou na **linha** → nova URL → tela de detalhe.

Modais continuam úteis para **confirmações**, **seletores** e **catálogos simples** — não como substituto de página de edição pesada.

---

## 3. Quando usar cada padrão

### 3.1 Rota dedicada (default)

Use quando **qualquer** destas for verdadeira:

- Muitos campos, abas, uploads ou JSON avançado.
- Conteúdo secundário: árvore, gráfico, timeline longa, polling.
- O usuário pode trabalhar minutos na tela.
- Link direto ou refresh deve preservar o contexto.

**Rotas:**

| Ação | Padrão de URL |
|------|----------------|
| Lista | `/recurso` |
| Novo | `/recurso/novo` |
| Editar / detalhe | `/recurso/:id` |
| Sub-recurso | `/recurso/:id/sub-rota` ou query documentada |

**UX obrigatória:**

- Breadcrumb: `Lista > Detalhe` ou `Lista > Novo` (derivado da rota).
- Ações primárias no mesmo lugar (ex.: canto superior direito do card: Salvar, Excluir).
- **Nome** (label principal) é link para `/recurso/:id`; **linha inteira** clicável com o mesmo destino.
- Botão voltar: `navigate(-1)` ou link explícito para `/recurso`.

#### 3.1.1 Lista → detalhe (padrão visual)

| Elemento | Regra |
|----------|--------|
| Coluna principal | **Nome** (ou label humano) é `<Link>` para `/recurso/:id` |
| Linha | Clicável (`cursor: pointer`); mesmo destino do link do nome |
| Coluna `_id` (Mongo) | **Não** na lista — ID técnico só no **formulário de detalhe** (campo readonly) |
| Outras colunas | Identificadores **legíveis** (email, MAC, legacyId, tipo, …) |
| Coluna Ações | Só **sub-rotas** com label específico; **sem** link/botão genérico "Editar" |
| Adicionar | Botão no topo do card → `/recurso/novo` |

**Anti-padrões:** coluna ObjectId na lista; link "Editar" numa coluna + linha clicável; link **só** no ObjectId; botão que abre detalhe em módulo com rota dedicada.

#### 3.1.2 Listas — busca, ordenação, paginação (server-side)

Todas as listas SPA usam o mesmo contrato HTTP e componentes compartilhados.

**Query params na URL** (sincronizados com `useSearchParams`):

| Param | Default | Descrição |
|-------|---------|-----------|
| `q` | — | Busca textual |
| `sort` | default do recurso | Coluna ordenável (whitelist no backend) |
| `order` | `asc` | `asc` \| `desc` |
| `page` | `1` | Página 1-based |
| `pageSize` | `25` | Itens por página (máx. 100) |

**Resposta:** ver [API_CONTRACT.md](API_CONTRACT.md) (`ListResponse`).

**UX:**

- Busca com debounce ~300 ms; placeholder **Filtrar…**
- Cabeçalhos sortable; clique alterna asc/desc
- Footer: **Mostrando X–Y de Z**; seletor 10/25/50; Anterior/Próximo
- Refresh em background mantém tabela visível
- Empty: **Nenhum registro** vs **Nenhum resultado para o filtro**

### 3.2 Modal na lista (exceção)

Use quando **todas** forem verdadeiras (ou quase):

| Critério | Modal OK |
|----------|----------|
| Campos | Poucos (≈ 1–5), sem abas |
| Conteúdo extra | Sem árvore, gráfico, timeline, polling |
| URL | Link direto ao detalhe não é requisito frequente |
| Fluxo | Edição rápida no contexto da lista |

### 3.3 Drawer + URL (meio-termo)

Exemplo **platform** — Jobs (UI do runtime):

- Lista em `/jobs`.
- Detalhe em `/jobs/:id` **ou** drawer full-height que **atualiza a URL** ao abrir.
- Fechar volta para `/jobs` (`navigate(-1)` ou link na lista).

### 3.4 Diálogos utilitários (fora da matriz lista/detalhe)

- Confirmar exclusão.
- Escolher item em picker.
- Mensagens de erro/aviso.

---

## 4. Matriz visual

```
Complexidade do detalhe ↑
│
│  Página dedicada (/recurso/:id)     ← DEFAULT
│       ↑
│       │     Drawer + URL sync       ← meio-termo
│       │
│  Modal na lista                     ← só CRUD leve
│
└────────────────────────────────→ Necessidade de URL / compartilhar
```

---

## 5. Checklist (novo módulo)

- [ ] Lista em `/recurso` com tabela ou cards consistentes
- [ ] Detalhe/novo em rotas distintas (não só `useState` sem URL)
- [ ] Breadcrumb ou título de rota deixa claro onde o usuário está
- [ ] "Adicionar" abre `/recurso/novo`
- [ ] **Nome** é link **e** linha é clicável para `/recurso/:id`
- [ ] Sem coluna `_id` na lista; ID técnico no formulário de detalhe
- [ ] Busca, ordenação e paginação server-side (§3.1.2)
- [ ] Modal, se usado, cabe em ~1 viewport

---

## 6. Implementação (SPA)

### 6.1 React Router

- Um `App` com rotas aninhadas; navegação interna via React Router (sem full reload).
- Parâmetros: `useParams()` para `:id`; React Query (ou equivalente) para dados.

### 6.2 Breadcrumb

Componente React derivado da rota, por exemplo:

```
Início > Utilizadores > joao@cliente.com
```

### 6.3 Componentes compartilhados (shell)

| Componente | Uso |
|------------|-----|
| `listDetailRow.tsx` | Listas com rota de detalhe (§3.1.1) |
| `useListQuery`, `EntityListLayout`, `SortableTh`, `ListPagination` | Listas server-side (§3.1.2) |
| Layout de página detalhe | Card + header com breadcrumb + ações |
| Modal | Confirmações e pickers |

**Pastas alvo:** `frontend/src/app/`, `frontend/src/components/`.

---

## 7. Anti-padrões

- Modal grande com scroll longo, abas e **polling** como editor principal.
- Duas formas de abrir detalhe no mesmo módulo (ex.: link "Editar" **e** linha com destinos diferentes).
- `window.location` full reload para navegação entre telas da mesma SPA.
- Detalhe só em `useState` local sem URL quando o fluxo precisa de link compartilhável.
- Coluna ObjectId ou botão "Editar" genérico em lista com rota dedicada.

---

*Última actualização: jun/2026 — norma platform; catálogo de telas por produto nos repos respectivos.*
