
import concurrencia.Hebra;

import java.util.Random;

/**
 * Clase que contiene el 'main', donde se lanzan las carreras de bicicletas
 */
public class PruebaEjercicio1 {

    public static void main(String[] args) {
        // Obtener un número aleatorio de bicicletas para la carrera:
        Random rand       = new Random();
        int numBicicletas = 0;

        while (numBicicletas <= 1) {
            numBicicletas = rand.nextInt(25);
        }

        System.out.println("Las carreras estarán compuestas por " + numBicicletas + " bicicletas");

        // Se crean las dos carreras:
        Hebra carMon = new Hebra(numBicicletas,0);
        Hebra carCar = new Hebra(numBicicletas,1);

        // Se inician las carreras concurrentemente:
        carMon.start();
        carCar.start();
    }
}