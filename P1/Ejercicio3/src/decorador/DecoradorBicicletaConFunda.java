package decorador;

import bicicleta.Bicicleta;

/**
 * Clase que hereda de DecoradorBicicleta, la cual representa el decorador que añade una funda a una bicicleta
 */
public class DecoradorBicicletaConFunda extends DecoradorBicicleta {
    /**
     * Constructor de la clase. Llama al constructor de la superclase para establecer la bicicleta sobre la que trabajar
     * y, además, le añade el extra decorativo; en este caso particular, una funda
     * @param bicicletaADecorar Bicicleta de base sobre la que aplicar las decoraciones
     */
    public DecoradorBicicletaConFunda(Bicicleta bicicletaADecorar) {
        super(bicicletaADecorar);
        extra = "FUNDA";
    }

    /**
     * Implementación del método abstracto 'avanzar'. Imprime la forma en la que la bicicleta del tipo que sea con
     * funda está avanzando
     */
    @Override
    public void avanzar() {
        System.out.println("\nLa bicicleta con funda está avanzando...");
    }
}
