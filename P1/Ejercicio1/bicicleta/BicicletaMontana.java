package bicicleta;

/**
 * Clase que representa a una bicicleta de montaña y que deriva de Bicicleta
 */
public class BicicletaMontana extends Bicicleta {

    /**
     * Constructor por parámetro, el cual se encarga de llamar al constructor de Bicicleta
     * @param id Identificador interno de la bicicleta
     */
    public BicicletaMontana(int id) {super(id);

    }

    /**
     * Hace que la bicicleta de montaña avance a su modo
     */
    @Override
    public void avanzar() {
        System.out.println("BICICLETA DE MONTAÑA '" + obtenerId() + "': ha avanzado " + computarDistancia() +
                " metros");
    }
}
