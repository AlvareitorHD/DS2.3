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
        return (super.toString() +
                "\tTipo de suspensión: " + tipoSuspension + "\n" +
                "\tNúmero de suspensiones: " + numSuspensiones + "\n" +
                "\tTIPO DE BICICLETA: montaña" + "\n");
    }
}
