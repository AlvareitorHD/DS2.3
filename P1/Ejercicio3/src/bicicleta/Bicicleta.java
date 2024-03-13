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


    public Bicicleta() { ; }

    public abstract void avanzar();
}
