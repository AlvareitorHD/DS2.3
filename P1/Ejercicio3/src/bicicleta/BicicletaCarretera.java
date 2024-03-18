package bicicleta;

public class BicicletaCarretera extends Bicicleta {

    public BicicletaCarretera() { super(); }

    @Override
    public void avanzar() {
        System.out.println("\nLa bicicleta de carretera está avanzando...");
    }

    @Override
    public String toString() {
        return (super.toString() +
                "\tTIPO DE BICICLETA: carretera" + "\n");
    }
}