# Dashboards verticais (`/apps/`)

SPAs React especializadas servidas no mesmo host B2B — catálogo, painéis industriais por cliente.

**Documentação comum:** [README.md](../../README.md)

---

## Repositórios

| App | Repo | URL típica | Escopo |
|-----|------|------------|--------|
| **AppHub** | [AppHub/](../../../AppHub/) | `/apps/` | Catálogo de links |
| **KlabinDash** | [KlabinDash/](../../../KlabinDash/) | `/apps/klabindash/` | Umidade — secagem Klabin |
| **SinterDash** | [SinterDash/](../../../SinterDash/) | `/apps/sinterdash/` | Linhas de produção industrial |
| **SolarDash** | [SolarDash/](../../../SolarDash/) | `/apps/solardash/` | Inversores solares Modbus |

---

## Padrão comum

1. **SPA estática** — build Vite; nginx serve `frontend/dist/`.
2. **API IoT** — `https://b2b.onerf.com.br` (ou env local); auth via `POST /token` → JWT.
3. **Metadado local** — JSON versionado no repo (estufas, linhas, perfis inversor) + API local em dev/preview.
4. **Deploy** — ver `docs/deploy-b2b-analytics.md` em cada repo.

---

## Plataforma (docs centralizadas)

| Tema | Link |
|------|------|
| Ecossistema | [ECOSYSTEM.md](../../ECOSYSTEM.md) |
| Contrato HTTP / JWT | [platform/API_CONTRACT.md](../../platform/API_CONTRACT.md) |
| Auth (evolução SSO) | [platform/AUTH_OIDC.md](../../platform/AUTH_OIDC.md) |

---

## Evolução

- SSO IoT unificado + catálogo AppHub filtrado por ACL.
- Alinhar novos apps verticais ao padrão Vite + `/apps/{nome}/`.
