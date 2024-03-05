package factoria;

import bicicleta.Bicicleta;
import bicicleta.BicicletaMontana;
import carrera.Carrera;
import carrera.CarreraMontana;

/**
 * Clase que representa la factoría que se encargará de crear las carreras y las bicicletas de montaña. Esta
 * implementa la interfaz FactoriaCarreraYBicicleta
 */
public class FactoriaMontana implements FactoriaCarreraYBicicleta {
    /**
     * Crea una carrera de bicicletas de montaña
     * @param numBicicletas Número de bicicletas que contendrá la carrera
     * @return Objeto Carrera con la carrera de montaña
     */
    @Override
    public Carrera crearCarrera(int numBicicletas) {
        return new CarreraMontana(numBicicletas);
    }

    /**
     * Crea una bicicleta de montaña
     * @param id Identificador que tendrá la bicicleta de montaña
     * @return Objeto Bicicleta con la bicicleta de montaña
     */
    @Override
    public Bicicleta crearBicicleta(int id) {
        return new BicicletaMontana(id);
    }
}
