package factoria;
import bicicleta.Bicicleta;
import bicicleta.BicicletaCarretera;
import carrera.Carrera;
import carrera.CarreraCarretera;

/**
 * Clase que representa la factoría que se encargará de crear las carreras y las bicicletas de carretera. Esta
 * implementa la interfaz FactoriaCarreraYBicicleta
 */
public class FactoriaCarretera implements FactoriaCarreraYBicicleta {
    /**
     * Constructor sin parámetros
     */
    public FactoriaCarretera() { }

    /**
     * Crea una carrera de bicicletas de carretera
     * @return Objeto Carrera con la carrera de carretera
     */
    @Override
    public Carrera crearCarrera() {
        return new CarreraCarretera();
    }

    /**
     * Crea una bicicleta de carretera
     * @param id Identificador que tendrá la bicicleta de carretera
     * @return Objeto Bicicleta con la bicicleta de carretera
     */
    @Override
    public Bicicleta crearBicicleta(int id) {
        return new BicicletaCarretera(id);
    }
}