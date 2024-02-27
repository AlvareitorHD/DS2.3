package bicicleta;

/**
 * Clase abstracta para representar a una bicicleta
 */
public abstract class Bicicleta {

    /**
     * Identificador de la bicicleta
     */
    protected int id;

    /**
     * Metros recorridos
     */
    public int metros;

    // Métodos NO abstractos:

    /**
     * Constructor por parámetro que inicializa los atributos
     * @param id Identificador de la bicicleta
     */
    public Bicicleta(int id) {
        //Random random = new Random();
        //id = random.nextInt(1000);
        this.id = id;
        this.metros = 0;
    }

    /**
     * Consultor del identificador de la bicicleta
     * @return Identificador de la bicicleta
     */
    public int obtenerId() {
        return (id);
    }

    // Métodos abstractos:

    /**
     * Hace que la bicicleta avance
     */
    public abstract void avanzar();

}
