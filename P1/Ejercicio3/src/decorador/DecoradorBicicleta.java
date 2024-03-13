package decorador;

import bicicleta.Bicicleta;

public abstract class DecoradorBicicleta extends Bicicleta {

    protected Bicicleta bicicletaDecorada;

    DecoradorBicicleta(Bicicleta bicicletaADecorar) {
        bicicletaDecorada = bicicletaADecorar;
    }
}
