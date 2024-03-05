package bicicleta;

/**
 * Clase que representa a una bicicleta de carretera y que deriva de Bicicleta
 */
public class BicicletaCarretera extends Bicicleta {

    /**
     * Constructor por parámetro, el cual se encarga de llamar al constructor de Bicicleta
     * @param id Identificador interno de la bicicleta
     */
    public BicicletaCarretera(int id) { super(id); }

    /**
     * Hace que la bicicleta de carretera avance a su modo
     */
    @Override
    public void avanzar() {
        System.out.println("BICICLETA DE CARRETERA '" + obtenerId() + "': ha avanzado " + computarDistancia() +
                " metros");
    }
}
