package constructor;

import bicicleta.Bicicleta;

/**
 * Clase abstracta que representa a un constructor. En este caso, servirá para construir bicicletas
 */
public abstract class Constructor {

    /**
     * Instancia con la bicicleta que se manipulará en la construcción
     */
    protected Bicicleta bicicleta;

    /**
     * Constructor de la clase sin parámetros. Inicializa a 'null' la bicicleta (esta podrá ser de diferentes tipos)
     */
    public Constructor() {
        this.bicicleta = null;
    }

    /**
     * Método abstracto que servirá para reinicializar la instancia de bicicleta específica. Esto será útil para volver
     * a partir de una bicicleta por defecto en el momento en el que no se quiera disponer más de la anterior
     */
    public abstract void recomponer();

    /**
     * Construye el manillar de la bicicleta
     * @param tipo Tipo de manillar
     */
    public void construirManillar(String tipo) {
        bicicleta.establecerManillar(tipo);
    }

    /**
     * Construye los frenos de la bicicleta
     * @param tipo Tipo de frenos
     * @param cantidad Cantidad de frenos
     */
    public void construirFrenos(String tipo, int cantidad) {
        bicicleta.establecerFrenos(tipo, cantidad);
    }

    /**
     * Construye la transmisión de la bicicleta
     * @param tipo Tipo de transmisión
     */
    public void construirTransmision(String tipo) {
        bicicleta.establecerTransmision(tipo);
    }

    /**
     * Construye el cuadro de la bicicleta
     * @param tipo Tipo de cuadro
     */
    public void construirCuadro(String tipo) {
        bicicleta.establecerCuadro(tipo);
    }

    /**
     * Construye el sillín de la bicicleta
     * @param tipo Tipo de sillín
     */
    public void construirSillin(String tipo) {
        bicicleta.establecerSillin(tipo);
    }

    /**
     * Construye las ruedas de la bicicleta
     * @param tipo Tipo de ruedas
     * @param cantidad Cantidad de ruedas
     */
    public void construirRuedas(String tipo, int cantidad) {
        bicicleta.establecerRuedas(tipo, cantidad);
    }

    /**
     * Devuelve la bicicleta construida hasta el momento
     * @return Referencia a la bicicleta construida hasta el momento
     */
    public Bicicleta obtenerResultado() {
        return (bicicleta);
    }

}
