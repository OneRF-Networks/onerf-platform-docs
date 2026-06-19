# ADR-001: Sem MQTT como barramento inter-sistema

**Status:** Aceito (fechado)  
**Data:** jun/2026  
**Contexto:** [PLATFORM_VISION.md](../platform/PLATFORM_VISION.md) · [INTEGRATION_PATTERNS.md](../platform/INTEGRATION_PATTERNS.md)

---

## Contexto

O ecossistema OneRF usa MQTT extensivamente na **borda IoT** (gateways, CAT-M, LoRa). Historicamente, parte da ingestão Analytics também usava MQTT como canal Backend → Hub.

Misturar MQTT de campo com MQTT entre serviços de aplicação gera:

- Acoplamento a tópicos ad hoc sem contrato versionado.
- Duplicação de subscribers e dificuldade de observabilidade.
- Confusão operacional entre protocolo de dispositivo e barramento interno.

---

## Decisão

1. **MQTT permanece na borda IoT** — termina no Backend IoT (`onerf_appapi`).
2. **Integração Backend ↔ Analytics** usa **HTTP, SQS e/ou Redis** com payloads JSON camelCase.
3. **MQTT subscriber legado** no Analytics será **descontinuado** após publisher canônico no backend.
4. **UI tempo real** usa **Socket.IO** (com adapter Redis), não MQTT.

---

## Consequências

- Novas integrações inter-produto **não** devem usar MQTT.
- PRs que introduzem MQTT entre apps devem ser rejeitados salvo excepção documentada (novo ADR).
- Backend IoT implementa `MeasurementPublisher` canônico (HTTP/SQS/Redis).
- Hub resolve sensores por `integrationId` + `sourceDeviceId` — sem lookup reverso MQTT.

---

## Referências

- [backend/docs/INTEGRATION_ANALYTICS.md](../../../backend/docs/INTEGRATION_ANALYTICS.md)
- [b2b_analytics/docs/ARCHITECTURE_TARGET.md §10](../../../b2b_analytics/docs/ARCHITECTURE_TARGET.md)
