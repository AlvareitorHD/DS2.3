// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_app_1/operations.dart';

void main() {
  test('Las operaciones dan el resultado esperado', () {

    Random rng = Random();
    double num1 = rng.nextDouble() * 1000000;
    double num2 = rng.nextDouble() * 1000000;

    Operacion op = Suma(num1, num2);
    expect(op.calcular(), num1+num2);

    op = Resta(num1, num2);
    expect(op.calcular(), num1-num2);

    op = Multiplicacion(num1, num2);
    expect(op.calcular(), num1*num2);

    op = Division(num1, num2);
    expect(op.calcular(), num1/num2);

  });
}
