package concurrencia;

import carrera.Carrera;
import factoria.FactoriaCarreraYBicicleta;
import factoria.FactoriaMontana;
import factoria.FactoriaCarretera;

/**
 * Clase que extiende de Thread, la cual servirá para ejecutar las carreras de forma completamente concurrente
 */
public class Hebra extends Thread {
    /**
     * Número de hebras a lanzar
     */
    public int num;

    /**
     * Porcentaje de hebras que dejarán de ejecutarse primero
     */
    public int porcentaje;

    /**
     * Identificador de la carrera de bicicletas
     */
    private int id = 0;



    /**
     * Constructor por parámetros
     * @param num Número de hebras a lanzar
     * @param id Identificador de la carrera
     */
    public Hebra(int num, int id) {
        super();
        this.num = num;
        this.id = id;
        if (id % 2 == 0) {
            porcentaje = (num * 20) / 100;
            System.out.println("Porcentaje de retirada en Montaña: " + porcentaje + " (20%)");
        } else {
            porcentaje = (num * 10) / 100;
            System.out.println("Porcentaje de retirada en Carretera: " + porcentaje + " (10%)");
        }
    }

    /**
     * Simula una carrera de bicicletas de manera concurrente
     */
    @Override
    public void run() {
        // Crear las carreras:
        FactoriaCarreraYBicicleta factoria;
        Carrera carrera;

        if (id % 2 == 0) {
            factoria = new FactoriaMontana();
            carrera = factoria.crearCarrera();
        } else {
            factoria = new FactoriaCarretera();
            carrera = factoria.crearCarrera();
        }

        // Añadir bicicletas a la carrera:
        for (int i = 0; i < num; i++) {
            carrera.aniadirBicicleta(factoria.crearBicicleta(i));
        }

        long tiempo = 10000;                                                   // IMPORTANTE: 10 segundos (cambiar a 60)

        // Iniciar carrera:
        carrera.iniciarCarrera();
        long startTime = System.currentTimeMillis();

        // Imprimir bicicletas iniciales:
        for (int i = 0; i < num; i++) {
            System.out.println("Carrera de " + ((id%2==0) ? "Montaña" : "Carretera") + ": " + " bicicleta " +
                    carrera.consultarIdBicicleta(i));
        }

        while (System.currentTimeMillis() - startTime < tiempo) {
            // Avanza cada bicicleta 0-10 metros aleatorios:
            for (int i = 0; i < num; i++) {
                carrera.obtenerBicicletas().get(i).avanzar();
            }
            try {
                // Pausa la ejecución del hilo durante 1 segundo
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        // Retirar bicicletas aleatorias:
        for (int i = 0; i < porcentaje; i++) {
            carrera.retirarBicicletaAleatoria(id);
            num--;
        }

        // Finalizar carrera:
        carrera.finalizarCarrera();
    }
}
