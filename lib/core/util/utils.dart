/// Limpia un texto eliminando saltos de línea y espacios en blanco al inicio y al final.
String cleanText(String text) {
  return text.replaceAll('\n', '').replaceAll('\r', '').trim();
}
