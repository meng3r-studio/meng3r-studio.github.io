# Propuesta: que las sesiones en la nube / móvil sigan las mismas normas

> Estado: **solo propuesta, nada aplicado.** Redactada el 08-11-2026 desde una sesión en la nube (Equipo: nube) para analizarla en gargamel con Opus. Este archivo no debe ir a `main`: bórralo cuando se decida.

## Contexto (lo que se comprobó)
- Las reglas viven en `mengerspong3/claude-config` (`global/CLAUDE.md`, skills, agentes). `install.sh` las enlaza en `~/.claude` de azrael y gargamel.
- Una sesión en la nube **no** tiene `~/.claude/CLAUDE.md`, ni `~/Projects`, ni `gh`, ni hooks locales. Solo carga el `CLAUDE.md` del repo con el que arranca la sesión, y este repo no tiene ninguno.
- En la nube solo se ve el repo de la sesión. Otros repos se traen con `list_repos` + `add_repo` (se pueden leer, hay que clonar a mano). Si se registra un repo con `register_repo_root`, su `CLAUDE.md` pasa a aplicarse.
- Las skills `/nuevo-proyecto` y `/nou-projecte` usan `gh repo create`, que en la nube no existe (hay herramientas MCP de GitHub equivalentes).
- Resultado hoy: en una sesión nueva en el móvil no sabría dónde están las normas, ni qué repo es «FB» o «MD», ni que `HANDOFF.md` es el estado de cada proyecto.

## Cambios propuestos
1. **`claude-config/global/CLAUDE.md`: sección «Sesiones en la nube / móvil».** Equipo = `nube`; sin `~/Projects` ni `gh`; usar las herramientas MCP de GitHub y `add_repo`; mantener las normas de pull + `HANDOFF.md`, preguntar antes del push, sin force y sin secretos.
2. **`claude-config/PROYECTOS.md`:** tabla alias → repo → dónde está el estado. P. ej. `FB → meng3r-studio/FractalBlast`, `MD → MathDungeon`, `NX → narthex`, `DOC → Fibo-Lab/…`. Con ella, «¿cómo va X?» = añadir el repo, leer su `HANDOFF.md`, resumir.
3. **`CLAUDE.md` corto (~8 líneas) en cada repo de proyecto:** «Si estás en la nube, antes de nada añade `mengerspong3/claude-config` y lee `global/CLAUDE.md` y `PROYECTOS.md`». No se copian las reglas completas, para no desincronizarlas. Incluirlo en la plantilla de `/nuevo-proyecto`.
4. **Variante nube de `/nuevo-proyecto` y `/nou-projecte`:** mismo formulario y plantillas, pero crear el repo con las herramientas de GitHub en vez de `gh`, y esperar el sí de Luis antes de crear y de subir.

## Pegas / preguntas para decidir
- `PROYECTOS.md` queda desfasado si no se actualiza al crear un proyecto: ¿que lo haga `/nuevo-proyecto`?
- El punto 3 son unos 8 commits en 8 repos distintos. ¿Se hace de golpe o solo en los que se usen en el móvil?
- ¿Mejor que `claude-config` sea el repo por defecto de las sesiones del móvil y que desde ahí se salte a cada proyecto? (Evita tocar cada repo, pero depende de cómo se arranque la sesión.)
- ¿Registrar `claude-config` con `register_repo_root` (se aplicaría su `CLAUDE.md`, pensado para editar el propio repo) o leer solo `global/CLAUDE.md`? Esta sesión lo leyó sin registrarlo, a petición de Luis.
- Orden sugerido: puntos 1 y 2 en `claude-config`, probar con `meng3r-studio.github.io` como piloto, y luego repartir el 3 y el 4.

## Otros hallazgos de la sesión (ya resueltos o pendientes)
- Hecho: `HANDOFF.md` de esta web actualizado a los repos/rutas tras la reorganización (commit `2efaea6`, rama `ccr-a0299b54-cmr6kg`).
- Pendiente: decidir cuándo archivar `mengerspong3/menger-studio` (web antigua, solo redirige).
- No verificado: `Fibo-Lab/engineduel` y `Fibo-Lab/notas-rapidas` (no estaban en el listado de la nube; se tomó la ubicación de lo dicho por Luis).
