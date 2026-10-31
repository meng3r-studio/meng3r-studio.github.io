# HANDOFF · Menger Studio (web)

Última actualización: 31-10-2026 · Equipo: gargamel

## Estado actual
- **Web pública (en pruebas):** https://meng3r-studio.github.io/ (repo `meng3r-studio/meng3r-studio.github.io`, GitHub Pages desde `main` /; copiada de `mengerspong3/menger-studio`). Verificada en móvil (375 px) y escritorio (1280 px), 7 idiomas, sin scroll lateral.
  - 4 juegos con carátula, vídeo corto de gameplay, «Pruébalo» con QR y opinión con caritas. Sin créditos ni licencias, sin enlaces a repos privados, sin publicidad ni cookies. Aviso «BETA» arriba.
  - FractalBlast jugable en `play/fractalblast/` (export web de Godot 4.7.2, sin hilos). Probado: arranca en móvil.
  - Descargas: Rodamons Linux y APK de Narthex desde la release de `mengerspong3/menger-studio-builds`.
- **Intranet:** Artifact privado https://claude.ai/artifact/R18NU6JsZhyoj2GF2ViqBc (estado, créditos, buzón propio). Su código ya no está en el repo público de builds (commit 07ec537; sigue en el historial de 4c634db). Copia local: `~/Projects/Jocs/MengerStudio/web/` en gargamel.

## Último trabajo hecho
- Vídeos (en `video/`, MP4 sin sonido):
  - Rodamons: build Linux con `-rd-players 1` y `-rd-players 4` (la IA conduce), grabado con `ffmpeg -f x11grab`.
  - FractalBlast y MathDungeon: Godot `--write-movie` con los scripts de `tools/grabar/` (conducen la nave / juegan solos).
  - Narthex: pasillo del prototipo web (`tools/grabar/narthex_pasillo.html`, usa `ascii.js` y `corridor.js` de fosforo) en Firefox kiosk + x11grab. No es la AR real.
- Plantillas de exportación web de Godot 4.7.2 instaladas en `~/.local/share/godot/export_templates/4.7.2.stable/` (solo las web).

## Pendiente / siguiente paso
1. **Luis: conectar el formulario.** FormSubmit se abandonó (no activaba y exponía el correo). Publicar `tools/formulario/Code.gs` como aplicación web de Google Apps Script con la cuenta que recibe los mensajes (pasos en `tools/formulario/README.md`) y poner su URL en `FORM_URL` de `index.html`. Hasta entonces el formulario muestra «No se ha podido enviar».
2. **Luis: guardar la intranet en GitHub.** No se pudo crear el repo privado `menger-studio-intranet` (lo bloqueó el modo automático). Crear a mano o decidir dónde va.
3. FractalBlast web muestra el botón «DBG» del panel de depuración; habría que ocultarlo en exportaciones release (cambio en el repo de FractalBlast).
4. Vídeo de Narthex con la AR real: grabar la pantalla del Pixel 9a (`adb shell screenrecord`) y sustituir `video/narthex.mp4`.
5. Builds de Windows (Rodamons) y web de MathDungeon para quitar «Próximamente».

## Dudas abiertas
- Los sprites de MathDungeon sin origen claro (Enemy_Animations_Set, RPG_Hero) salen en el vídeo: Luis dijo incluirlo igual.
- ¿Se pone el enlace de la web pública en la intranet o se deja separado?
