package constructor;

import bicicleta.Bicicleta;
import decorador.DecoradorBicicletaConEstampado;
import decorador.DecoradorBicicletaConFunda;

public class ConstructorBicicletaDecorada extends Constructor {

    public ConstructorBicicletaDecorada(Bicicleta bicicleta) {
        this.bicicleta = bicicleta;
    }

    @Override
    public void recomponer() {
        bicicleta = null;
    }

    public void agregarEstampado() {
        bicicleta = new DecoradorBicicletaConEstampado(bicicleta);
    }

    public void agregarFunda() {
        bicicleta = new DecoradorBicicletaConFunda(bicicleta);
    }


}
