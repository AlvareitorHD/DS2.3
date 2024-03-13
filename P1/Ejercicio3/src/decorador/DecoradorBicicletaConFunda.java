package decorador;

import bicicleta.Bicicleta;

public class DecoradorBicicletaConFunda extends DecoradorBicicleta {

    public DecoradorBicicletaConFunda(Bicicleta bicicletaADecorar) {
        super(bicicletaADecorar);
    }

    @Override
    public void avanzar() {

    }

    @Override
    public String toString() {
        return "DecoradorBicicletaConFunda {" +
                "bicicletaDecorada = " + bicicletaDecorada.toString() +
                '}';
    }

}
