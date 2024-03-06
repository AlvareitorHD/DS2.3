package carrera;

import bicicleta.BicicletaCarretera;

/**
 * Clase que extiende de Carrera, la cual representa la carrera de bicicletas de carretera
 */
public class CarreraCarretera extends Carrera {

    /**
     * Constructor por parámetro, que llama al constructor de Carrera y añade a la carrera el número de bicicletas de
     * carretera indicado
     * @param numBicicletas Número de bicicletas a añadir a la carrera
     */
    public CarreraCarretera(int numBicicletas) {
        super(numBicicletas);
    }


    /**
     * Inicia la carrera de carretera
     */
    @Override
    public void iniciarCarrera() {
        System.out.println("\nIniciada CARRERA DE CARRETERA\n");
        /*System.out.println("Bicicletas participantes en la carrera de carretera:\n");
        obtenerInfoBicicletas();*/
    }

    /**
     * Finaliza la carrera de carretera, anunciando el ganador
     */
    @Override
    public void finalizarCarrera() {
        System.out.println("\nFinalizada CARRERA DE CARRETERA. Ganador: bicicleta '" + obtenerIdGanador() + "'\n");
    }

    /**
     * Ejecuta inicialmente la carrera
     */
    @Override
    public void run() {
        final int PORCENTAJE_RETIRADA = 10;

        // Computar porcentaje de retirada antes de finalizar la carrera:
        computarRetiradas(PORCENTAJE_RETIRADA);
        System.out.println("Bicicletas retiradas en CARRERA DE CARRETERA: " + bicicletasRetiradas + " (" +
                PORCENTAJE_RETIRADA + "%)\n");

        simular(); // Simular la carrera
    }
}
