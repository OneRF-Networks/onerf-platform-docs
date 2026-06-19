# HUB APPs

Conjuntos de **dashboards e análises simples** para uma **aplicação ou segmento** determinado. Consomem as plataformas transversais ([Backend IoT](../backend-iot/README.md), [Analytics IoT](../analytics/README.md)) — **não** as substituem.

**Documentação comum:** [README.md](../../README.md) · **Ecossistema:** [ECOSYSTEM.md](../../ECOSYSTEM.md)

---

## Posicionamento

| Aspecto | HUB APP | Plataforma transversal |
|---------|---------|------------------------|
| Escopo | Um segmento / cliente / processo | Todos os segmentos |
| UX | Painéis focados, metadado local (estufas, linhas, inversores) | Inventário genérico, dashboards configuráveis |
| Stack típica | SPA Vite estática em `/apps/{nome}/` | Monólito Node + SPA B2B (Analytics) ou headend (Backend) |
| Auth | JWT `POST /token` → Backend IoT API | Sessão B2B / OIDC (Analytics) ou sessão operacional (Backend) |

---

## Catálogo

| App | Segmento | Repo | URL |
|-----|----------|------|-----|
| **AppHub** | Catálogo de HUB APPs | [AppHub/](../../../AppHub/) | `/apps/` |
| **KlabinDash** | Umidade — secagem de papel (Klabin) | [KlabinDash/](../../../KlabinDash/) | `/apps/klabindash/` |
| **SinterDash** | Monitoramento por linha de produção | [SinterDash/](../../../SinterDash/) | `/apps/sinterdash/` |
| **SolarDash** | Inversores solares (Modbus) | [SolarDash/](../../../SolarDash/) | `/apps/solardash/` |

---

## Padrão técnico comum

1. **Build** — Vite → `frontend/dist/`; nginx no host B2B.
2. **API primária** — Backend IoT (`https://b2b.onerf.com.br` ou env); `POST /token` → JWT.
3. **Metadado de segmento** — JSON versionado no repo + API local em dev/preview.
4. **Deploy** — `docs/deploy-b2b-analytics.md` em cada repo.

---

## Criar nova HUB APP

1. Novo repo (ou pasta) com path `/apps/{nome}/`.
2. Registar em [AppHub `apps.json`](../../../AppHub/frontend/src/data/apps.json).
3. Documentar segmento, endpoints e metadado local no README do repo.
4. **Não** reimplementar conectividade nem hub analítico — usar APIs das plataformas.

---

## Docs centralizadas

| Tema | Link |
|------|------|
| Ecossistema | [ECOSYSTEM.md](../../ECOSYSTEM.md) |
| Backend IoT | [products/backend-iot/README.md](../backend-iot/README.md) |
| Analytics IoT | [products/analytics/README.md](../analytics/README.md) |
| Contrato HTTP / JWT | [platform/API_CONTRACT.md](../../platform/API_CONTRACT.md) |

---

*Última actualização: jun/2026.*
