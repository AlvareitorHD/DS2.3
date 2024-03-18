package decorador;

import bicicleta.Bicicleta;

/**
 * Clase abstracta que hereda de Bicicleta, la cual representa un decorador de bicicletas. Esta clase es una bicicleta
 * y, además, tiene una bicicleta, lo cual permitirá agragar capas encima de la bicicleta primaria
 */
public abstract class DecoradorBicicleta extends Bicicleta {
    /**
     * Instancia de la bicicleta a la que se le aplicarán los diferentes tipos de decoraciones
     */
    protected Bicicleta bicicletaDecorada;

    /**
     * Añadido especial a la bicicleta (almacenará la decoración específica)
     */
    protected String extra;

    /**
     * Constructor de la clase. Asigna a la bicicleta implícita la bicicleta recibida por parámetro. Después, sobre
     * esta bicicleta primaria se aplicarán las diferentes capas decorativas
     * @param bicicletaADecorar Bicicleta de base sobre la que aplicar las decoraciones
     */
    DecoradorBicicleta(Bicicleta bicicletaADecorar) {
        bicicletaDecorada = bicicletaADecorar;
    }

    /**
     * Sobreescritura del método 'toString' para representar la información de la bicicleta. Llama al de la superclase
     * para contar con la información general de la bicicleta y, además, le añade información específica sobre ese
     * extra decorativo
     * @return Cadena con la información completa de la bicicleta
     */
    @Override
    public String toString() {
        return (bicicletaDecorada.toString() +
                "\tExtra: " + extra + "\n");
    }
}
