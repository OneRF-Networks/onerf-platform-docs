# Backend IoT (`onerf_appapi`)

Headend OneRF — conectividade de campo, gateways, endpoints, protocolos (CoAP, MQTT na borda), API MDC, jobs, publicação de telemetria.

**Repo:** [backend/](../../../backend/)  
**Documentação comum:** [README.md](../../README.md)

---

## Docs neste repositório

| Documento | Conteúdo |
|-----------|----------|
| [docs/README.md](../../../backend/docs/README.md) | Índice canónico |
| [context.md](../../../backend/context.md) | Contexto operacional (código actual) |
| [docs/ARCHITECTURE_TARGET.md](../../../backend/docs/ARCHITECTURE_TARGET.md) | Arquitetura alvo técnica |
| [docs/REFACTOR_BREAKING.md](../../../backend/docs/REFACTOR_BREAKING.md) | Plano de refactor (fases 0–6) |
| [docs/INTEGRATION_ANALYTICS.md](../../../backend/docs/INTEGRATION_ANALYTICS.md) | Contrato pull/push com Analytics |
| [docs/Guia_de_Padronizacao_de_API_v1.md](../../../backend/docs/Guia_de_Padronizacao_de_API_v1.md) | Guia API v1 (IoT) |
| [openapi.yaml](../../../backend/openapi.yaml) | OpenAPI vivo |

---

## Plataforma (docs centralizadas)

| Tema | Link |
|------|------|
| Ecossistema | [ECOSYSTEM.md](../../ECOSYSTEM.md) |
| Visão B2B | [platform/PLATFORM_VISION.md](../../platform/PLATFORM_VISION.md) |
| Contrato HTTP | [platform/API_CONTRACT.md](../../platform/API_CONTRACT.md) |
| Integração inter-sistema | [platform/INTEGRATION_PATTERNS.md](../../platform/INTEGRATION_PATTERNS.md) |

---

## Stack (resumo)

Node.js, Express, MongoDB, Agenda (→ BullMQ alvo), Passport, CoAP, MQTT (borda), EJS (UI legada).

**Tronco refactor:** `refactor/main`
