package bicicleta;

public abstract class Bicicleta {

    protected String tipoManillar;

    protected String tipoFrenos;

    protected int numFrenos;

    protected String tipoTransmision;

    protected String tipoCuadro;

    protected String tipoSillin;

    protected String tipoRuedas;

    protected int numRuedas;


    public Bicicleta() {
        this.tipoManillar = "";
        this.tipoFrenos = "";
        this.numFrenos = 0;
        this.tipoTransmision = "";
        this.tipoCuadro = "";
        this.tipoSillin = "";
        this.tipoRuedas = "";
        this.numRuedas = 0;
    }

    public void establecerManillar(String tipo) {
        tipoManillar = tipo;
    }

    public void establecerFrenos(String tipo, int num) {
        tipoFrenos = tipo;
        numFrenos  = num;
    }

    public void establecerTransmision(String tipo) {
        tipoTransmision = tipo;
    }

    public void establecerCuadro(String tipo) {
        tipoCuadro = tipo;
    }

    public void establecerSillin(String tipo) {
        tipoSillin = tipo;
    }

    public void establecerRuedas(String tipo, int num) {
        tipoRuedas = tipo;
        numRuedas  = num;
    }

    public abstract void avanzar();
}
