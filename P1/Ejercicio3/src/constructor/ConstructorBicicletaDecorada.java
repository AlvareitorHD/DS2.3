package constructor;

import bicicleta.Bicicleta;
import decorador.DecoradorBicicletaConEstampado;
import decorador.DecoradorBicicletaConFunda;

/**
 * Clase constructora para bicicletas decoradas. Esta hereda de Constructor
 */
public class ConstructorBicicletaDecorada extends Constructor {
    /**
     * Constructor de la clase con parámetro. Inicializa la bicicleta a una bicicleta pasada por parámetro. Esto
     * permite construir cualquier tipo de bicicleta con decoración
     */
    public ConstructorBicicletaDecorada(Bicicleta bicicleta) {
        this.bicicleta = bicicleta;
    }

    /**
     * Agrega un estampado a la bicicleta actual
     */
    public void agregarEstampado() {
        bicicleta = new DecoradorBicicletaConEstampado(bicicleta);
    }

    /**
     * Agrega una funda a la bicicleta actual
     */
    public void agregarFunda() {
        bicicleta = new DecoradorBicicletaConFunda(bicicleta);
    }

    /**
     * Implementación del método abstracto 'recomponer', que reinicializa la instancia de bicicleta a 'null' (puesto
     * que puede ser cualquier tipo de bicicleta)
     */
    @Override
    public void recomponer() {
        bicicleta = null;
    }
}
