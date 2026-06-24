# Backend IoT (`onerf_appapi`)

**Plataforma transversal** de gestão de **conectividade e dispositivos** IoT — atende **todos os segmentos** (utilities, industrial, solar, papel, …).

Gateways, endpoints, protocolos de campo (CoAP, MQTT na borda), leituras, OTA, API MDC, publicação de telemetria para o Analytics IoT e consumo por HUB APPs.

**Repo:** [backend/](../../../backend/)  
**Ecossistema:** [ECOSYSTEM.md](../../ECOSYSTEM.md)

---

## Relação com outras camadas

| Camada | Relação |
|--------|---------|
| **Analytics IoT** | Recebe pull de metadados + push de leituras ([INTEGRATION_PATTERNS](../../platform/INTEGRATION_PATTERNS.md)) |
| **HUB APPs** | Consomem `GET /api/v1/*` via JWT — **não** duplicam conectividade |

---

## Docs neste repositório

| Documento | Conteúdo |
|-----------|----------|
| [docs/README.md](../../../backend/docs/README.md) | Índice canónico |
| [context.md](../../../backend/context.md) | Código actual |
| [docs/ARCHITECTURE_TARGET.md](../../../backend/docs/ARCHITECTURE_TARGET.md) | Arquitetura alvo |
| [docs/INTEGRATION_ANALYTICS.md](../../../backend/docs/INTEGRATION_ANALYTICS.md) | Contrato com Analytics IoT |
| [openapi.yaml](../../../backend/openapi.yaml) | OpenAPI vivo |
| [QA homolog + qa-toolkit](QA_HOMOLOG.md) | Testes manuais, SharePoint, campanhas e-mail |

---

## Normas comuns

| Tema | Link |
|------|------|
| Visão ecossistema | [platform/PLATFORM_VISION.md](../../platform/PLATFORM_VISION.md) |
| Contrato HTTP | [platform/API_CONTRACT.md](../../platform/API_CONTRACT.md) |

**Tronco refactor:** `refactor/main`
