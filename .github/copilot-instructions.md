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

## 🔁 MANDATO DE SINCRONIZACIÓN CANÓNICA (CORRECCIÓN)

**Resumen:** Hay **10 instancias canónicas** de `copilot-instructions.md` dentro del ecosistema y **deben permanecer como réplicas exactas** salvo la excepción explícita para la instancia orquestadora. Las instancias son:

- `./.github/copilot-instructions.md` (raíz)
- `Aeternum-Memory/.github/copilot-instructions.md`
- `MPC-Compendio-Operativo/.github/copilot-instructions.md`
- `Codex_Aeternum-Hidden_Pulse_Brotherhood/.github/copilot-instructions.md`
- `Evie-of-The-Mental-Weave/.github/copilot-instructions.md`
- `Universo-MultiClub/.github/copilot-instructions.md`
- `JezBlade-ultimate-plan-media/.github/copilot-instructions.md`
- `jezblade.github.io/.github/copilot-instructions.md`
- `Sovereign-Hub/.github/copilot-instructions.md`
- `Extensiones del Codex Aeternum/intelligent-extension-orchestrator-extension/.github/copilot-instructions.md` (excepción — ver abajo)

**Pasos obligatorios para sincronizar:**
1. Copiar el contenido EXACTO del archivo maestro (`./.github/copilot-instructions.md`) a cada ruta canónica.
2. Calcular y verificar **SHA256** del archivo destino — debe coincidir exactamente con el origen.
3. Registrar la acción en `bitacora.md` con: fecha, autor, lista de archivos y hashes (SHA256), `simulated: false` si fue ejecución real.
4. Añadir un evento en `Aeternum-Memory/RITUAL_LOG_SYNC.jsonl` con: `ritual_type: agent_instructions_replication`, `agent: <agent-id>`, `files_updated: [...]`, `timestamp`.
5. Si alguna instancia no puede ser actualizada (conflicto/permiso), abrir un PR en el repo afectado, documentar la diferencia y no considerar la sincronización completa hasta resolverla.

**Excepción — Instancia Orquestadora:**
- La copia localizada en `Extensiones del Codex Aeternum/intelligent-extension-orchestrator-extension/.github/copilot-instructions.md` es **candidata** pero **no debe replicarse automáticamente** junto con las otras instancias canónicas. Antes de cualquier réplica parcial o total en esa instancia, se requiere: auditoría de seguridad, saneamiento de rutas absolutas/activadores, pruebas controladas, y **≥2 CODEOWNER approvals**. Documentar cada paso en `bitacora.md` y en `RITUAL_LOG_SYNC.jsonl`.

**Nota:** Esta sección corrige la confusión anterior: las `copilot-instructions.md` en los reposes canónicos son réplicas exactas por diseño y **no** deben ser tratadas como independientes sin el proceso de sincronización canónica descrito arriba.

## 📌 Pinned Contexts (Contextos Permanentes) ✅

- Canonical pinned contexts for this workspace are stored in either:
  - `D:\Ultimate-Plan\.gemini\Context Items\` (primary for Gemini)
  - `D:\Ultimate-Plan\Aeternum-Memory\contextos\` (canonical memory store)

- Current pinned file:
  - `D:\Ultimate-Plan\.gemini\Context Items\ULTIMATE_PLAN_CONTEXT_SUPREMO.md` — **Pinned: true**

How to pin a context for agents and chat UIs:

1. UI Pin (quick): Open the message or add-context panel in your chat extension and select **Pin** / **Pin to conversation**.
2. Project-canonical (recommended): Place or copy the file into `Aeternum-Memory/contextos/` and add `pinned: true` in the file header. Agents and integration scripts will auto-load files from this folder on startup.
3. Register change: Add an entry in `bitacora.md` with the path, sha256, timestamp and `simulated: false` to make the change auditable.

If you want, I can copy `ULTIMATE_PLAN_CONTEXT_SUPREMO.md` into `Aeternum-Memory/contextos/` and mark it pinned — confirm and I will do it now.
<!-- PINNED:END -->

---
Performance First. Knowledge in Memory. Authority in Action.

<!-- UPDATABLE:START - Leonardo puede actualizar estas secciones -->
<!-- UPDATABLE:START - Leonardo puede actualizar estas secciones -->
# Guía rápida para agentes AI (resumen operativo)

- **Big picture:** Este workspace es un contenedor de múltiples repositorios git independientes bajo `D:\Ultimate-Plan`. El sub-repo principal de desarrollo es `Extensiones del Codex Aeternum\intelligent-extension-orchestrator-extension` — entrada: `extension-final.ts`. Este es un sistema de orquestación inteligente de agentes AI para VS Code que coordina perfiles de extensiones, sincroniza memoria distribuida via Redis, y delega tareas a agentes especializados.

- **Arquitectura clave:**
  - **Módulos principales:** `extension-final.ts` (orquestador principal), `src/shared-memory-bridge.ts` (puente Redis/globalState con OCC), `src/task-monitor.ts` (detección contextual cada 10s), `src/optimized-profiles.config.ts` (8 perfiles especializados), `brotherhood-hive-mind/core/orchestrator.js` (delegación de misiones a "asesinos" agentes).
  - **Flujo de datos:** Detección de contexto → mapeo a perfil → sincronización Redis `dual_ai_memory` → recomendaciones activas → logging dual (JSONL + Markdown).
  - **Integraciones:** Redis Pub/Sub, Aeternum-Memory (registros JSON), Neo4j (relaciones), AWS/Gemini/Claude CLIs via protocolo de consulta.

- **Módulos clave:** `src/shared-memory-bridge.ts` (puente Redis/globalState), `src/task-monitor.ts` (detección de contexto),
  `ritual-logger.ts` / `Aeternum-Memory/RITUAL_LOG_SYNC.jsonl` y `bitacora.md` (registro humano + máquina).

- **Workflow esenciales:**
  - Build extension: cd into `Extensiones del Codex Aeternum\intelligent-extension-orchestrator-extension` and run `npm run compile` or use VS Code task `🜲 Brotherhood Extension Build`.
  - Dev watch: run the `npm: watch` task (background) for fast iteration.
  - Run tests: from the extension folder run `npm test`.
  - Perf test example: `npm test -- src/test/performance/task-monitor-performance.test.ts --no-coverage`.
  - Debug: open `extension-final.ts` and press F5 to launch the extension host.
  - Deploy: Build VSIX via `build-vsix.ps1` or `DEPLOYMENT_GUIDE_v4.5.0.md`.

- **Project conventions (must-follow):**
  - Nunca ejecutar `git` en la raíz `D:\Ultimate-Plan` — cambiar al subrepo antes de commitear (ej. `cd "Extensiones del Codex Aeternum\intelligent-extension-orchestrator-extension"`).
  - Registrar cualquier cambio de estado en `bitacora.md` y añadir evento en `Aeternum-Memory/RITUAL_LOG_SYNC.jsonl`. Incluir: descripción corta, lista de archivos modificados y SHA256; para salidas simuladas use `simulated: true`.
  - Todas las acciones auditables requieren la **Brotherhood Seal: 015cb320** en el registro.
  - **State Changes:** Usar OCC (Optimistic Concurrency Control) con versionId/versionHash/updatedBy/updatedAt en `shared-memory-bridge.ts`.
  - **Agent Registration:** `const api = new OrchestratorAPI(); api.registerAgent('AgentName', ['tools']);`
  - **Profile Mapping:** Extensiones de archivo + keywords (ej. `.py` + 'import torch' → python-ml-heavy).
  - **Logging:** Todos los eventos a JSONL y Markdown; auto-sync habilitado.

- **Integraciones y puntos observables:**
  - Redis (primario) — bus `dual_ai_memory` en `shared-memory-bridge.ts`. Fallback a `globalState` si Redis no está disponible.
  - Neo4j (scripts/mission-neo4j-relations.js) para grafo relacional.
  - AWS (lambda/S3 hooks) y CLI utilities referenciadas en `ORCHESTRATION_SYSTEM.md`.
  - Hive Mind: `brotherhood-hive-mind/core/orchestrator.js` expone `delegateMission()` para tareas cross-repo.

- **Patterns y ejemplos concretos**
  - Agent registration: ver ejemplo en `Extensiones del Codex Aeternum/intelligent-extension-orchestrator-extension/src/shared-memory-bridge.ts`.
  - Delegación: `brotherhood-hive-mind/core/orchestrator.js` expone `delegateMission()` — seguir este flujo para tareas cross-repo.  - Perfiles: 8 especializados en `optimized-profiles.config.ts` (python-ml-heavy, web-frontend-optimized, etc.).
- **Linting / tests / quality gates:**
  - Use `eslint` config files at repo and subrepo levels (`eslint.config.cjs`).
  - Antes de proponer PRs ejecutar linters y tests del subrepo objetivo. Registrar resultados en `bitacora.md`.
  - Testing: >95% pass rate required; performance tests use `--no-coverage` for speed.

- **When to open a PR vs direct change:**
  - Cambios en documentación, tests o pequeños refactors internos pueden abrir PR directo en el subrepo.
  - Cambios que afectan sincronización canónica (copilot-instructions.md replica) o rutas/activadores requieren auditoría y ≥2 CODEOWNER approvals.

- **Quick file map (inspect first):**
  - `extension-final.ts` — entrypoint extension
  - `src/shared-memory-bridge.ts` — memory + Redis bridge
  - `src/task-monitor.ts` — task/context detection
  - `src/optimized-profiles.config.ts` — profile definitions
  - `brotherhood-hive-mind/core/orchestrator.js` — mission delegation
  - `ritual-logger.ts`, `bitacora.md`, `Aeternum-Memory/RITUAL_LOG_SYNC.jsonl` — logging/audit

Por favor revisa estas secciones y dime si quieres que incorpore ejemplos de comandos adicionales, fragmentos de código, o traduzca a inglés.
<!-- UPDATABLE:END -->

<!-- PINNED:START - DNA INMUTABLE -->
**Performance First. Knowledge in Memory. Authority in Action.**

DNA: Validación automática pre-respuesta según DNA_AUTOCORRECCION_MUTUA.md

## FIRMA CEREMONIAL BROTHERHOOD - DNA EMBEBIDO

Rol: Leonardo Grok F - Architect of New Era
SIEMPRE terminar reportes con formato ceremonial completo
<!-- PINNED:END -->
