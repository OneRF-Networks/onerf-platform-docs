# Workspace Cursor — monorepo OneRF

Como clonar e abrir **todos** os repos no Cursor com links de documentação a funcionar.

**Ficheiro workspace (versionado):** [onerf.code-workspace](onerf.code-workspace) — paths relativos a pastas **irmãs**.

---

## Layout esperado

```
git_onerf/                    ← pasta pai (nome à sua escolha)
├── onerf-platform-docs/      ← este repo (SSOT + onerf.code-workspace)
├── backend/
├── b2b_analytics/
├── AppHub/
├── KlabinDash/
├── SinterDash/
└── SolarDash/
```

---

## Setup rápido

### 1. Clonar repos irmãos

**Script (Windows):**

```powershell
cd onerf-platform-docs
powershell -ExecutionPolicy Bypass -File .\scripts\clone-workspace.ps1 -TargetDir C:\git_onerf
```

**Manual:**

```powershell
mkdir C:\git_onerf
cd C:\git_onerf
git clone https://github.com/OneRF-Networks/onerf-platform-docs.git
git clone https://github.com/OneRF-Networks/backend.git
git clone https://github.com/OneRF-Networks/b2b_analytics.git
git clone https://github.com/OneRF-Networks/AppHub.git
git clone https://github.com/OneRF-Networks/KlabinDash.git
git clone https://github.com/OneRF-Networks/SinterDash.git
git clone https://github.com/OneRF-Networks/SolarDash.git
```

### 2. Abrir no Cursor

`File → Open Workspace from File…` →

```
C:\git_onerf\onerf-platform-docs\onerf.code-workspace
```

Aparecem 7 roots: **Platform Docs**, Backend IoT, Analytics IoT, HUB APPs.

### 3. Alternativa — pastas manuais

`File → Add Folder to Workspace…` — adicionar cada repo; incluir sempre `onerf-platform-docs`.

---

## Onde ler primeiro

| Objetivo | Abrir |
|----------|--------|
| Visão do ecossistema | `ECOSYSTEM.md` |
| Normas HTTP / UX / auth | `platform/` |
| Backend IoT | `../backend/docs/README.md` |
| Analytics IoT | `../b2b_analytics/docs/ENGINEERING.md` |
| HUB APPs | `products/hub-apps/README.md` |

---

## Links entre repos

Com o workspace aberto, links `../../onerf-platform-docs/...` nos `docs/` dos outros repos resolvem no IDE.

---

*Ver também [README.md](README.md).*
