
import carrera.Carrera;
import factoria.FactoriaCarreraYBicicleta;
import factoria.FactoriaCarretera;
import factoria.FactoriaMontana;

import java.util.Random;

public class PruebaEjercicio1 {

    public static void main(String[] args) {
        //Obtener un número aleatorio de bicicletas para la carrera:
        Random rand = new Random();
        int numBicicletas = 0;
        while (numBicicletas <= 1){
            numBicicletas = rand.nextInt(25);
        }

        System.out.println("Las carreras estarán compuestas por " + numBicicletas + " bicicletas");

        Hebra carMon = new Hebra(numBicicletas,0);
        Hebra carCar = new Hebra(numBicicletas,1);


        carMon.start();
        carCar.start();

    }
}