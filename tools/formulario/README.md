# Formulario de la web (Google Apps Script)

GitHub Pages no puede enviar correos, así que el formulario de ideas y opiniones manda los datos a un pequeño script de Google (`Code.gs`). El script reenvía cada mensaje por Gmail a la cuenta que lo ha publicado. La dirección de correo no aparece en la web ni en el script.

## Publicarlo (una vez)
1. Con la cuenta que debe recibir los mensajes, entra en https://script.google.com y crea un **proyecto nuevo**.
2. Borra lo que haya y pega el contenido de `Code.gs`. Guarda.
3. **Implementar → Nueva implementación** → tipo **Aplicación web**.
   - Ejecutar como: **Yo**
   - Quién tiene acceso: **Cualquier usuario**
4. **Implementar** y autoriza los permisos. Google avisará de que la app no está verificada: es tuya, entra en *Configuración avanzada → Ir a … (no seguro)*.
5. Copia la **URL de la aplicación web** (acaba en `/exec`) y ponla en `FORM_URL` dentro de `index.html`.

## Cambiar el script después
Editar el código y hacer **Implementar → Gestionar implementaciones → editar → Nueva versión**. Así la URL no cambia.

## Límites
- Gmail permite unos 100 correos al día desde scripts en cuentas gratuitas.
- El script acepta como mucho 20 envíos por hora (`MAX_POR_HORA`) como freno al spam.
