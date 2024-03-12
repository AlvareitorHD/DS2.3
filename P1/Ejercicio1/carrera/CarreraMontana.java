package carrera;

import bicicleta.BicicletaMontana;

/**
 * Clase que extiende de Carrera, la cual representa la carrera de bicicletas de montaña
 */
public class CarreraMontana extends Carrera {

    /**
     * Constructor por parámetro, que llama al constructor de Carrera para incializar los atributos
     */
    public CarreraMontana(int numBicicletas) {
        super(numBicicletas);
    }


    /**
     * Inicia la carrera de montaña
     */
    @Override
    public void iniciarCarrera() {
        System.out.println("\nIniciada CARRERA DE MONTAÑA\n");
        /*System.out.println("Bicicletas participantes en la carrera de montaña:\n");
        obtenerInfoBicicletas();*/
    }

    /**
     * Finaliza la carrera de montaña, anunciando el ganador
     */
    @Override
    public void finalizarCarrera() {
        System.out.println("\nFinalizada CARRERA DE MONTAÑA. Ganador: bicicleta '" + obtenerIdGanador() + "'\n");
    }

    /**
     * Ejecuta inicialmente la carrera
     */
    @Override
    public void run() {
        final int PORCENTAJE_RETIRADA = 20;

        // Computar porcentaje de retirada antes de finalizar la carrera:
        computarRetiradas(PORCENTAJE_RETIRADA);
        System.out.println("Bicicletas retiradas en CARRERA DE MONTAÑA: " + bicicletasRetiradas + " (" +
                PORCENTAJE_RETIRADA + "%)\n");

        simular(); // Simular la carrera
    }
}
