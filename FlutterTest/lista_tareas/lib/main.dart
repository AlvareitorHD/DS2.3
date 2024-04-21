import 'package:flutter/material.dart';
import 'package:lista_tareas/model/gestorTareas.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue));
    return MaterialApp(
      title: "Lista de tareas",
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const AppScaffold(),
    );
  }
}

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {

  GestorTareas gestorTareas = GestorTareas();
  CampoNombreTarea campoNombre = CampoNombreTarea();

  @override
  Widget build(BuildContext context) {
    int numeroTareas = gestorTareas.numeroTareas;
    Widget showingWidget = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No tienes tareas que hacer",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Container(height: 10,),
          const Icon(
            Icons.check_box
          )
        ],
      )
    );
    if (numeroTareas > 0) {
      showingWidget = ListView.builder(
        itemCount: numeroTareas,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: gestorTareas.obtener(index).completado ? Colors.blue[100] : null,
            title: Text(gestorTareas.obtener(index).nombre),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: gestorTareas.obtener(index).completado,
                  onChanged: (value) => setState(() {
                    gestorTareas.marcar(index);
                  })
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => setState(() {
                    gestorTareas.eliminar(index);
                  })
                ),
              ],
            ),
          );
        }
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tareas"),
      ),
      body: Center(
        child: showingWidget
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add_task),
        label: const Text("Crear tarea"),
        tooltip: "Crear tarea",
        onPressed: () => showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  campoNombre,
                  TextButton(
                    child: const Text(
                      'Crear'
                    ),
                    onPressed: () {
                      String nombreTarea = campoNombre.texto;
                      setState(() {
                        gestorTareas.crear(nombreTarea);
                      });
                      campoNombre._controller.text = "";
                      Navigator.of(context).pop();
                    }
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }

}

class CampoNombreTarea extends StatefulWidget {

  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  CampoNombreTarea({super.key});

  String get texto => _controller.text;

  @override
  State<CampoNombreTarea> createState() => _CampoNombreTareaState();

}

class _CampoNombreTareaState extends State<CampoNombreTarea> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: const InputDecoration(
        labelText: "Nombre de la tarea",
        border: OutlineInputBorder()
      ),
    );
  }

}