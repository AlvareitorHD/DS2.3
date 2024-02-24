package factoria;

import bicicleta.Bicicleta;
import bicicleta.BicicletaCarretera;
import bicicleta.BicicletaMontana;
import carrera.Carrera;
import carrera.CarreraCarretera;
import carrera.CarreraMontana;

import java.util.ArrayList;

public class FactoriaMontana implements FactoriaCarreraYBicicleta {
    public FactoriaMontana() { }

    @Override
    public Carrera crearCarrera() {
        return new CarreraMontana();
    }

    @Override
    public Bicicleta crearBicicleta(int id) {
        return new BicicletaMontana(id);
    }
}
