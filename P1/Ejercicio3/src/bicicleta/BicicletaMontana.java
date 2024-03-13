package bicicleta;

public class BicicletaMontana extends Bicicleta {

    protected String tipoSuspension;

    protected int numSuspensiones;

    public BicicletaMontana() {
        super();
        this.tipoSuspension = "";
        this.numSuspensiones = 0;
    }

    public void establecerSuspension(String tipo, int num) {
        tipoSuspension  = tipo;
        numSuspensiones = num;
    }

    @Override
    public void avanzar() {
        System.out.println("\nLa bicicleta de montaña está avanzando...");
    }

    @Override
    public String toString() {
        return "BicicletaMontana {" +
                "tipoSuspension='" + tipoSuspension + '\'' +
                ", numSuspensiones='" + numSuspensiones + '\'' +
                ", tipoManillar='" + tipoManillar + '\'' +
                ", tipoFrenos='" + tipoFrenos + '\'' +
                ", numFrenos=" + numFrenos +
                ", tipoTransmision='" + tipoTransmision + '\'' +
                ", tipoCuadro='" + tipoCuadro + '\'' +
                ", tipoSillin='" + tipoSillin + '\'' +
                ", tipoRuedas='" + tipoRuedas + '\'' +
                ", numRuedas=" + numRuedas +
                '}';
    }
}
