package bicicleta;

public class BicicletaMontana extends Bicicleta{

    public BicicletaMontana() { }

    @Override
    public void avanzar() {
        System.out.println("La bicicleta de montaña con identificador '" + super.obtenerId() + "' está avanzando");
    }
}
