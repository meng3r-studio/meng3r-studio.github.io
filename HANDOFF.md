# HANDOFF · Menger Studio (web)

Última actualización: 01-11-2026 · Equipo: gargamel

## Estado actual
- **Web pública (en pruebas):** https://meng3r-studio.github.io/ (repo `meng3r-studio/meng3r-studio.github.io`, GitHub Pages desde `main` /). **Es la web buena** (decisión de Luis, 01-11-2026). La antigua `mengerspong3.github.io/menger-studio/` solo redirige aquí. Verificada en móvil (375 px) y escritorio (1280 px), 7 idiomas, sin scroll lateral.
  - 4 juegos con carátula, vídeo corto de gameplay, «Pruébalo» con QR y opinión con caritas. Sin créditos ni licencias, sin enlaces a repos privados, sin publicidad ni cookies. Aviso «BETA» arriba.
  - FractalBlast jugable en `play/fractalblast/` (export web de Godot 4.7.2, sin hilos). Probado: arranca en móvil.
  - Descargas: Rodamons Linux y APK de Narthex desde la release de `mengerspong3/menger-studio-builds`.
- **Intranet:** Artifact privado https://claude.ai/artifact/R18NU6JsZhyoj2GF2ViqBc (estado, créditos, buzón propio). Código en el repo privado `mengerspong3/menger-studio-intranet` (clonar en `~/Projects/Jocs/MengerStudio/web/`). Enlaza a esta web; esta web no enlaza a la intranet.
  - Además de los 4 juegos tiene «Otros proyectos a medias»: EngineDuel (`mengerspong3/engineduel`) y Attic Notes (`mengerspong3/notas-rapidas` + prototipo Claude Notes como Artifact).

## Prototipos de app
- **Claude Notes** (notas rápidas, prototipo en Artifact): 8 capturas en `prototipos/claude-notes/` (lista, tarjetas y temas Suave, Oscuro, Claro, Sistema y Alto contraste). Descripción de cada una en su `README.md`. No está enlazado desde la web pública.

## Último trabajo hecho
- 01-11: esta web pasa a ser la oficial; la antigua redirige aquí. Intranet subida a GitHub y enlazada aquí.
- Vídeos (en `video/`, MP4 sin sonido):
  - Rodamons: build Linux con `-rd-players 1` y `-rd-players 4` (la IA conduce), grabado con `ffmpeg -f x11grab`.
  - FractalBlast y MathDungeon: Godot `--write-movie` con los scripts de `tools/grabar/` (conducen la nave / juegan solos).
  - Narthex: pasillo del prototipo web (`tools/grabar/narthex_pasillo.html`, usa `ascii.js` y `corridor.js` de fosforo) en Firefox kiosk + x11grab. No es la AR real.
- Plantillas de exportación web de Godot 4.7.2 instaladas en `~/.local/share/godot/export_templates/4.7.2.stable/` (solo las web).

## Pendiente / siguiente paso
1. ~~Conectar el formulario.~~ Hecho (31/10/2026): `tools/formulario/Code.gs` publicado como aplicación web de Google Apps Script desde la cuenta que recibe los mensajes; su URL está en `FORM_URL` de `index.html`. Para cambiar el script: Implementar → Gestionar implementaciones → editar → Nueva versión (la URL se mantiene).
2. FractalBlast web muestra el botón «DBG» del panel de depuración; habría que ocultarlo en exportaciones release (cambio en el repo de FractalBlast).
3. Vídeo de Narthex con la AR real: grabar la pantalla del Pixel 9a (`adb shell screenrecord`) y sustituir `video/narthex.mp4`.
4. Builds de Windows (Rodamons) y web de MathDungeon para quitar «Próximamente».

## Dudas abiertas
- Los sprites de MathDungeon sin origen claro (Enemy_Animations_Set, RPG_Hero) salen en el vídeo: Luis dijo incluirlo igual.
