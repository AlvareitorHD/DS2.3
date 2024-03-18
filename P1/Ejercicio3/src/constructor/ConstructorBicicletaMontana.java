package constructor;

import bicicleta.BicicletaMontana;

/**
 * Clase constructora para bicicletas de montaña. Esta hereda de Constructor
 */
public class ConstructorBicicletaMontana extends Constructor {
    /**
     * Constructor de la clase sin parámetros. Inicializa la bicicleta a una bicicleta de montaña por defecto
     */
    public ConstructorBicicletaMontana() { bicicleta = new BicicletaMontana(); }

    /**
     * Construye la suspensión
     * @param tipo Tipo de suspensión
     * @param cantidad Cantidad de suspensiones
     */
    public void construirSuspension(String tipo, int cantidad) {
        ((BicicletaMontana) bicicleta).establecerSuspension(tipo, cantidad);
    }

    /**
     * Implementación del método abstracto 'recomponer', que reinicializa la instancia de bicicleta de montaña
     */
    @Override
    public void recomponer() {
        bicicleta = new BicicletaMontana();
    }
}
