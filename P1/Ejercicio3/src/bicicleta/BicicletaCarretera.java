package bicicleta;

/**
 * Clase hija de Bicicleta. Esta representa a una bicicleta de carretera
 */
public class BicicletaCarretera extends Bicicleta {
    /**
     * Constructor de la clase sin parámetros. Llama al constructor de la superclase para que esta inicialice a valores
     * por defecto los componentes de la bicicleta
     */
    public BicicletaCarretera() { super(); }

    /**
     * Implementación del método abstracto 'avanzar'. Imprime la forma en la que la bicicleta de carretera está
     * avanzando
     */
    @Override
    public void avanzar() {
        System.out.println("\nLa bicicleta de carretera está avanzando...");
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
                "\tTIPO DE BICICLETA: carretera" + "\n");
    }
}