# Workspace Cursor — monorepo `git_onerf`

Como abrir e navegar o ecossistema OneRF no editor.

---

## Layout esperado

```
c:\git_onerf\
├── onerf-platform-docs\    ← documentação transversal (SSOT)
├── backend\                ← Backend IoT
├── b2b_analytics\          ← Analytics IoT
├── AppHub\
├── KlabinDash\
├── SinterDash\
├── SolarDash\
└── onerf.code-workspace    ← ficheiro opcional (reabrir tudo de uma vez)
```

---

## Abrir no Cursor

**Opção A — ficheiro workspace (recomendado)**

1. `File → Open Workspace from File…`
2. Selecionar `c:\git_onerf\onerf.code-workspace`

**Opção B — pastas manuais**

`File → Add Folder to Workspace…` — incluir **todas** as pastas acima, em especial `onerf-platform-docs`.

---

## Onde ler primeiro

| Objetivo | Abrir |
|----------|--------|
| Visão do ecossistema | `onerf-platform-docs/ECOSYSTEM.md` |
| Normas HTTP / UX / auth | `onerf-platform-docs/platform/` |
| Trabalhar no Backend IoT | `backend/docs/README.md` |
| Trabalhar no Analytics IoT | `b2b_analytics/docs/ENGINEERING.md` |
| HUB APP segmentada | `onerf-platform-docs/products/hub-apps/README.md` |

---

## Links entre repos

Com todas as pastas no workspace, links relativos do tipo `../../onerf-platform-docs/...` (a partir de `docs/` num repo) **funcionam** no preview Markdown e na navegação do IDE.

Clone isolado de um só repo: usar [GitHub](https://github.com/OneRF-Networks/onerf-platform-docs) ou clonar `onerf-platform-docs` como irmão:

```powershell
cd c:\git_onerf
git clone https://github.com/OneRF-Networks/onerf-platform-docs.git
```

---

*Ver também [README.md](README.md).*
