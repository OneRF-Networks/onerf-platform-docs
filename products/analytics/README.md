# Analytics IoT (`b2b_analytics`)

**Plataforma transversal** de **análise de dados IoT genérica** — atende **todos os segmentos**.

Inventário canônico multi-org, Influx, dashboards configuráveis, ocorrências, integrações multi-fonte. Implementação de referência do [padrão B2B técnico](../../platform/PLATFORM_VISION.md#3-padrão-técnico-b2b-onerf-b2b-platform).

**Repo:** [b2b_analytics/](../../../b2b_analytics/)  
**Ecossistema:** [ECOSYSTEM.md](../../ECOSYSTEM.md)

---

## Relação com outras camadas

| Camada | Relação |
|--------|---------|
| **Backend IoT** | Fonte operacional — metadados e leituras ([INTEGRATION_PATTERNS](../../platform/INTEGRATION_PATTERNS.md)) |
| **HUB APPs** | Podem consumir séries/inventário; **não** substituem esta SPA genérica |

---

## Docs neste repositório

| Documento | Conteúdo |
|-----------|----------|
| [docs/ENGINEERING.md](../../../b2b_analytics/docs/ENGINEERING.md) | Índice operacional |
| [docs/ARCHITECTURE_TARGET.md](../../../b2b_analytics/docs/ARCHITECTURE_TARGET.md) | C4, HTTP, camadas |
| [docs/UI_NAVIGATION.md](../../../b2b_analytics/docs/UI_NAVIGATION.md) | Catálogo de telas (§5) |
| [openapi.yaml](../../../b2b_analytics/openapi.yaml) | OpenAPI vivo |

---

## Normas comuns

| Tema | Link |
|------|------|
| UX shell | [platform/UI_NAVIGATION.md](../../platform/UI_NAVIGATION.md) |
| Auth OIDC | [platform/AUTH_OIDC.md](../../platform/AUTH_OIDC.md) |
| Contrato HTTP | [platform/API_CONTRACT.md](../../platform/API_CONTRACT.md) |

**Tronco refactor:** `refactor/main`
