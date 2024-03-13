package decorador;

import bicicleta.Bicicleta;

public class DecoradorBicicletaConEstampado extends DecoradorBicicleta {

    public DecoradorBicicletaConEstampado(Bicicleta bicicletaADecorar) {
        super(bicicletaADecorar);
    }

    @Override
    public void avanzar() {
        System.out.println("\nLa bicicleta de carretera con estampado está avanzando...");
    }

    @Override
    public String toString() {
        return "DecoradorBicicletaConEstampado {" +
                "bicicletaDecorada = " + bicicletaDecorada.toString() +
                '}';
    }

}
