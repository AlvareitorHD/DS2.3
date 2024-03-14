package constructor;

import bicicleta.BicicletaMontana;

public class ConstructorBicicletaMontana extends Constructor {

    public ConstructorBicicletaMontana() { bicicleta = new BicicletaMontana(); }

    @Override
    public void recomponer() {
        bicicleta = new BicicletaMontana();
    }

    public void construirSuspension(String tipo, int cantidad) {
        ((BicicletaMontana) bicicleta).establecerSuspension(tipo, cantidad);
    }

}
