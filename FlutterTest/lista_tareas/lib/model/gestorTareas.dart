import 'package:lista_tareas/model/tarea.dart';

class GestorTareas {

  List<Tarea> lista = [];

  GestorTareas();
  GestorTareas.desdeLista(this.lista);

  int get numeroTareas => lista.length;

  void crear(String nombre) {
    Tarea t = Tarea(nombre);
    lista.add(t);
  }

  Tarea obtener(int indice) {
    return lista[indice];
  }

  void marcar(int indice) {
    Tarea t = lista[indice];
    t.marcar();
  }

  void eliminar(int indice) {
    lista.removeAt(indice);
  }

}