package decorador;

import bicicleta.Bicicleta;

public class DecoradorBicicletaConFunda extends DecoradorBicicleta {

    public DecoradorBicicletaConFunda(Bicicleta bicicletaADecorar) {
        super(bicicletaADecorar);
        extra = "FUNDA";
    }

    @Override
    public void avanzar() {
        System.out.println("\nLa bicicleta con funda está avanzando...");
    }
}
