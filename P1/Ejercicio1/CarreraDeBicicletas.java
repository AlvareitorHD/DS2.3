
import carrera.Carrera;
import factoria.FactoriaCarreraYBicicleta;
import factoria.FactoriaCarretera;
import factoria.FactoriaMontana;

import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Clase que contiene el 'main', donde se lanzan las carreras de bicicletas
 */
public class CarreraDeBicicletas {
    /**
     * Mínimo número de bicicletas
     */
    public static final int MIN = 5;
    /**
     * Máximo número de bicicletas
     */
    public static final int MAX = 20;
    /**
     * Número de hilos (hebras) a ejecutar
     */
    public static final int NUM_HILOS = 2;

    /**
     * Función principal que lanza las carreras
     * @param args Array de argumentos
     */
    public static void main(String[] args) {
        // Computar un número aleatorio de bicicletas para las carreras:
        Random rand                                 = new Random();
        final int numBicicletas                     = MIN + rand.nextInt(MAX - MIN + 1);
        // Crear las factorías:
        FactoriaCarreraYBicicleta factoriaMontana   = new FactoriaMontana();
        FactoriaCarreraYBicicleta factoriaCarretera = new FactoriaCarretera();
        // Crear las carreras:
        Carrera carreraMontana                      = factoriaMontana.crearCarrera(numBicicletas);
        Carrera carreraCarretera                    = factoriaCarretera.crearCarrera(numBicicletas);

        // Añadir las bicicletas a sendas carreras:
        for (int i = 0; i < numBicicletas; i++) {
            carreraMontana.aniadirBicicleta(factoriaMontana.crearBicicleta(i));
            carreraCarretera.aniadirBicicleta(factoriaCarretera.crearBicicleta(i));
        }

        // Informar por pantalla del número de bicicletas que participarán en las carreras:
        System.out.println("Las carreras estarán compuestas por " + numBicicletas + " bicicletas\n");

        try {
            // Crear un ExecutorService con un pool de hilos (se aúnan varios hilos, en lugar de crear uno por cada carrera):
            ExecutorService ejecutor = Executors.newFixedThreadPool(NUM_HILOS);

            // Enviar las carreras al ExecutorService para ejecutarse concurrentemente:
            ejecutor.execute(carreraMontana);
            ejecutor.execute(carreraCarretera);

            // Cerrar el ExecutorService:
            ejecutor.shutdown();
        } catch (Exception e) {
            System.out.println("Error a la hora de ejecutar los hilos de las carreras");
            System.out.println(e);
        }
    }
}