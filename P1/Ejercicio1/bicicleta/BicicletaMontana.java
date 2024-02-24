package bicicleta;

public class BicicletaMontana extends Bicicleta{

    public BicicletaMontana(int id) {super(id);}

    @Override
    public void avanzar() {
        System.out.println("La bicicleta de montaña con identificador '" + super.obtenerId() + "' está avanzando");
    }
}
