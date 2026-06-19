# OneRF Platform Docs

**Documentação transversal** do ecossistema OneRF — plataformas IoT, HUB APPs segmentadas, contratos comuns e ADRs.

Este repo é a **fonte canónica** para visão de ecossistema e normas partilhadas. Cada repositório mantém docs **operacionais** (refactor, deploy, OpenAPI vivo).

---

## Modelo de produto (resumo)

| Camada | Papel | Transversal |
|--------|-------|:-----------:|
| **Backend IoT** | Conectividade e dispositivos IoT | Sim |
| **Analytics IoT** | Análise de dados IoT genérica | Sim |
| **HUB APPs** | Dashboards simples por segmento (KlabinDash, SinterDash, SolarDash) | Não |

Detalhe: [ECOSYSTEM.md](ECOSYSTEM.md).

---

## Por onde começar

| Perfil | Leia primeiro |
|--------|----------------|
| Liderança / arquitetura | [ECOSYSTEM.md](ECOSYSTEM.md) → [platform/PLATFORM_VISION.md](platform/PLATFORM_VISION.md) |
| Novo dev | ECOSYSTEM → produto do seu repo em [products/](products/) |
| Frontend B2B (Analytics IoT) | [platform/UI_NAVIGATION.md](platform/UI_NAVIGATION.md) |
| API / integradores | [platform/API_CONTRACT.md](platform/API_CONTRACT.md) |
| Backend IoT ↔ Analytics IoT | [platform/INTEGRATION_PATTERNS.md](platform/INTEGRATION_PATTERNS.md) |

---

## Repositórios

| Camada | Repo | Índice |
|--------|------|--------|
| Backend IoT | [backend](../backend/) | [products/backend-iot/README.md](products/backend-iot/README.md) |
| Analytics IoT | [b2b_analytics](../b2b_analytics/) | [products/analytics/README.md](products/analytics/README.md) |
| HUB APPs | [AppHub](../AppHub/), [KlabinDash](../KlabinDash/), … | [products/hub-apps/README.md](products/hub-apps/README.md) |

---

## Mapa documentação

| Tipo | Documentos |
|------|------------|
| **Ecossistema** | [ECOSYSTEM.md](ECOSYSTEM.md), [platform/PLATFORM_VISION.md](platform/PLATFORM_VISION.md) |
| **Normas técnicas** | [platform/API_CONTRACT.md](platform/API_CONTRACT.md), [AUTH_OIDC.md](platform/AUTH_OIDC.md), [UI_NAVIGATION.md](platform/UI_NAVIGATION.md), [INTEGRATION_PATTERNS.md](platform/INTEGRATION_PATTERNS.md) |
| **ADRs** | [adr/](adr/) |
| **Por produto** | [products/](products/) |

---

## Consumo

**Monorepo local:** `../../onerf-platform-docs/` a partir de qualquer repo irmão.

**GitHub:** https://github.com/OneRF-Networks/onerf-platform-docs

---

## Governança

1. Visão de **ecossistema** e princípios transversais → PR neste repo.
2. Comportamento de **plataforma** ou **HUB APP** → PR no repo respectivo.
3. Não duplicar texto comum nos satélites — stubs com link para aqui.

---

*Última actualização: jun/2026.*
