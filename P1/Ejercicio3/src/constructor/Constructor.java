package constructor;

import bicicleta.Bicicleta;

public abstract class Constructor {

    protected Bicicleta bicicleta;


    public Constructor() {
        this.bicicleta = null;
    }

    public abstract void recomponer();

    public void construirManillar(String tipo) {
        bicicleta.establecerManillar(tipo);
    }

    public void construirFrenos(String tipo, int cantidad) {
        bicicleta.establecerFrenos(tipo, cantidad);
    }

    public void construirTransmision(String tipo) {
        bicicleta.establecerTransmision(tipo);
    }

    public void construirCuadro(String tipo) {
        bicicleta.establecerCuadro(tipo);
    }

    public void construirSillin(String tipo) {
        bicicleta.establecerSillin(tipo);
    }

    public void construirRuedas(String tipo, int cantidad) {
        bicicleta.establecerRuedas(tipo, cantidad);
    }

    public Bicicleta obtenerResultado() {
        return (bicicleta);
    }

}
