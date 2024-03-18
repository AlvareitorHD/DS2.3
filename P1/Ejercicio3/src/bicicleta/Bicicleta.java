package bicicleta;

/**
 * Clase abstracta que representa a una bicicleta de manera general
 */
public abstract class Bicicleta {
    /**
     * Tipo de manillar
     */
    protected String tipoManillar;

    /**
     * Tipo de frenos
     */
    protected String tipoFrenos;

    /**
     * Número de frenos
     */
    protected int numFrenos;

    /**
     * Tipo de transmisión
     */
    protected String tipoTransmision;

    /**
     * Tipo de cuadro
     */
    protected String tipoCuadro;

    /**
     * Tipo de sillín
     */
    protected String tipoSillin;

    /**
     * Tipo de ruedas
     */
    protected String tipoRuedas;

    /**
     * Número de ruedas
     */
    protected int numRuedas;

    /**
     * Constructor de la clase sin parámetros. Inicializa a valores por defecto los componentes de la bicicleta
     */
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

    /**
     * Modificador del manillar
     * @param tipo Tipo de manillar
     */
    public void establecerManillar(String tipo) {
        tipoManillar = tipo;
    }

    /**
     * Modificador de los frenos
     * @param tipo Tipo de frenos
     * @param num Número de frenos
     */
    public void establecerFrenos(String tipo, int num) {
        tipoFrenos = tipo;
        numFrenos  = num;
    }

    /**
     * Modificador de la transmisión
     * @param tipo Tipo de transmisión
     */
    public void establecerTransmision(String tipo) {
        tipoTransmision = tipo;
    }

    /**
     * Modificador del cuadro
     * @param tipo Tipo de cuadro
     */
    public void establecerCuadro(String tipo) {
        tipoCuadro = tipo;
    }

    /**
     * Modificador del sillín
     * @param tipo Tipo de sillín
     */
    public void establecerSillin(String tipo) {
        tipoSillin = tipo;
    }

    /**
     * Modificador de las ruedas
     * @param tipo Tipo de ruedas
     * @param num Número de ruedas
     */
    public void establecerRuedas(String tipo, int num) {
        tipoRuedas = tipo;
        numRuedas  = num;
    }

    /**
     * Método abstracto para que la bicicleta avance (cada tipo de bicicleta avanzará a su manera)
     */
    public abstract void avanzar();

    /**
     * Sobreescritura del método 'toString' para representar la información de la bicicleta
     * @return Cadena con la información de la bicicleta
     */
    @Override
    public String toString() {
        return ("\nBicicleta:\n\n" +
                "\tTipo de manillar: " + tipoManillar + "\n" +
                "\tTipo de frenos: " + tipoFrenos + "\n" +
                "\tNúmero de frenos: " + numFrenos + "\n" +
                "\tTipo de transmisión: " + tipoTransmision + "\n" +
                "\tTipo de cuadro: " + tipoCuadro + "\n" +
                "\tTipo de sillín: " + tipoSillin + "\n" +
                "\tTipo de ruedas: " + tipoRuedas + "\n" +
                "\tNúmero de Ruedas: " + numRuedas + "\n");
    }
}
