package director;

import constructor.Constructor;
import constructor.*;

/**
 * Clase que representa a un director para orquestar las construcciones de bicicletas. Solo se construirán a través de
 * él
 */
public class Director {
    /**
     * Constructor de la clase. Este no realiza ninguna acción, puesto que no tiene atributos ni resulta necesario
     */
    public Director() { ; }

    /**
     * Manda construir una bicicleta de montaña, estableciendo los pasos necesarios para ello. Lo primero que realiza
     * es la recomposición de la bicicleta. Es decir, reinicializa la instancia de la bicicleta interna para construir
     * otra diferente
     * @param constructor Constructor para ensamblar la bicicleta
     */
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

    /**
     * Manda construir una bicicleta de carretera, estableciendo los pasos necesarios para ello. Lo primero que realiza
     * es la recomposición de la bicicleta. Es decir, reinicializa la instancia de la bicicleta interna para construir
     * otra diferente
     * @param constructor Constructor para ensamblar la bicicleta
     */
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

    /**
     * Manda construir una bicicleta decorada, estableciendo los pasos necesarios para ello
     * @param constructor Constructor para ensamblar la bicicleta
     */
    public void hacerBicicletaDecorada(Constructor constructor) {
        if (constructor instanceof ConstructorBicicletaDecorada) {
            ((ConstructorBicicletaDecorada) constructor).agregarEstampado();
            ((ConstructorBicicletaDecorada) constructor).agregarFunda();
        }
    }
}
