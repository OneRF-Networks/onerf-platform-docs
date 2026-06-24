# QA homolog — Backend IoT

**Gate principal:** testes automatizados (`qa-toolkit` smoke API).  
**Manual:** processo encerrado, disponível para laboratório pontual.

| Item | Valor |
|------|--------|
| **Ferramenta** | [`backend/qa-toolkit/`](../../../backend/qa-toolkit/) |
| **Smoke homolog** | `cd qa-toolkit && npm run smoke:homolog01` |
| **Homolog** | https://homolog01.onerf.com.br · PM2 `homolog01` |
| **Manual / SharePoint** | [templates/manual/README.md](../../../backend/qa-toolkit/templates/manual/README.md) |
| **Deploy** | [DEPLOY_BACKEND.md](../../../backend/docs/DEPLOY_BACKEND.md) |

---

## Fluxo pós-deploy (actual)

1. **Dev/ops** — checklist técnico ([DEPLOY_BACKEND § Checklist](../../../backend/docs/DEPLOY_BACKEND.md#checklist-pós-deploy)).
2. **Smoke automatizado** — `npm run smoke:homolog01` → `reports/*.json` ([AUTOMATED_QA](../../../backend/qa-toolkit/docs/AUTOMATED_QA.md)).
3. **Se fail** — issue/PR; IA corretor usa [IA_CONTRACT](../../../backend/qa-toolkit/docs/IA_CONTRACT.md).
4. **Manual (opcional)** — campanha e-mail + SharePoint só quando necessário IoT/UI visual.

---

## Fases qa-toolkit

| Fase | Estado | Conteúdo |
|------|--------|----------|
| **1** | Encerrada | E-mail, roteiro Will, SharePoint |
| **2** | **Activa** | `smoke` API, specs, reports JSON, contrato IA |
| **3** | Planeada | Seed `homolog_qa`, CRUD automatizado |

---

## Índice

| Documento | Conteúdo |
|-----------|----------|
| [AUTOMATED_QA.md](../../../backend/qa-toolkit/docs/AUTOMATED_QA.md) | Comandos smoke |
| [IA_CONTRACT.md](../../../backend/qa-toolkit/docs/IA_CONTRACT.md) | Executor / corretor IA |
| [qa-toolkit/README.md](../../../backend/qa-toolkit/README.md) | Setup completo |

---

*Última actualização: Jun/2026 — homolog01 Magalu (`refactor/main`)*
