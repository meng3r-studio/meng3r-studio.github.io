# Menger Studio · web pública (en pruebas)

Escaparate abierto de los juegos de Menger Studio: https://meng3r-studio.github.io/

- `index.html`: la web entera (HTML + CSS + JS, sin compilación). 7 idiomas.
- `img/`: carátulas y banners (generados con `tools/caratulas.py`).
- `video/`: vídeos cortos de gameplay (MP4 H.264, sin sonido) y sus fotogramas de portada.
- `play/fractalblast/`: FractalBlast exportado a web con Godot 4.7.2 (sin hilos, para GitHub Pages).
- `tools/grabar/`: cómo se grabaron los vídeos (ver `HANDOFF.md`).

El feedback se envía a un script de Google Apps Script que lo reenvía por correo (ver `tools/formulario/`). Los ejecutables están en [menger-studio-builds](https://github.com/meng3r-studio/menger-studio-builds/releases).

Sin publicidad, sin cookies, sin analítica.
