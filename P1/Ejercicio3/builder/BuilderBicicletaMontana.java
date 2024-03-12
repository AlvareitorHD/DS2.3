package builder;

import bicicleta.Bicicleta;
import bicicleta.BicicletaMontana;

public class BuilderBicicletaMontana implements Builder{
    private Bicicleta bicicleta;

    public BuilderBicicletaMontana() {
        bicicleta = new BicicletaMontana();
    }

    // Métodos para construir la bicicleta paso a paso
    public void construirManillar() {
        bicicleta.manillar = "a";
    }

    public void construirFrenos(int cantidad) {
        bicicleta.frenos = cantidad;
    }

    public void construirMarchas(String tipo) {
        bicicleta.marchas = tipo;
    }

    public void construirCuadro(String tipo) {
        bicicleta.cuadro = tipo;
    }

    public void construirSillin(String tipo) {
        bicicleta.sillin = tipo;
    }

    public void construirRuedas(int cantidad) {
        bicicleta.ruedas = cantidad;
    }

    public void construirPedales(String tipo) {
        bicicleta.pedales = tipo;
    }

    public void construirCadena(int numEslabones) {
        bicicleta.cadena = numEslabones;
    }

    // Método para obtener la bicicleta construida
    public Bicicleta build() {
        return bicicleta;
    }
}
