# Integração inter-sistema

Padrões de comunicação entre **plataformas transversais** (Backend IoT, Analytics IoT) e **HUB APPs**.

**Decisão fechada:** [ADR-001](../adr/001-no-mqtt-inter-system.md)  
**Contrato Backend IoT ↔ Analytics IoT:** [backend/docs/INTEGRATION_ANALYTICS.md](../../../backend/docs/INTEGRATION_ANALYTICS.md)

---

## 1. Regra central

| Camada | Protocolos |
|--------|------------|
| **Borda IoT (campo)** | CoAP, UDP, TCP, MQTT — termina no **Backend IoT** |
| **Entre plataformas / apps** | **HTTP**, **SQS**, **Redis** (JSON camelCase) |
| **Proibido como barramento** | MQTT entre Backend IoT ↔ Analytics IoT |

---

## 2. Backend IoT → Analytics IoT

| Direção | Mecanismo | Conteúdo |
|---------|-----------|----------|
| **Pull metadados** | HTTP `GET /api/v1/endpoints` (job batch no Analytics) | Discover/register/sync sensores |
| **Push leituras** | HTTP, fila Redis ou SQS | Medições event-driven |
| **Identidade** | `sourceDeviceId` = ObjectId do endpoint no Backend IoT | Hub resolve por `integrationId` + `sourceDeviceId` |

---

## 3. HUB APPs → plataformas

| HUB APP | Plataforma | Padrão |
|---------|------------|--------|
| KlabinDash, SinterDash, SolarDash | **Backend IoT** (primário) | `POST /token` → JWT → `GET /api/v1/*` |
| (opcional) | **Analytics IoT** | API REST quando inventário/séries do hub forem necessários |

HUB APPs **não** publicam telemetria nem gerem mesh — delegam às plataformas transversais.

---

## 4. Outros consumidores do Backend IoT

| Consumidor | Integração |
|------------|------------|
| Operadores OneRF | UI operacional, sessão HTTP |
| Clientes (Enel, CPFL) | Jobs + exportações |
| MDC / automação | `/api/v1` REST |

---

## 5. Tempo real na UI

- **Analytics IoT:** Socket.IO (+ Redis adapter).
- **HUB APPs:** polling ou fetch periódico à API Backend IoT (padrão actual).
- **Não** MQTT para UI nem integração inter-sistema.

---

*Última actualização: jun/2026.*
