package bicicleta;

import java.util.Random;

public class BicicletaMontana extends Bicicleta{

    public BicicletaMontana(int id) {super(id);

    }

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
