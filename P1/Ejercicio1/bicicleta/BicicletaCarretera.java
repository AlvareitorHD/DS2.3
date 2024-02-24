package bicicleta;

public class BicicletaCarretera extends Bicicleta {

    public BicicletaCarretera(int id) { super(id); }
    @Override
    public void avanzar() {
        System.out.println("La bicicleta de carretera con identificador '" + super.obtenerId() + "' está avanzando");
    }
}
