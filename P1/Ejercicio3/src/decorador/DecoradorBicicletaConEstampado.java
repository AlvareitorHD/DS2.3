package decorador;

import bicicleta.Bicicleta;

public class DecoradorBicicletaConEstampado extends DecoradorBicicleta {

    public DecoradorBicicletaConEstampado(Bicicleta bicicletaADecorar) {
        super(bicicletaADecorar);
        extra = "ESTAMPADO";
    }

    @Override
    public void avanzar() {
        System.out.println("\nLa bicicleta con estampado está avanzando...");
    }
}
