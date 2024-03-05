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
     * Crea una carrera de bicicletas de carretera
     * @param numBicicletas Número de bicicletas de carretera que contendrá la carrera
     * @return Objeto Carrera con la carrera de carretera
     */
    @Override
    public Carrera crearCarrera(int numBicicletas) {
        return new CarreraCarretera(numBicicletas);
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