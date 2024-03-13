package constructor;

import bicicleta.Bicicleta;
import bicicleta.BicicletaMontana;

public class ConstructorBicicletaMontana implements Constructor {

    private BicicletaMontana bicicleta;


    public ConstructorBicicletaMontana() { bicicleta = new BicicletaMontana(); }

    @Override
    public void recomponer() {
        bicicleta = new BicicletaMontana();
    }

    @Override
    public void construirManillar(String tipo) {
        bicicleta.establecerManillar(tipo);
    }

    @Override
    public void construirFrenos(String tipo, int cantidad) {
        bicicleta.establecerFrenos(tipo, cantidad);
    }

    @Override
    public void construirTransmision(String tipo) {
        bicicleta.establecerTransmision(tipo);
    }

    @Override
    public void construirCuadro(String tipo) {
        bicicleta.establecerCuadro(tipo);
    }

    @Override
    public void construirSillin(String tipo) {
        bicicleta.establecerSillin(tipo);
    }

    @Override
    public void construirRuedas(String tipo, int cantidad) {
        bicicleta.establecerRuedas(tipo, cantidad);
    }

    public void construirSuspension(String tipo, int cantidad) {
        bicicleta.establecerSuspension(tipo, cantidad);
    }

    @Override
   public Bicicleta obtenerResultado() {
        return (bicicleta);
   }

}
