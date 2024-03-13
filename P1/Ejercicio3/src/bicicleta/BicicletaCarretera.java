package bicicleta;

public class BicicletaCarretera extends Bicicleta {

    public BicicletaCarretera() { ; }

    @Override
    public void avanzar() {
        System.out.println("\nLa bicicleta de carretera está avanzando...");
    }

    @Override
    public String toString() {
        return "BicicletaCarretera {" +
                "tipoManillar='" + tipoManillar + '\'' +
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
