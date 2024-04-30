import 'package:flutter_test/flutter_test.dart';
import 'package:lista_tareas/model/gestorTareas.dart';
import 'package:lista_tareas/model/tarea.dart';

void main() {
  test("Crear y obtener informacion de tarea", () {
    // Creamos una tarea
    GestorTareas gestorTareas = GestorTareas();
    String nombreTarea = "Mi tarea";
    gestorTareas.crear(nombreTarea);
    expect(gestorTareas.numeroTareas, 1);
    // Obtenemos la tarea
    Tarea tarea = gestorTareas.obtener(0);
    expect(tarea.nombre, nombreTarea);
  });

  test("Marcar tarea como completada y pendiente", () {
    // Creamos una tarea
    GestorTareas gestorTareas = GestorTareas();
    String nombreTarea = "Mi tarea";
    gestorTareas.crear(nombreTarea);
    expect(gestorTareas.numeroTareas, 1);
    // La marcamos como completada
    gestorTareas.marcar(0);
    Tarea tarea = gestorTareas.obtener(0);
    expect(tarea.completado, true);
    // La desmarcamos
    gestorTareas.marcar(0);
    expect(tarea.completado, false);
  });

  test("Eliminar tarea", () {
    // Creamos una tarea
    GestorTareas gestorTareas = GestorTareas();
    String nombreTarea = "Mi tarea";
    gestorTareas.crear(nombreTarea);
    expect(gestorTareas.numeroTareas, 1);
    // La eliminamos
    gestorTareas.eliminar(0);
    expect(gestorTareas.numeroTareas, 0);
  });
}
