package carrera;

/**
 * Clase que extiende de Carrera, la cual representa la carrera de bicicletas de montaña
 */
public class CarreraMontana extends Carrera {

    /**
     * Constructor sin parámetros
     */
    public CarreraMontana() { }

    /**
     * Método abstracto que inicia la carrera de montaña
     */
    @Override
    public void iniciarCarrera() {
        System.out.println("Se ha iniciado la carrera de montaña");
    }

    /**
     * Método abstracto que finaliza la carrera de montaña, anunciando el ganador
     */
    @Override
    public void finalizarCarrera() {
        System.out.println("Se ha finalizado la carrera de montaña y el ganador es la bicicleta " +
                obtenerIdGanador());
    }
}
