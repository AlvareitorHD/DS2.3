// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:test_app_1/operations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true),
      home: const MyHomePage(title: 'Calculadora'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double result = 0;
  NumberInputField campoNumero1 = NumberInputField(label: 'Numero 1');
  NumberInputField campoNumero2 = NumberInputField(label: 'Numero 2');
  Operacion operacion = Suma(0, 0);

  String resultToString() {
    String str = '$result';

    if (str.endsWith('.0')) {
      str = str.substring(0, str.length - 2);
    }

    return str;
  }

  void cambiarOperacion(String opcion) {

    switch (opcion) {
      case 'suma':
        operacion = Suma(operacion.num1, operacion.num2);
        break;
      case 'resta':
        operacion = Resta(operacion.num1, operacion.num2);
        break;
      case 'multiplicacion':
        operacion = Multiplicacion(operacion.num1, operacion.num2);
        break;
      case 'division':
        operacion = Division(operacion.num1, operacion.num2);
        break;
      default:
        break;
    }

  }

  void calcularResultado() {
    setState(() { // Incorrect use of ParentDataWidget ???????
      operacion.num1 = campoNumero1.numero;
      operacion.num2 = campoNumero2.numero;
      result = operacion.calcular();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DisplayContainer(display: resultToString(),),
                campoNumero1,
                OperationSelector(onChange: (value) {
                  cambiarOperacion(value);
                }),
                campoNumero2,
                CalculateButton(function: calcularResultado)
              ],
            ),
          ),
        ));
  }
}

class DisplayContainer extends StatefulWidget {
  final String display;

  const DisplayContainer({super.key, this.display = '0'});

  @override
  State<DisplayContainer> createState() => _DisplayContainerState();
}

class _DisplayContainerState extends State<DisplayContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Text(
        widget.display.toString(),
        maxLines: 1,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}

class NumberInputField extends StatefulWidget {
  final String label;
  final TextEditingController _controller = TextEditingController();

  NumberInputField({super.key, this.label = 'Label'});

  TextEditingController get controller => _controller;
  double get numero => double.parse(controller.text);

  @override
  State<NumberInputField> createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
              labelText: widget.label, border: const OutlineInputBorder()),
          style: Theme.of(context).textTheme.displaySmall,
          keyboardType: TextInputType.number),
    );
  }
}

class OperationSelector extends StatefulWidget {
  final ValueChanged<String> onChange;

  const OperationSelector({super.key, required this.onChange});

  @override
  State<OperationSelector> createState() => _OperationSelectorState();
}

class _OperationSelectorState extends State<OperationSelector> {
  String seleccion = TipoOperacion.suma.toString();
  final List<String> listaTipos = List<String>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    for (TipoOperacion tipo in TipoOperacion.values) {
      listaTipos.add(tipo.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: DropdownMenu<String>(
          label: Text(
            'Tipo de operacion',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          width: 380,
          textStyle: Theme.of(context).textTheme.displaySmall,
          initialSelection: listaTipos.first,
          dropdownMenuEntries:
              listaTipos.map<DropdownMenuEntry<String>>((String name) {
            String capitalizedName = name[0].toUpperCase() + name.substring(1);
            Icon entryIcon;
            switch (name) {
              case 'suma':
                entryIcon = Icon(Icons.add);
                break;
              case 'resta':
                entryIcon = Icon(Icons.remove);
                break;
              case 'multiplicacion':
                entryIcon = Icon(Icons.close);
                break;
              case 'division':
                entryIcon = Icon(Icons.safety_divider);
                break;
              default:
                entryIcon = Icon(Icons.question_mark);
                break;
            }
            return DropdownMenuEntry<String>(
                value: name,
                label: capitalizedName,
                leadingIcon: entryIcon);
          }).toList(),
          onSelected: (value) {
            if (value != null) {
              setState(() {
                seleccion = value;
                widget.onChange(value);
              });
            }
          }),
    );
  }
}

class CalculateButton extends StatefulWidget {
  final void Function() function;

  const CalculateButton({super.key, required this.function});

  @override
  State<StatefulWidget> createState() => _CalculateButtonState();
}

class _CalculateButtonState extends State<CalculateButton> {
  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
        icon: Icon(Icons.check),
        label: Text('Calcular'),
        onPressed: widget.function);
  }
}
