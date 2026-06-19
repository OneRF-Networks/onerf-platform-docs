# Integração inter-sistema

Padrões de comunicação **entre produtos OneRF** (Backend IoT, Analytics, workers, filas).

**Decisão fechada:** [ADR-001](../adr/001-no-mqtt-inter-system.md)  
**Contrato concreto Backend ↔ Analytics:** [backend/docs/INTEGRATION_ANALYTICS.md](../../../backend/docs/INTEGRATION_ANALYTICS.md)

---

## 1. Regra central

| Camada | Protocolos |
|--------|------------|
| **Borda IoT (campo)** | CoAP, UDP, TCP, MQTT — termina no **Backend IoT** |
| **Entre apps OneRF** | **HTTP**, **SQS**, **Redis** (filas JSON camelCase) |
| **Proibido como barramento** | MQTT entre Backend ↔ Analytics |

MQTT na borda alimenta gateways e dispositivos; **não** é barramento de integração entre monólitos/serviços de aplicação.

---

## 2. Backend IoT → Hub Analytics

| Direção | Mecanismo | Conteúdo |
|---------|-----------|----------|
| **Pull metadados** | HTTP `GET /api/v1/endpoints` (job batch no Analytics) | Discover/register/sync sensores |
| **Push leituras** | HTTP interno, fila Redis ou SQS AWS | Medições event-driven |
| **Identidade** | `sourceDeviceId` = ObjectId do endpoint no backend | Hub resolve sensor por par `integrationId` + `sourceDeviceId` |

**Velocidades:**

- Metadados: pull batch (periodicidade configurável).
- Leituras: push event-driven (baixa latência).

---

## 3. Payload canónico (leituras)

- JSON **camelCase**.
- Backend publica id do **endpoint** (campo), não `_id` do sensor no hub.
- MQTT subscriber legado no Analytics → **descontinuado** (sunset com publisher canônico no backend).

---

## 4. Outros consumidores

| Consumidor | Integração |
|------------|------------|
| Dashboards verticais | JWT `POST /token` → `GET /api/v1/*` no Backend IoT |
| Clientes (Enel, CPFL) | Jobs + exportações SGE (Backend IoT) |
| MDC / automação | API REST `/api/v1` |

---

## 5. Tempo real na UI

- **Socket.IO** (+ adapter Redis) para notificações browser — plataforma.
- **Não** MQTT para UI nem para integração inter-sistema.

---

*Última actualização: jun/2026 — migrado de PLATFORM_VISION §8.3 e ECOSYSTEM §4.*
