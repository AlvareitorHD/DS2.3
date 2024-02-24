
import carrera.Carrera;
import factoria.FactoriaCarreraYBicicleta;
import factoria.FactoriaCarretera;
import factoria.FactoriaMontana;

import java.util.Random;

public class PruebaEjercicio1 {

    public static void main(String[] args) {
        long TIME = 5000;
        // Obtener un número aleatorio de bicicletas para la carrera:
        Random rand = new Random();
        int numBicicletas = 0;
        while (numBicicletas <= 0){
            numBicicletas = rand.nextInt(25);
        }

        System.out.println("Las carreras estarán compuestas por " + numBicicletas + " bicicletas");

        Hebra carMon = new Hebra(numBicicletas,0);
        Hebra carCar = new Hebra(numBicicletas,1);


        carMon.start();
        carCar.start();
       /*
        // Crear las factorías de las familias de montaña y carretera:
       //FactoriaCarreraYBicicleta factoriaMontana   = new FactoriaMontana();
        FactoriaCarreraYBicicleta factoriaCarretera = new FactoriaCarretera();

        // Crear tanto la carrera de montaña como la de carretera:
        //Carrera carreraMontana   = factoriaMontana.crearCarrera();
        Carrera carreraCarretera = factoriaCarretera.crearCarrera();



        // Añadir las bicicletas a las carreras:
        for (int i = 0; i < numBicicletas; i++)
        {
            //carreraMontana.aniadirBicicleta(factoriaMontana.crearBicicleta());
            carreraCarretera.aniadirBicicleta(factoriaCarretera.crearBicicleta());
        }

        // Iniciar carreras:
        System.out.println("Las carreras estarán compuestas por " + numBicicletas + " bicicletas");
        System.out.println("Carrera de montaña");
        //carreraMontana.iniciarCarrera();
        System.out.println("Carrera de carretera");
        carreraCarretera.iniciarCarrera();

        // Avanzan las bicicletas:
       // System.out.println("Carrera de montaña");
        //for (int i = 0; i < numBicicletas; i++)
          //  System.out.println(carreraMontana.consultarIdBicicleta(i));

        System.out.println("Carrera de carretera");
        for (int i = 0; i < numBicicletas; i++)
            System.out.println(carreraCarretera.consultarIdBicicleta(i));

        // Finalizar carreras:
        //System.out.println("Carrera de montaña");
        //carreraMontana.finalizarCarrera();
        System.out.println("Carrera de carretera");
        carreraCarretera.finalizarCarrera();

        */
    }
}