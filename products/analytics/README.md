# B2B Analytics IoT (`b2b_analytics`)

Hub analítico multi-tenant — **implementação de referência** da [OneRF B2B Platform](../../platform/PLATFORM_VISION.md).

**Repo:** [b2b_analytics/](../../../b2b_analytics/)  
**Documentação comum:** [README.md](../../README.md)

---

## Docs neste repositório

| Documento | Conteúdo |
|-----------|----------|
| [docs/ENGINEERING.md](../../../b2b_analytics/docs/ENGINEERING.md) | Índice operacional, branches |
| [docs/ARCHITECTURE_TARGET.md](../../../b2b_analytics/docs/ARCHITECTURE_TARGET.md) | Implementação C4, HTTP, camadas |
| [docs/REFACTOR_BREAKING.md](../../../b2b_analytics/docs/REFACTOR_BREAKING.md) | Fases refactor |
| [docs/UI_NAVIGATION.md](../../../b2b_analytics/docs/UI_NAVIGATION.md) | Catálogo de telas Analytics (§5) |
| [docs/OCCURRENCES_PLAN.md](../../../b2b_analytics/docs/OCCURRENCES_PLAN.md) | Shared module ocorrências |
| [openapi.yaml](../../../b2b_analytics/openapi.yaml) | OpenAPI vivo |

---

## Plataforma (docs centralizadas)

| Tema | Link |
|------|------|
| Visão B2B | [platform/PLATFORM_VISION.md](../../platform/PLATFORM_VISION.md) |
| UX shell (lista × detalhe) | [platform/UI_NAVIGATION.md](../../platform/UI_NAVIGATION.md) |
| Auth OIDC | [platform/AUTH_OIDC.md](../../platform/AUTH_OIDC.md) |
| Contrato HTTP | [platform/API_CONTRACT.md](../../platform/API_CONTRACT.md) |

---

## Stack (resumo)

Node.js 24, Express, MongoDB, InfluxDB, Redis, BullMQ, Socket.IO, React/Vite SPA.

**Tronco refactor:** `refactor/main`
