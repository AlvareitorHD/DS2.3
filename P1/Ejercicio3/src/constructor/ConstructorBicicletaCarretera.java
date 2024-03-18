package constructor;

import bicicleta.BicicletaCarretera;

/**
 * Clase constructora para bicicletas de carretera. Esta hereda de Constructor
 */
public class ConstructorBicicletaCarretera extends Constructor {
    /**
     * Constructor de la clase sin parámetros. Inicializa la bicicleta a una bicicleta de carretera por defecto
     */
    public ConstructorBicicletaCarretera() { bicicleta = new BicicletaCarretera(); }

    /**
     * Implementación del método abstracto 'recomponer', que reinicializa la instancia de bicicleta de carretera
     */
    @Override
    public void recomponer() {
        bicicleta = new BicicletaCarretera();
    }
}
