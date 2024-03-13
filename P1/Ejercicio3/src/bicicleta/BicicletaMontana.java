package bicicleta;

public class BicicletaMontana extends Bicicleta {

    protected String tipoSuspension;


    @Override
    public void avanzar() {
        System.out.println("\nLa bicicleta de montaña está avanzando...");
    }

    @Override
    public String toString() {
        return "BicicletaMontana {" +
                "tipoSuspension='" + tipoSuspension + '\'' +
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
