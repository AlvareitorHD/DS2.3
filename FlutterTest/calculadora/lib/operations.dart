enum TipoOperacion {
  suma, resta, multiplicacion, division
}

abstract class Operacion {
  double num1;
  double num2;

  Operacion(this.num1, this.num2);

  double calcular();
}

class Suma extends Operacion {

  Suma(super.num1, super.num2);

  @override
  double calcular() {
    return num1 + num2;
  }
}

class Resta extends Operacion {

  Resta(super.num1, super.num2);

  @override
  double calcular() {
    return num1 - num2;
  }
}

class Multiplicacion extends Operacion {
  
  Multiplicacion(super.num1, super.num2);

  @override
  double calcular() {
    return num1 * num2;
  }
}

class Division extends Operacion {
  
  Division(super.num1, super.num2);

  @override
  double calcular() {
    return num1 / num2;
  }
}
