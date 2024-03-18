package bicicleta;

/**
 * Clase hija de Bicicleta. Esta representa a una bicicleta de montaña
 */
public class BicicletaMontana extends Bicicleta {

    /**
     * Tipo de suspensión
     */
    protected String tipoSuspension;

    /**
     * Número de suspensiones
     */
    protected int numSuspensiones;

    /**
     * Constructor de la clase sin parámetros. Llama al constructor de la superclase para que esta inicialice a valores
     * por defecto los componentes de la bicicleta, además de inicializar los propios a valores por defecto
     */
    public BicicletaMontana() {
        super();
        this.tipoSuspension = "";
        this.numSuspensiones = 0;
    }

    /**
     * Modificador de la suspensión
     * @param tipo Tipo de suspensión
     * @param num Número de suspensiones
     */
    public void establecerSuspension(String tipo, int num) {
        tipoSuspension  = tipo;
        numSuspensiones = num;
    }

    /**
     * Implementación del método abstracto 'avanzar'. Imprime la forma en la que la bicicleta de montaña está
     * avanzando
     */
    @Override
    public void avanzar() {
        System.out.println("\nLa bicicleta de montaña está avanzando...");
    }

    /**
     * Sobreescritura del método 'toString' para representar la información de la bicicleta. Llama al de la superclase
     * para contar con la información general de la bicicleta y, además, le añade información específica de este tipo
     * de bicicleta
     * @return Cadena con la información completa de la bicicleta
     */
    @Override
    public String toString() {
        return (super.toString() +
                "\tTipo de suspensión: " + tipoSuspension + "\n" +
                "\tNúmero de suspensiones: " + numSuspensiones + "\n" +
                "\tTIPO DE BICICLETA: montaña" + "\n");
    }
}
