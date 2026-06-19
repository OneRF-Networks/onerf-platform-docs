# OneRF Platform Docs

**Documentação transversal** do ecossistema OneRF — padrão B2B multi-org, ecossistema, contratos comuns e ADRs.

Cada repositório de produto mantém docs **específicas** (refactor, deploy, OpenAPI vivo). Este repo é a **fonte canónica** para tudo que vale para 2+ aplicativos.

---

## Por onde começar

| Perfil | Leia primeiro |
|--------|----------------|
| Liderança / arquitetura | [platform/PLATFORM_VISION.md](platform/PLATFORM_VISION.md) |
| Novo dev no ecossistema | [ECOSYSTEM.md](ECOSYSTEM.md) → PLATFORM_VISION |
| Frontend B2B (shell SPA) | [platform/UI_NAVIGATION.md](platform/UI_NAVIGATION.md) |
| API / integradores | [platform/API_CONTRACT.md](platform/API_CONTRACT.md) |
| Auth OIDC | [platform/AUTH_OIDC.md](platform/AUTH_OIDC.md) |
| Backend ↔ Analytics | [platform/INTEGRATION_PATTERNS.md](platform/INTEGRATION_PATTERNS.md) |

---

## Mapa por camada

| Camada | Documento | Conteúdo |
|--------|-----------|----------|
| **Ecossistema** | [ECOSYSTEM.md](ECOSYSTEM.md) | Backend IoT × Hub Analytics × dashboards verticais |
| **Platform** | [platform/PLATFORM_VISION.md](platform/PLATFORM_VISION.md) | Taxonomia Platform / Shared / Product, princípios, decisões |
| **Platform** | [platform/UI_NAVIGATION.md](platform/UI_NAVIGATION.md) | Lista × detalhe, listas server-side |
| **Platform** | [platform/API_CONTRACT.md](platform/API_CONTRACT.md) | camelCase, erros, ListResponse, versionamento |
| **Platform** | [platform/AUTH_OIDC.md](platform/AUTH_OIDC.md) | OIDC multi-IdP, sessão BFF, JWT M2M |
| **Platform** | [platform/INTEGRATION_PATTERNS.md](platform/INTEGRATION_PATTERNS.md) | HTTP / SQS / Redis entre apps; sem MQTT inter-sistema |
| **ADRs** | [adr/](adr/) | Decisões estruturantes fechadas |
| **Produtos** | [products/](products/) | Índices → docs vivas em cada repo |

---

## Repositórios do ecossistema

| Repo | Papel | Docs locais |
|------|-------|-------------|
| [backend](../backend/) (`onerf_appapi`) | Headend IoT — gateways, endpoints, CoAP/MQTT na borda | [products/backend-iot/README.md](products/backend-iot/README.md) |
| [b2b_analytics](../b2b_analytics/) | Hub analítico B2B — implementação de referência da plataforma | [products/analytics/README.md](products/analytics/README.md) |
| [AppHub](../AppHub/), [KlabinDash](../KlabinDash/), … | Dashboards verticais em `/apps/` | [products/vertical-apps/README.md](products/vertical-apps/README.md) |

**Implementação de referência** do padrão OneRF B2B Platform: repositório `b2b_analytics`.

---

## Consumo nos repos de produto

### Monorepo local (`git_onerf/`)

Paths relativos a partir de qualquer repo irmão:

```
../../onerf-platform-docs/platform/PLATFORM_VISION.md
```

### Clone isolado

Use a URL GitHub (após publicar o repo):

```
https://github.com/OneRF-Networks/onerf-platform-docs/blob/main/platform/PLATFORM_VISION.md
```

Opcional: submodule na raiz do monorepo:

```bash
git submodule add https://github.com/OneRF-Networks/onerf-platform-docs.git onerf-platform-docs
```

---

## Governança

1. Alteração em **princípio de plataforma** → PR neste repo.
2. Alteração em **comportamento de produto** → PR no repo do produto; actualizar stub em `products/` se o índice mudar.
3. **Não duplicar** texto comum nos repos satélite — usar stub de redireccionamento.
4. ADRs numerados em `adr/` — produtos referenciam por número (ex.: ADR-001).

---

*Última actualização: jun/2026 — repo inicial; migrado de `b2b_analytics/docs/PLATFORM_VISION.md` e `backend/docs/ECOSYSTEM.md`.*
