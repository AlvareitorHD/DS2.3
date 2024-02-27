package bicicleta;

import java.util.Random;

public class BicicletaMontana extends Bicicleta{

    /**
     * Constructor por parámetro, el cual se encarga de llamar al constructor de Bicicleta
     * @param id Identificar interno de la bicicleta
     */
    public BicicletaMontana(int id) {super(id);

    }

    /**
     * Hace que la bicicleta de montaña avance a su modo
     */
    @Override
    public void avanzar() {
        Random rand = new Random();
        /*int distancia = 0;
        while (distancia <= 1){
            distancia = rand.nextInt(11);
        }*/

        System.out.println("La bicicleta de montaña con identificador '" + super.obtenerId() + "' está avanzando");
    }
}
