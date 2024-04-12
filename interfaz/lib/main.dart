import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageSwitcher(),
    );
  }
}

class ImageSwitcher extends StatefulWidget {
  @override
  _ImageSwitcherState createState() => _ImageSwitcherState();
}

class _ImageSwitcherState extends State<ImageSwitcher> {
  String? selectedImage1 = 'assets/boo.jpeg'; // Imagen seleccionada 1
  String? selectedImage2 = 'assets/d.jpg'; // Imagen seleccionada 2
  int selectedImageIndex2 = 1; // Índice de la imagen seleccionada 2

  // Lista de opciones de imágenes
  List<String> imageOptions = [
    'assets/boo.jpeg',
    'assets/d.jpg',
    'assets/d.jpeg',
  ];

  String? selectedOption = 'Con estampado'; // Opción seleccionada inicialmente
  String? selectedOption2 = 'Carretera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BikeBuilder Plus'),
      ),
      backgroundColor: Colors.blue, // Establecer el color de fondo
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0), // Añadir margen arriba y a los lados
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinear los widgets a la izquierda
          children: [
            ElevatedButton(
              onPressed: () {
                // Lógica para añadir bicicleta
                // Por ahora, solo imprime un mensaje en la consola
                print('Añadir bicicleta');
              },
              child: Text('Añadir bicicleta'),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0), // Añadir margen alrededor del botón
                  child: DropdownButton<String>(
                    value: selectedOption2,
                    items: ['Carretera', 'Montana'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption2 = newValue;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                    child: selectedImage1 != null ? Image.asset(selectedImage1!) : Container(), // Mostrar imagen seleccionada 1
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Espaciado entre las filas
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0), // Añadir margen alrededor del botón
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para añadir bicicleta
                      // Por ahora, solo imprime un mensaje en la consola
                      print('Añadir decorado');
                    },
                    child: Text('Añadir decorado'),
                  ),
                ),
                // Widget de imagen adicional

              ],
            ),
            SizedBox(height: 20), // Espaciado entre las filas
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0), // Añadir margen alrededor del botón
                  child: DropdownButton<String>(
                    value: selectedOption,
                    items: ['Con estampado', 'Con funda'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue;
                      });
                    },
                  ),
                ),
                // Widget de imagen adicional

              ],
            ),
            SizedBox(height: 20), // Espaciado entre las filas
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para eliminar bicicleta
                    // Por ahora, solo imprime un mensaje en la consola
                    print('Eliminar bicicleta');
                  },
                  child: Text('Eliminar bicicleta'),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: selectedImage2 != null ? Image.asset(selectedImage2!) : Container(), // Mostrar imagen seleccionada 2
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              setState(() {
                                // Lógica para cambiar a la imagen anterior para el widget 2
                                if (selectedImageIndex2 > 0) {
                                  selectedImageIndex2--;
                                } else {
                                  selectedImageIndex2 = imageOptions.length - 1;
                                }
                                selectedImage2 = imageOptions[selectedImageIndex2];
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () {
                              setState(() {
                                // Lógica para cambiar a la siguiente imagen para el widget 2
                                selectedImageIndex2 = (selectedImageIndex2 + 1) % imageOptions.length;
                                selectedImage2 = imageOptions[selectedImageIndex2];
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
