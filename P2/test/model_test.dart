import 'package:ejercicio3/controlador_backend.dart';
import 'package:ejercicio3/models/bicicleta/bicicleta.dart';
import 'package:ejercicio3/models/bicicleta/bicicleta_carretera.dart';
import 'package:ejercicio3/models/bicicleta/bicicleta_montana.dart';
import 'package:ejercicio3/models/constructor/constructor_bicicleta_carretera.dart';
import 'package:ejercicio3/models/constructor/constructor_bicicleta_decorada.dart';
import 'package:ejercicio3/models/constructor/constructor_bicicleta_montana.dart';
import 'package:ejercicio3/models/decorador/decorador_bicicleta.dart';
import 'package:ejercicio3/models/decorador/decorador_bicicleta_con_estampado.dart';
import 'package:ejercicio3/models/decorador/decorador_bicicleta_con_funda.dart';
import 'package:ejercicio3/models/nombres_imagenes_bicicletas.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ejercicio3/models/director/director.dart';

void main() {
  /// Agrupación de las pruebas relacionadas con las bicicletas de montaña:
  group('Pruebas para bicicleta de montaña', () {
    late Bicicleta biciMon;

    setUp(() {
      biciMon = BicicletaMontana();

      biciMon.establecerManillar("RECTO");
      (biciMon as BicicletaMontana).establecerSuspension("ROSCADA", 1);
      biciMon.establecerFrenos("DISCO", 2);
      biciMon.establecerTransmision("SHIMANO");
      biciMon.establecerCuadro("ALUMINIO");
      biciMon.establecerSillin("SEMIRREDONDEADO");
      biciMon.establecerRuedas("OFF-ROAD", 2);
      (biciMon as BicicletaMontana).asociarImagen(BICI_MON);
    });

    test('\nPrueba 1: Crear una bicicleta de montaña', () async {
      expect(biciMon.tipoManillar, equals("RECTO"));
      expect((biciMon as BicicletaMontana).tipoSuspension, equals("ROSCADA"));
      expect((biciMon as BicicletaMontana).numSuspensiones, equals(1));
      expect(biciMon.tipoFrenos, equals("DISCO"));
      expect(biciMon.numFrenos, equals(2));
      expect(biciMon.tipoTransmision, equals("SHIMANO"));
      expect(biciMon.tipoCuadro, equals("ALUMINIO"));
      expect(biciMon.tipoSillin, equals("SEMIRREDONDEADO"));
      expect(biciMon.tipoRuedas, equals("OFF-ROAD"));
      expect(biciMon.numRuedas, equals(2));
      expect(biciMon.imagenRepresentativa, equals(BICI_MON));

      ControladorBackend controller = ControladorBackend();
      await controller.crearBicicleta(biciMon);
    });

    test('\nPrueba 3: Decorar una bicicleta de montaña con un estampado', () {
      DecoradorBicicleta biciMonEst = DecoradorBicicletaConEstampado(biciMon);
      biciMonEst.bicicletaDecorada.asociarImagen(BICI_MON_EST);

      expect(biciMonEst.extra, equals("ESTAMPADO"));
      expect(biciMonEst.bicicletaDecorada.imagenRepresentativa,
          equals(BICI_MON_EST));
      expect(biciMonEst.bicicletaDecorada.tipoBicicleta, "montana");
    });

    test('\nPrueba 6: Decorar una bicicleta de montaña con varias fundas', () {
      DecoradorBicicleta biciMonFun = DecoradorBicicletaConFunda(biciMon);
      DecoradorBicicleta biciMonFun1 = DecoradorBicicletaConFunda(biciMonFun);
      DecoradorBicicleta biciMonFun2 = DecoradorBicicletaConFunda(biciMonFun1);
      biciMonFun2.bicicletaDecorada.asociarImagen(BICI_MON_FUN);

      // Utilizando RegExp para contar las ocurrencias de 'ESTAMPADO'
      var resultString = biciMonFun2.toString();
      var estampadoCount = RegExp('FUNDA').allMatches(resultString).length;

      expect(estampadoCount, equals(3));
      expect(biciMonFun2.extra, equals("FUNDA"));
      expect(biciMonFun2.bicicletaDecorada.imagenRepresentativa,
          equals(BICI_MON_FUN));
    });

    test(
        "Prueba 7.1: Decorar una bicicleta de montaña alternando entre estampado y funda",
        () {
      DecoradorBicicleta biciMonDec = DecoradorBicicletaConEstampado(biciMon);
      biciMonDec = DecoradorBicicletaConFunda(biciMonDec);
      biciMonDec = DecoradorBicicletaConEstampado(biciMonDec);
      biciMonDec = DecoradorBicicletaConFunda(biciMonDec);

      var resultString = biciMonDec.toString();
      var estampadoCount = RegExp('ESTAMPADO').allMatches(resultString).length;
      var fundaCount = RegExp('FUNDA').allMatches(resultString).length;

      expect(estampadoCount, equals(2));
      expect(fundaCount, equals(2));
      expect(biciMonDec.extra, equals('FUNDA'));
    });

    test(
        "Prueba 8.1: Asociar una imagen de bicicleta a una bicicleta decorada con varias fundas",
        () {
      expect(biciMon.imagenRepresentativa, equals(BICI_MON));

      DecoradorBicicleta biciFun = DecoradorBicicletaConFunda(biciMon);
      biciFun.asociarImagen(BICI_MON_FUN);
      expect(biciFun.imagenRepresentativa, equals(BICI_MON_FUN));

      biciFun = DecoradorBicicletaConFunda(biciFun);
      biciFun.asociarImagen(BICI_MON_FUN);
      expect(biciFun.imagenRepresentativa, equals(BICI_MON_FUN));
    });

    test(
        "Prueba 9.1: Asociar una imagen de bicicleta a una bicicleta decorada con varios estampados",
        () {
      expect(biciMon.imagenRepresentativa, equals(BICI_MON));

      DecoradorBicicleta biciEst = DecoradorBicicletaConEstampado(biciMon);
      biciEst.asociarImagen(BICI_MON_FUN);
      expect(biciEst.imagenRepresentativa, equals(BICI_MON_FUN));

      biciEst = DecoradorBicicletaConEstampado(biciEst);
      biciEst.asociarImagen(BICI_MON_FUN);
      expect(biciEst.imagenRepresentativa, equals(BICI_MON_FUN));
    });

    test('Prueba 13: toString() muestra correctamente varias fundas', () {
      DecoradorBicicleta biciEst = DecoradorBicicletaConFunda(biciMon);
      expect(biciEst.toString(), contains("Extra: FUNDA"));

      biciEst = DecoradorBicicletaConFunda(biciEst);
      RegExp regex = RegExp("Extra: FUNDA");
      expect(regex.allMatches(biciEst.toString()), hasLength(2));

      biciEst = DecoradorBicicletaConFunda(biciEst);
      expect(regex.allMatches(biciEst.toString()), hasLength(3));
    });

    test('Prueba 14: toString() muestra correctamente varios estampados', () {
      DecoradorBicicleta biciEst = DecoradorBicicletaConEstampado(biciMon);
      expect(biciEst.toString(), contains("Extra: ESTAMPADO"));

      biciEst = DecoradorBicicletaConEstampado(biciEst);
      RegExp regex = RegExp("Extra: ESTAMPADO");
      expect(regex.allMatches(biciEst.toString()), hasLength(2));

      biciEst = DecoradorBicicletaConEstampado(biciEst);
      expect(regex.allMatches(biciEst.toString()), hasLength(3));
    });

    test(
        'Prueba 15: toString() muestra correctamente varias fundas y estampados',
        () {
      DecoradorBicicleta biciEst = DecoradorBicicletaConFunda(biciMon);
      expect(biciEst.toString(), contains("Extra: FUNDA"));

      biciEst = DecoradorBicicletaConFunda(biciEst);
      RegExp regex = RegExp("Extra: FUNDA");
      expect(regex.allMatches(biciEst.toString()), hasLength(2));

      biciEst = DecoradorBicicletaConFunda(biciEst);
      expect(regex.allMatches(biciEst.toString()), hasLength(3));

      RegExp regex2 = RegExp("Extra: ESTAMPADO");

      biciEst = DecoradorBicicletaConEstampado(biciEst);
      expect(regex2.allMatches(biciEst.toString()), hasLength(1));
      expect(regex.allMatches(biciEst.toString()), hasLength(3));

      biciEst = DecoradorBicicletaConEstampado(biciEst);
      expect(regex2.allMatches(biciEst.toString()), hasLength(2));
      expect(regex.allMatches(biciEst.toString()), hasLength(3));
    });
  });

  /// Agrupación de las pruebas relacionadas con las bicicletas de carretera:
  group('Pruebas para bicicleta de carretera', () {
    late Bicicleta biciCar;

    setUp(() {
      biciCar = BicicletaCarretera();

      biciCar.establecerManillar("ERGONÓMICO");
      biciCar.establecerFrenos("DISCO", 2);
      biciCar.establecerTransmision("SHIMANO");
      biciCar.establecerCuadro("FIBRA_CARBONO");
      biciCar.establecerSillin("ESTRECHO");
      biciCar.establecerRuedas("ESCALADORAS", 2);
      (biciCar as BicicletaCarretera).asociarImagen(BICI_CAR);
    });

    test('\nPrueba 2: Crear una bicicleta de carretera', () {
      expect(biciCar.tipoManillar, equals("ERGONÓMICO"));
      expect(biciCar.tipoFrenos, equals("DISCO"));
      expect(biciCar.numFrenos, equals(2));
      expect(biciCar.tipoTransmision, equals("SHIMANO"));
      expect(biciCar.tipoCuadro, equals("FIBRA_CARBONO"));
      expect(biciCar.tipoSillin, equals("ESTRECHO"));
      expect(biciCar.tipoRuedas, equals("ESCALADORAS"));
      expect(biciCar.numRuedas, equals(2));
      expect(biciCar.imagenRepresentativa, equals(BICI_CAR));
    });

    test('\nPrueba 4: Decorar una bicicleta de carretera con una funda', () {
      DecoradorBicicleta biciCarFun = DecoradorBicicletaConFunda(biciCar);
      biciCarFun.bicicletaDecorada.asociarImagen(BICI_CAR_FUN);

      expect(biciCarFun.extra, equals("FUNDA"));
      expect(biciCarFun.bicicletaDecorada.imagenRepresentativa,
          equals(BICI_CAR_FUN));
      expect(biciCarFun.bicicletaDecorada.tipoBicicleta, "carretera");
    });

    test('\nPrueba 5: Decorar una bicicleta de carretera con varios estampados',
        () {
      DecoradorBicicleta biciCarEst = DecoradorBicicletaConEstampado(biciCar);
      DecoradorBicicleta biciCarEst1 =
          DecoradorBicicletaConEstampado(biciCarEst);
      DecoradorBicicleta biciCarEst2 =
          DecoradorBicicletaConEstampado(biciCarEst1);
      biciCarEst2.bicicletaDecorada.asociarImagen(BICI_CAR_EST);

      // Utilizando RegExp para contar las ocurrencias de 'ESTAMPADO'
      var resultString = biciCarEst2.toString();
      var estampadoCount = RegExp('ESTAMPADO').allMatches(resultString).length;

      expect(estampadoCount, equals(3));
      expect(biciCarEst2.extra, equals("ESTAMPADO"));
      expect(biciCarEst2.bicicletaDecorada.imagenRepresentativa,
          equals(BICI_CAR_EST));
    });

    test(
        "Prueba 7.2: Decorar una bicicleta de carretera alternando entre estampado y funda",
        () {
      DecoradorBicicleta biciCarDec = DecoradorBicicletaConEstampado(biciCar);
      biciCarDec = DecoradorBicicletaConFunda(biciCarDec);
      biciCarDec = DecoradorBicicletaConEstampado(biciCarDec);
      biciCarDec = DecoradorBicicletaConFunda(biciCarDec);

      var resultString = biciCarDec.toString();
      var estampadoCount = RegExp('ESTAMPADO').allMatches(resultString).length;
      var fundaCount = RegExp('FUNDA').allMatches(resultString).length;

      expect(estampadoCount, equals(2));
      expect(fundaCount, equals(2));
      expect(biciCarDec.extra, equals('FUNDA'));
    });

    test(
        "Prueba 8.2: Asociar una imagen de bicicleta a una bicicleta decorada con varias fundas",
        () {
      expect(biciCar.imagenRepresentativa, equals(BICI_CAR));

      DecoradorBicicleta biciFun = DecoradorBicicletaConFunda(biciCar);
      biciFun.asociarImagen(BICI_CAR_FUN);
      expect(biciFun.imagenRepresentativa, equals(BICI_CAR_FUN));

      biciFun = DecoradorBicicletaConFunda(biciFun);
      biciFun.asociarImagen(BICI_CAR_FUN);
      expect(biciFun.imagenRepresentativa, equals(BICI_CAR_FUN));
    });

    test(
        "Prueba 9.2: Asociar una imagen de bicicleta a una bicicleta decorada con varios estampados",
        () {
      expect(biciCar.imagenRepresentativa, equals(BICI_CAR));

      DecoradorBicicleta biciEst = DecoradorBicicletaConEstampado(biciCar);
      biciEst.asociarImagen(BICI_CAR_FUN);
      expect(biciEst.imagenRepresentativa, equals(BICI_CAR_FUN));

      biciEst = DecoradorBicicletaConEstampado(biciEst);
      biciEst.asociarImagen(BICI_CAR_FUN);
      expect(biciEst.imagenRepresentativa, equals(BICI_CAR_FUN));
    });
  });

  group('Pruebas a bicicleta decorada', () {
    late ConstructorBicicletaCarretera car = ConstructorBicicletaCarretera();
    ;
    late ConstructorBicicletaMontana mon = ConstructorBicicletaMontana();
    late Director director = Director();

    //Creamos las bicicletas con sus atributos
    director.hacerBicicletaCarretera(car);
    director.hacerBicicletaMontana(mon);
    Bicicleta bicicar = car.obtenerResultado() as Bicicleta;
    Bicicleta bicimon = mon.obtenerResultado() as Bicicleta;

    test(
        "Prueba 10: Comprobar que una bicicleta decorada tenga bien asociada su imagen según la última decoración añadida",
        () {
      //Agregamos funda
      ConstructorBicicletaDecorada c1 = ConstructorBicicletaDecorada(bicicar);
      ConstructorBicicletaDecorada c2 = ConstructorBicicletaDecorada(bicimon);

      director.hacerBicicletaDecoradaConFunda(c1);
      director.hacerBicicletaDecoradaConFunda(c2);

      bicicar = c1.obtenerResultado() as Bicicleta;
      bicimon = c2.obtenerResultado() as Bicicleta;

      expect(bicicar.imagenRepresentativa, 'bici_car_fun.png');
      expect(bicimon.imagenRepresentativa, 'bici_mon_fun.png');

      //Agregamos estampado encima
      director.hacerBicicletaDecoradaConEstampado(c1);
      director.hacerBicicletaDecoradaConEstampado(c2);

      bicicar = c1.obtenerResultado() as Bicicleta;
      bicimon = c2.obtenerResultado() as Bicicleta;

      expect(bicicar.imagenRepresentativa, 'bici_car_est.png');
      expect(bicimon.imagenRepresentativa, 'bici_mon_est.png');

      //Agregamos otra funda encima
      director.hacerBicicletaDecoradaConFunda(c1);
      director.hacerBicicletaDecoradaConFunda(c2);

      bicicar = c1.obtenerResultado() as Bicicleta;
      bicimon = c2.obtenerResultado() as Bicicleta;

      expect(bicicar.imagenRepresentativa, 'bici_car_fun.png');
      expect(bicimon.imagenRepresentativa, 'bici_mon_fun.png');
    });

    test(
        "Prueba 11: Comprobar que una bicicleta con funda tenga el EXTRA en el método toString",
        () {
      // Reiniciamos las bicis
      bicicar = car.obtenerResultado() as Bicicleta;
      bicimon = mon.obtenerResultado() as Bicicleta;
      //Agregamos funda
      ConstructorBicicletaDecorada c1 = ConstructorBicicletaDecorada(bicicar);
      ConstructorBicicletaDecorada c2 = ConstructorBicicletaDecorada(bicimon);
      c1.agregarFunda();
      c2.agregarFunda();
      bicicar = c1.obtenerResultado() as Bicicleta;
      bicimon = c2.obtenerResultado() as Bicicleta;

      expect(bicicar.toString(), contains("Extra: FUNDA"));
      expect(bicimon.toString(), contains("Extra: FUNDA"));
    });

    test(
        "Prueba 12: Comprobar que una bicicleta con estampado tenga el EXTRA en el método toString",
        () {
      // Reiniciamos las bicis
      bicicar = car.obtenerResultado() as Bicicleta;
      bicimon = mon.obtenerResultado() as Bicicleta;
      //Agregamos estampado
      ConstructorBicicletaDecorada c1 = ConstructorBicicletaDecorada(bicicar);
      ConstructorBicicletaDecorada c2 = ConstructorBicicletaDecorada(bicimon);
      c1.agregarEstampado();
      c2.agregarEstampado();
      bicicar = c1.obtenerResultado() as Bicicleta;
      bicimon = c2.obtenerResultado() as Bicicleta;

      expect(bicicar.toString(), contains("Extra: ESTAMPADO"));
      expect(bicimon.toString(), contains("Extra: ESTAMPADO"));
    });
  });
}
