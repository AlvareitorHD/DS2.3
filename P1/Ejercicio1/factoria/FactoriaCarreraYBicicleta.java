package factoria;

import bicicleta.Bicicleta;
import carrera.Carrera;

/**
 * Interfaz para representar la factoría que se encargará de crear las carreras y las bicicletas
 */
public interface FactoriaCarreraYBicicleta {
    /**
     * Crea una carrera de bicicletas
     * @param numBicicletas Número de bicicletas que contendrá la carrera
     * @return Objeto Carrera con el tipo de carrera de bicicletas creada
     */
    Carrera crearCarrera(int numBicicletas);

    /**
     * Crea una bicicleta
     * @param id Identificador que tendrá la bicicleta
     * @return Objeto Bicicleta con el tipo de bicicleta creada
     */
    Bicicleta crearBicicleta(int id);
}
