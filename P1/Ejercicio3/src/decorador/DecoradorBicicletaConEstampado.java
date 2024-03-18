package decorador;

import bicicleta.Bicicleta;

/**
 * Clase que hereda de DecoradorBicicleta, la cual representa el decorador que añade un estampado a una bicicleta
 */
public class DecoradorBicicletaConEstampado extends DecoradorBicicleta {
    /**
     * Constructor de la clase. Llama al constructor de la superclase para establecer la bicicleta sobre la que trabajar
     * y, además, le añade el extra decorativo; en este caso particular, un estampado
     * @param bicicletaADecorar Bicicleta de base sobre la que aplicar las decoraciones
     */
    public DecoradorBicicletaConEstampado(Bicicleta bicicletaADecorar) {
        super(bicicletaADecorar);
        extra = "ESTAMPADO";
    }

    /**
     * Implementación del método abstracto 'avanzar'. Imprime la forma en la que la bicicleta del tipo que sea con
     * estampado está avanzando
     */
    @Override
    public void avanzar() {
        System.out.println("\nLa bicicleta con estampado está avanzando...");
    }
}
