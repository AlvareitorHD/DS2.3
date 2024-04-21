class Tarea {

  final String _nombre;
  bool _completado = false;

  Tarea(this._nombre);

  String get nombre => _nombre;
  bool get completado => _completado;

  void marcar() {
    _completado = !_completado;
  }

}