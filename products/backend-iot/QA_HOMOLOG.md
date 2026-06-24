# QA homolog — Backend IoT

Processo de **testes manuais** e **registo de evidências** após deploy em HOMOLOG01, sem misturar com o runtime da aplicação.

| Item | Valor |
|------|--------|
| **Ferramenta (código)** | [`backend/qa-toolkit/`](../../../backend/qa-toolkit/) — campanhas e-mail, templates, CLI |
| **Homolog** | https://homolog01.onerf.com.br · PM2 `homolog01` |
| **Evidências (SharePoint)** | `OneRF Networks\Operações Backend IOT - Documentos\backend_testes` |
| **Deploy runbook** | [backend/docs/DEPLOY_BACKEND.md](../../../backend/docs/DEPLOY_BACKEND.md) |

---

## Porquê `qa-toolkit` e não o backend?

| | Runtime `backend` | `qa-toolkit` |
|--|-------------------|--------------|
| Propósito | API, IoT, PM2 | Convocar testadores, roteiros, smoke QA |
| SMTP | `MAILAUTH*` no `.env` do servidor | `QA_SMTP_*` em `qa-toolkit/.env` (local) |
| Código | `src/` monólito | Pasta isolada, sem import do produto |

Norma de ecossistema: **documentação transversal** fica neste repo; **executável** fica no repo do produto ([products/backend-iot/README.md](README.md)).

---

## Fluxo após deploy relevante

1. **Dev/ops** — validação técnica (PM2, `/login`, logs) — [DEPLOY_BACKEND.md § Checklist](../../../backend/docs/DEPLOY_BACKEND.md#checklist-pós-deploy).
2. **Publicar templates** — copiar `qa-toolkit/templates/*` → SharePoint `backend_testes/templates/`.
3. **Convocar testador** — `cd backend/qa-toolkit && npm run send:homolog01` (campanha JSON + anexos).
4. **Laboratório** — testador escolhe GW/EP do lab, preenche `REGISTRO.csv`, uploads em `registros/AAAA-MM/`.
5. **Revisão** — dev cruza SharePoint com smoke automatizado (futuro: `qa-toolkit smoke`).

**Prazo típico:** 2 dias úteis após convocação (configurável na campanha).

---

## Índice no repo backend

| Documento | Conteúdo |
|-----------|----------|
| [qa-toolkit/README.md](../../../backend/qa-toolkit/README.md) | Setup, comandos, roadmap |
| [docs/qa/README.md](../../../backend/docs/qa/README.md) | Redirect curto |
| [templates/sharepoint/SHAREPOINT_BACKEND_TESTES.md](../../../backend/qa-toolkit/templates/sharepoint/SHAREPOINT_BACKEND_TESTES.md) | Estrutura pasta SharePoint |
| [templates/roteiros/HOMOLOG_MANUAL_QA_WILL.md](../../../backend/qa-toolkit/templates/roteiros/HOMOLOG_MANUAL_QA_WILL.md) | Roteiro manual |

---

## Campanhas

Cada disparo: `qa-toolkit/campaigns/<data>_<ambiente>/campaign.json` (destinatário, `cc`, anexos, prazo).

Exemplo actual: `campaigns/2026-06-24_homolog01_refactor/`.

---

## Roadmap da ferramenta

1. **Fase 1 (actual):** e-mail + templates + SharePoint  
2. **Fase 2:** smoke API homolog com `reports/*.json`  
3. **Fase 3:** seed `homolog_qa` para testes CRUD automatizados  

Detalhe técnico: [qa-toolkit/README.md](../../../backend/qa-toolkit/README.md).

---

*Última actualização: Jun/2026 — homolog01 Magalu (`refactor/main`).*
