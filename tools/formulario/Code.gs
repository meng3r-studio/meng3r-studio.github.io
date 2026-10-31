/**
 * Formulario de Menger Studio: recibe los envíos de la web y los manda por correo.
 *
 * Se publica como "Aplicación web" desde la cuenta de Google que debe recibir los mensajes.
 * El correo se envía a esa misma cuenta: la dirección no aparece ni aquí ni en la web.
 * Instrucciones en README.md (misma carpeta).
 */

const MAX_POR_HORA = 20;      // freno anti-spam: envíos aceptados por hora
const MAX_CAMPO = 4000;       // caracteres por campo

function doPost(e) {
  let data = {};
  try { data = JSON.parse((e && e.postData && e.postData.contents) || "{}"); } catch (err) { return out({ ok: false, error: "json" }); }
  if (data._honey) return out({ ok: true });                 // bot: fingimos éxito

  const cache = CacheService.getScriptCache();
  const n = Number(cache.get("envios") || 0);
  if (n >= MAX_POR_HORA) return out({ ok: false, error: "limite" });
  cache.put("envios", String(n + 1), 3600);

  const subject = String(data._subject || "[Menger] Mensaje de la web").slice(0, 150);
  const body = Object.keys(data)
    .filter(k => !k.startsWith("_"))
    .map(k => k + ": " + String(data[k]).slice(0, MAX_CAMPO))
    .join("\n\n");

  MailApp.sendEmail({ to: Session.getEffectiveUser().getEmail(), subject: subject, body: body || "(vacío)" });
  return out({ ok: true });
}

function doGet() {
  return out({ ok: true, info: "Formulario de Menger Studio" });
}

function out(obj) {
  return ContentService.createTextOutput(JSON.stringify(obj)).setMimeType(ContentService.MimeType.JSON);
}
