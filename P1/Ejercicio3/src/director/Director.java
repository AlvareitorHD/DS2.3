package director;

import constructor.Constructor;
import constructor.*;

public class Director {

    public Director() { ; }

    public void hacerBicicletaMontana(Constructor constructor) {
        if (constructor instanceof ConstructorBicicletaMontana) {
            constructor.recomponer();
            constructor.construirManillar("RECTO");
            ((ConstructorBicicletaMontana) constructor).construirSuspension("ROSCADA", 1);
            constructor.construirFrenos("DISCO", 2);
            constructor.construirTransmision("SHIMANO");
            constructor.construirCuadro("ALUMINIO");
            constructor.construirSillin("SEMIRREDONDEADO");
            constructor.construirRuedas("OFF-ROAD", 2);
        }
    }

    public void hacerBicicletaCarretera(Constructor constructor) {
        if (constructor instanceof ConstructorBicicletaCarretera) {
            constructor.recomponer();
            constructor.construirManillar("ERGONÓMICO");
            constructor.construirFrenos("DISCO", 2);
            constructor.construirTransmision("SHIMANO");
            constructor.construirCuadro("FIBRA CARBONO");
            constructor.construirSillin("ESTRECHO");
            constructor.construirRuedas("ESCALADORAS", 2);
        }
    }

    public void hacerBicicletaDecorada(Constructor constructor) {
        if (constructor instanceof ConstructorBicicletaDecorada) {
            ((ConstructorBicicletaDecorada) constructor).agregarEstampado();
            ((ConstructorBicicletaDecorada) constructor).agregarFunda();
        }
    }
}
