package constructor;

import bicicleta.Bicicleta;

public interface Constructor {

    public void recomponer();

    public void construirManillar(String tipo);

    public void construirFrenos(String tipo, int cantidad);

    public void construirTransmision(String tipo);

    public void construirCuadro(String tipo);

    public void construirSillin(String tipo);

    public void construirRuedas(String tipo, int cantidad);

    public Bicicleta obtenerResultado();

}
