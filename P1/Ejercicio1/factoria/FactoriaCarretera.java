package factoria;
import bicicleta.Bicicleta;
import bicicleta.BicicletaCarretera;
import carrera.Carrera;
import carrera.CarreraCarretera;

public class FactoriaCarretera implements FactoriaCarreraYBicicleta {
    public FactoriaCarretera() { }
    @Override
    public Carrera crearCarrera() {
        return new CarreraCarretera();
    }
    @Override
    public Bicicleta crearBicicleta(int id) {

        return new BicicletaCarretera(id);
    }
}