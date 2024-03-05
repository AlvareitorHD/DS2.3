package bicicleta;

import java.util.concurrent.ThreadLocalRandom;

/**
 * Clase abstracta para representar a una bicicleta
 */
public abstract class Bicicleta {

    /**
     * Identificador de la bicicleta
     */
    protected int id;

    /**
     * Distancia recorrida en total en un momento dado (en metros)
     */
    public int distanciaTotal;


    // Métodos NO abstractos:

    /**
     * Constructor por parámetro que inicializa los atributos
     * @param id Identificador de la bicicleta
     */
    public Bicicleta(int id) {
        this.id             = id;
        this.distanciaTotal = 0;
    }

    /**
     * Consultor del identificador de la bicicleta
     * @return Identificador de la bicicleta
     */
    public int obtenerId() {
        return (id);
    }

    /**
     * Calcula aleatoriamente la distancia que recorre la bicicleta en un momento del tiempo (en un rango de 50 a 100
     * metros)
     * @return Distancia avanzada en ese momento
     */
    public int computarDistancia() {
        int distanciaAvanzada = ThreadLocalRandom.current().nextInt(50, 101); // Avanza entre 50 y 100 metros
        distanciaTotal += distanciaAvanzada;

        return (distanciaAvanzada);
    }


    // Métodos abstractos:

    /**
     * Método abstracto que hará que una bicicleta avance
     */
    public abstract void avanzar();
}
