package constructor;

import bicicleta.BicicletaCarretera;

public class ConstructorBicicletaCarretera extends Constructor {

    public ConstructorBicicletaCarretera() { bicicleta = new BicicletaCarretera(); }

    @Override
    public void recomponer() {
        bicicleta = new BicicletaCarretera();
    }

}
