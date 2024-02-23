package P1;

public class FactoriaMontana implements FactoriaCarreraYBicicleta{
    public Carrera crearCarrera(){
        return new CarreraMontana();
    }
    public Bicicleta crearBicicleta(){
        return new BicicletaMontana();
    }
}
