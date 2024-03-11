package builder;

import bicicleta.Bicicleta;

public interface Builder {
   // public void recomponer();
  public Bicicleta build();
    public void construirManillar();
    public void construirFrenos(int cantidad);
    public void construirMarchas(String tipo);
    public void construirCuadro(String tipo);
    public void construirSillin(String tipo);
    public void construirRuedas(int cantidad);
    public void construirPedales(String tipo);
    public void construirCadena(int numEslabones);
}
