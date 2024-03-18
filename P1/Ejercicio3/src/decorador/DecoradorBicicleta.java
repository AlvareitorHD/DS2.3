package decorador;

import bicicleta.Bicicleta;

public abstract class DecoradorBicicleta extends Bicicleta {

    protected Bicicleta bicicletaDecorada;

    protected String extra;

    DecoradorBicicleta(Bicicleta bicicletaADecorar) {
        bicicletaDecorada = bicicletaADecorar;
    }

    @Override
    public String toString() {
        return (bicicletaDecorada.toString() +
                "\tExtra: " + extra + "\n");
    }
}
