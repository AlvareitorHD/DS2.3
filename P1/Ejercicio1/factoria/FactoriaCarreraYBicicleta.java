package factoria;
import bicicleta.Bicicleta;
import carrera.Carrera;

/**
 * Interfaz para representar la factoría que se encargará de crear las carreras y las bicicletas
 */
public interface FactoriaCarreraYBicicleta {
    /**
     * Crea una carrera de bicicletas
     * @return Objeto Carrera con el tipo de carrera de bicicletas creada
     */
    public Carrera crearCarrera();

    /**
     * Crea una bicicleta
     * @param id Identificador que tendrá la bicicleta
     * @return Objeto Bicicleta con el tipo de bicicleta creada
     */
    public Bicicleta crearBicicleta(int id);
}
