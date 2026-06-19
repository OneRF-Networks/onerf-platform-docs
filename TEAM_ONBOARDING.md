# Onboarding — ecossistema OneRF

Guia para novos membros do time: modelo de produto, documentação centralizada e setup do workspace Cursor.

**Repo canónico (SSOT):** https://github.com/OneRF-Networks/onerf-platform-docs  
**Site (browse):** https://onerf-networks.github.io/onerf-platform-docs/

---

## Modelo de produto

| Camada | O quê | Transversal? | Repositório |
|--------|-------|:------------:|-------------|
| **Backend IoT** | Conectividade e dispositivos IoT (gateways, endpoints, CoAP/MQTT, OTA, MDC) | **Sim** | [`backend`](../backend/) |
| **Analytics IoT** | Análise de dados IoT genérica (Influx, dashboards, multi-org, ocorrências) | **Sim** | [`b2b_analytics`](../b2b_analytics/) |
| **HUB APPs** | Dashboards e análises simples por segmento/cliente | **Não** | KlabinDash, SinterDash, SolarDash · catálogo AppHub |

**Regra prática:** HUB APPs **consomem** as plataformas por API — não duplicam conectividade nem hub analítico.

Detalhe: [ECOSYSTEM.md](ECOSYSTEM.md) · [platform/PLATFORM_VISION.md](platform/PLATFORM_VISION.md)

---

## Onde está cada tipo de documentação

| Tipo | Onde |
|------|------|
| Ecossistema, visão, normas HTTP/UX/auth, ADRs | **Este repo** (`onerf-platform-docs`) |
| Refactor, deploy, OpenAPI vivo, implementação | Repo de cada produto |
| Atalhos nos repos antigos | Stubs (ex.: `b2b_analytics/docs/PLATFORM_VISION.md`, `backend/docs/ECOSYSTEM.md`) |

---

## Setup — Cursor (recomendado)

### 1. Clonar repos como pastas irmãs

```powershell
git clone https://github.com/OneRF-Networks/onerf-platform-docs.git
cd onerf-platform-docs
powershell -ExecutionPolicy Bypass -File .\scripts\clone-workspace.ps1 -TargetDir C:\git_onerf
```

Clone manual e layout esperado: [WORKSPACE.md](WORKSPACE.md).

### 2. Abrir workspace

`File → Open Workspace from File…` →

```
C:\git_onerf\onerf-platform-docs\onerf.code-workspace
```

Sete roots no editor: **Platform Docs**, Backend IoT, Analytics IoT, AppHub, KlabinDash, SinterDash, SolarDash.

---

## Por perfil — o que ler primeiro

| Perfil | Começar por |
|--------|-------------|
| Novo no ecossistema | [ECOSYSTEM.md](ECOSYSTEM.md) |
| Arquitetura / produto | [platform/PLATFORM_VISION.md](platform/PLATFORM_VISION.md) |
| Backend IoT | [products/backend-iot/README.md](products/backend-iot/README.md) → `backend/docs/README.md` |
| Analytics IoT | [products/analytics/README.md](products/analytics/README.md) → `b2b_analytics/docs/ENGINEERING.md` |
| HUB APPs | [products/hub-apps/README.md](products/hub-apps/README.md) |
| API / integradores | [platform/API_CONTRACT.md](platform/API_CONTRACT.md) |
| Backend ↔ Analytics | [platform/INTEGRATION_PATTERNS.md](platform/INTEGRATION_PATTERNS.md) · `backend/docs/INTEGRATION_ANALYTICS.md` |
| Frontend B2B (shell SPA) | [platform/UI_NAVIGATION.md](platform/UI_NAVIGATION.md) |
| Catálogo de telas Analytics | `b2b_analytics/docs/UI_NAVIGATION.md` |

---

## Repositórios GitHub

| Repo | Papel |
|------|-------|
| [onerf-platform-docs](https://github.com/OneRF-Networks/onerf-platform-docs) | Docs transversais + workspace Cursor |
| [backend](https://github.com/OneRF-Networks/backend) | Backend IoT |
| [b2b_analytics](https://github.com/OneRF-Networks/b2b_analytics) | Analytics IoT |
| [AppHub](https://github.com/OneRF-Networks/AppHub) | Catálogo HUB APPs |
| [KlabinDash](https://github.com/OneRF-Networks/KlabinDash) | HUB APP — Klabin |
| [SinterDash](https://github.com/OneRF-Networks/SinterDash) | HUB APP — industrial |
| [SolarDash](https://github.com/OneRF-Networks/SolarDash) | HUB APP — solar |

---

## Governança

1. **Visão de ecossistema e normas transversais** → PR neste repo.
2. **Comportamento específico de produto** → PR no repo respectivo.
3. **Não duplicar** texto comum — stub com link para o hub.

Decisão fechada de exemplo: [ADR-001 — sem MQTT inter-sistema](adr/001-no-mqtt-inter-system.md)

---

## Mensagem curta (Slack / Teams)

> Documentação transversal OneRF em **onerf-platform-docs** (ecossistema, normas API/UX, ADRs).  
> Modelo: **Backend IoT** + **Analytics IoT** (transversais) + **HUB APPs** (segmento).  
> Setup: clonar repos irmãos → abrir `onerf-platform-docs/onerf.code-workspace` no Cursor.  
> Guia: https://github.com/OneRF-Networks/onerf-platform-docs/blob/master/WORKSPACE.md

---

*Última actualização: jun/2026.*
