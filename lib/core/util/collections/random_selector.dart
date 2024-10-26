import 'dart:math';

/// Clase que permite seleccionar elementos aleatorios de una lista.
/// 
/// Esta clase asegura que no se repitan las selecciones consecutivas, 
/// manteniendo un registro de los últimos elementos seleccionados.
class RandomSelector<T> {
  final List<T> items; 
  final List<T> lastSelected = [];

  RandomSelector(this.items) {
    if (items.isEmpty) {
      throw Exception('La lista no puede estar vacía');
    }
  }

  /// Método que obtiene un elemento aleatorio de la lista, 
  /// asegurando que no sea el último seleccionado.
  /// Retorna null si todos los elementos han sido seleccionados.
  T? getRandomElement() {
    final filteredItems = items.where((item) => !lastSelected.contains(item)).toList();
    if (filteredItems.isEmpty) {
      return null; 
    }

    final randomIndex = Random().nextInt(filteredItems.length);
    T selectedItem = filteredItems[randomIndex];

    _updateLastSelected(selectedItem);
    return selectedItem;
  }

  /// Actualiza la lista de elementos seleccionados recientemente.
  void _updateLastSelected(T selectedItem) {
    lastSelected.add(selectedItem);
        if (lastSelected.length > 2) {
      lastSelected.removeAt(0); 
    }
  }
}
