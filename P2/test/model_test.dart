import 'package:ejercicio3/models/bicicleta/bicicleta.dart';
import 'package:ejercicio3/models/bicicleta/bicicleta_carretera.dart';
import 'package:ejercicio3/models/bicicleta/bicicleta_montana.dart';
import 'package:ejercicio3/models/decorador/decorador_bicicleta.dart';
import 'package:ejercicio3/models/decorador/decorador_bicicleta_con_estampado.dart';
import 'package:ejercicio3/models/decorador/decorador_bicicleta_con_funda.dart';
import 'package:ejercicio3/models/nombres_imagenes_bicicletas.dart';
import 'package:flutter_test/flutter_test.dart';

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

    test('\nPrueba 1: Crear una bicicleta de montaña', () {
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
    });

    test('\nPrueba 3: Decorar una bicicleta de montaña con un estampado', () {
      DecoradorBicicleta biciMonEst = DecoradorBicicletaConEstampado(biciMon);
      biciMonEst.bicicletaDecorada.asociarImagen(BICI_MON_EST);

      expect(biciMonEst.extra, equals("ESTAMPADO"));
      expect(biciMonEst.bicicletaDecorada.imagenRepresentativa,
          equals(BICI_MON_EST));
      expect(biciMonEst.bicicletaDecorada.tipoBicicleta, "montana");
    });

    test('\nPrueba 6: Decorar una bicicleta de montaña con varias fundas',
        () {
      DecoradorBicicleta biciMonFun = DecoradorBicicletaConFunda(biciMon);
      DecoradorBicicleta biciMonFun1 =
          DecoradorBicicletaConFunda(biciMonFun);
      DecoradorBicicleta biciMonFun2 =
          DecoradorBicicletaConFunda(biciMonFun1);
      biciMonFun2.bicicletaDecorada.asociarImagen(BICI_MON_FUN);

      // Utilizando RegExp para contar las ocurrencias de 'ESTAMPADO'
      var resultString = biciMonFun2.toString();
      var estampadoCount = RegExp('FUNDA').allMatches(resultString).length;

      expect(estampadoCount, equals(3));
      expect(biciMonFun2.extra, equals("FUNDA"));
      expect(biciMonFun2.bicicletaDecorada.imagenRepresentativa,
          equals(BICI_MON_FUN));
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
  });
}
