package carrera;

/**
 * Clase que extiende de Carrera, la cual representa la carrera de bicicletas de carretera
 */
public class CarreraCarretera extends Carrera {

    /**
     * Constructor sin parámetros
     */
    public CarreraCarretera() { }

    /**
     * Método abstracto que inicia la carrera de carretera
     */
    @Override
    public void iniciarCarrera() {
        System.out.println("Se ha iniciado la carrera de carretera");
    }

    /**
     * Método abstracto que finaliza la carrera de carretera, anunciando el ganador
     */
    @Override
    public void finalizarCarrera() {
        System.out.println("Se ha finalizado la carrera de carretera y el ganador es la bicicleta " +
                obtenerIdGanador());
    }
}
