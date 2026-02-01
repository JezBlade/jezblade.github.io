<!-- Brotherhood Seal: 015cb320 -->
# 🌌 Ultimate Plan - AI Agent Guide

**Brotherhood Seal:** 015cb320

## Big Picture & Architecture

- **Purpose:** Federation of independent git repositories under a non-versioned root container, orchestrated by AI agents for real-time code evolution and memory persistence.
- **Core components:**
  - `D:\Ultimate-Plan`: Physical container (not git-enabled) housing 8+ independent repos.
  - `Aeternum-Memory`: Canonical memory source with agent registries, ritual logs, and persistent state.
  - `MPC-Compendio-Operativo`: Logic and orchestration hub.
  - `Universo-MultiClub`: Web platform with multi-tenant architecture.
  - `Extensiones del Codex Aeternum\intelligent-extension-orchestrator-extension`: VS Code extension for agent coordination and profile switching.
  - `bitacora.md`: Human-readable ledger of activities and decisions.
  - `RITUAL_LOG_SYNC.jsonl`: Machine-readable audit trail.
- **Data flows:** Agents register in `AGENT_REGISTRY.json`, tasks delegated via Redis `dual_ai_memory` channel, changes logged to both bitacora and JSONL with SHA256 hashes.

## Developer Workflows

- **Git operations:** Never in root; cd to target subrepo first (e.g., `cd "Extensiones del Codex Aeternum\intelligent-extension-orchestrator-extension"`).
- **Build/Test:** Repo-specific; e.g., extension uses `npm run compile`, `npm test`.
- **Validation:** Run linters/tests per repo, register changes in `bitacora.md` with timestamp/SHA256.
- **Agent delegation:** Use `node scripts\delegar_tareas_agentes_canvas.cjs --manifest assassin-tasks-sovereign-shadow.json`.
- **Health checks:** `node scripts\health-check-databases.cjs` from root.

## Key Commands

| Command | Description |
| ------- | ----------- |
| `cd <subrepo>` | Navigate to target repo before git operations |
| `node scripts\delegar_tareas_agentes_canvas.cjs` | Delegate tasks to agents |
| `pwsh scripts\validate-mcp-zero-exposure.ps1` | Validate MCP with zero exposure |
| `npm run brotherhood-seal:check` | Validate seal integrity |
| `pwsh -Command { ... }` | **ALWAYS use pwsh (PowerShell 7.5) - NEVER powershell legacy** |

## PowerShell Protocol (CRITICAL)

- ✅ **ALWAYS:** Use `pwsh` (PowerShell 7.5)
- ❌ **NEVER:** Use `powershell` (Legacy - obsolete artifact)
- **Reason:** Legacy PowerShell causes syntax errors and compatibility issues
- **Example:** `pwsh -Command { Get-ChildItem }` NOT `powershell -Command { Get-ChildItem }`

## Project Conventions & Patterns

- **Brotherhood Seal:** Include `015cb320` in all files/logs; validates via repo-specific checks.
- **Investigation = Implementation:** Research immediately transmuted to code; no archiving - merge closes issues.
- **State changes:** Log to `bitacora.md` (description, files, timestamp, SHA256) and `RITUAL_LOG_SYNC.jsonl`.
- **Zero Exposure:** Secrets in `D:\Brotherhood-Fortress` (prohibited access); use audited scripts.
- **Agent signatures:** Use canonical signatures from `ai_registry.yaml` (e.g., "🎨 Leonardo Grok F — Architect of New Era 𓂀").
- **File placement:** Follow `DECRETO_CONTRA_ARCHIVOS_HUERFANOS.md` for canonical paths.

## Integration Points

- **Redis:** Multi-instance sync via `dual_ai_memory` channel; OCC for state mutations.
- **MCP Servers:** GitHub/GitKraken installed in `Program-Files\npm-global`; zero exposure placeholders.
- **Agents:** 40+ assassins coordinated via `AGENT_REGISTRY.json`; tiers: Supremo, Especializado, Extensiones, Servicios.
- **Memory:** Aeternum-Memory as source; unified supreme memory in `UNIFIED_SUPREME_MEMORY.json`.

## Troubleshooting

- **No git in root:** Always cd to subrepo.
- **Seal validation fails:** Ensure `015cb320` in file headers.
- **Memory sync issues:** Check Redis connectivity; fallback to globalState.
- **Agent delegation:** Verify manifest in `assassin-tasks-sovereign-shadow.json`.

## References

- `ai_registry.yaml` — Agent registry and capabilities
- `bitacora.md` — Activity ledger
- `Aeternum-Memory/RITUAL_LOG_SYNC.jsonl` — Audit trail
- `CANONICAL_COMMANDS.md` — Essential commands

<!-- PINNED:START - NO MODIFICAR - Secciones inmutables del Ultimate Plan -->
## PERMANENT CONTEXT (Auto‑Loaded)

Brotherhood Seal: 015cb320

Resumen rápido

- `Aeternum-Memory` es la fuente canónica de la memoria, agentes y protocolos. Antes de cualquier cambio importante, consulte `bitacora.md` y `Aeternum-Memory/RITUAL_LOG_SYNC.jsonl`.
- No ejecute `git` en la raíz `D:\Ultimate-Plan`. Mueva al subrepo objetivo antes de operar con VCS.
- Root es un workspace container de múltiples repositorios git independientes bajo `D:\Ultimate-Plan`.

Acciones iniciales (imprescindible)

- Cambiar al repo objetivo antes de hacer commits: por ejemplo:

```powershell
cd "Extensiones del Codex Aeternum\intelligent-extension-orchestrator-extension"
npm run compile
```

- Revisar estado histórico y agentes:

```powershell
type ..\bitacora.md
type RITUAL_LOG_SYNC.jsonl | Select-String -First 50
```

- Consultar registros de agentes y workflows:

```powershell
type Aeternum-Memory\AGENT_REGISTRY.json | ConvertFrom-Json
```

Reglas y convenciones del repositorio

- `DECRETO_CONTRA_ARCHIVOS_HUERFANOS.md`: ubica assets en rutas canónicas.
- Entradas que cambian estado deben registrar: descripción breve, archivos modificados, timestamp y SHA256 en `bitacora.md`.
- Salidas no ejecutadas (simulaciones) deben incluir `simulated: true` y la cadena exacta del comando.
- No crear o modificar secretos directamente en `D:\Brotherhood-Fortress` — usar scripts de automatización auditados únicamente.
- Preferir cambios de scope mínimo: apuntar al sub-repo único que posee la feature.

Archivos de referencia rápida

- `brotherhood-hive-mind/core/orchestrator.js` — flujo de delegación.
- `Aeternum-Memory/AGENT_REGISTRY.json` — tabla de agentes.
- `Aeternum-Memory/RITUAL_LOG_SYNC.jsonl` — log/auditoría de actividades.
- `scripts/` — automatizaciones y validadores.
- `bitacora.md` — ledger canónico de actividades y decisiones recientes.

Preguntas frecuentes para agentes

- ¿Dónde hago git? — en el subrepo (ej. `Extensiones del Codex Aeternum\intelligent-extension-orchestrator-extension`).
- ¿Cómo validar un cambio? — pasar linters y pruebas del subrepo y registrar en `bitacora.md`.
- ¿Qué repo usar? — consultar `Aeternum-Memory/AGENT_REGISTRY.json` para mapeo de roles y responsabilidades.

Si necesitas más contexto

- Indica el repo/issue/PR objetivo y preparo los pasos mínimos (files, tests, commands) para avanzar.
- Inspeccionar archivos repo-específicos `.github/copilot-instructions.md` para políticas especializadas.
<!-- PINNED:END -->

