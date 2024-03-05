package carrera;

import bicicleta.Bicicleta;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Random;

/**
 * Clase abstracta para representar la carrera de bicicletas. Esta implementa la interfaz Runnable para poder ejecutar
 * carreras de manera concurrente
 */
public abstract class Carrera implements Runnable {
    /**
     * Contendrá todas las bicicletas que participarán en la carrera
     */
    protected ArrayList<Bicicleta> bicicletas;

    /**
     * Número de bicicletas retiradas de la carrera
     */
    protected int bicicletasRetiradas;


    // Métodos NO abstractos:

    /**
     * Constructor por parámetro que inicializa tanto el número de bicicletas retiradas como el array de las bicicletas
     * para poder utilizarlo sin problemas a partir del momento en el que se cree la instancia
     * @param numBicicletas Número de bicicletas que participarán en la carrera
     */
    public Carrera(int numBicicletas) {
        bicicletas          = new ArrayList<>(numBicicletas);
        bicicletasRetiradas = 0;
    }

    /**
     * Añade la bicicleta pasada al array de bicicletas de la carrera
     * @param bicicleta Bicicleta a añadir a la carrera
     */
    public void aniadirBicicleta(Bicicleta bicicleta) {
        bicicletas.add(bicicleta);
    }

    /**
     * Retira una bicicleta escogida al azar de la carrera
     */
    public void retirarBicicletaAleatoria() {
        // Verificar si la lista no está vacía:
        if (!bicicletas.isEmpty()) {
            // Crear un objeto Random:
            Random rand = new Random();

            // Generar un índice aleatorio:
            int indiceAleatorio = rand.nextInt(bicicletas.size());
            int idBicicleta     = bicicletas.get(indiceAleatorio).obtenerId();

            // Eliminar el elemento en el índice aleatorio:
            bicicletas.remove(indiceAleatorio);

            // Informar de la retirada de la bicicleta en cuestión:
            System.out.println("Retirada bicicleta '" + idBicicleta + "'");
        } else {
            // En este punto, no hay bicicletas en la carrera:
            System.out.println("No hay bicicletas en la carrera");
        }
    }

    /**
     * Retira un número de bicicletas pasado de la carrera
     * @param numBicicletas Número de bicicletas a retirar de la carrera
     */
    private void retirarBicicletas(int numBicicletas) {
        for (int i = 0; i < numBicicletas; i++) {
            retirarBicicletaAleatoria();
        }
    }

    /**
     * Calcula y almacena el número de bicicletas que serán retiradas de la carrera antes de que esta finalice
     * @param porcentaje Porcentaje de bicicletas que se retirarán de la carrera
     */
    public void computarRetiradas(int porcentaje) {
        bicicletasRetiradas = (bicicletas.size() * porcentaje) / 100;
    }

    /**
     * Consultor del identificador de la bicicleta que ha ganado la carrera
     * @return Identificador de la bicicleta que ha ganado la carrera
     */
    public int obtenerIdGanador() {
        this.bicicletas.sort(Comparator.comparingInt(o -> o.distanciaTotal));

        return (this.bicicletas.getLast().obtenerId());
    }

    /**
     * Simula la carrera. Para ello, la inicia y hace que las bicicletas avancen mientras dura la carrera, haciendo que
     * se retiren algunas, finalizando la carrera al final
     */
    public void simular() {
        final long tiempoCarrera = 60000; // 60 segundos

        // Iniciar carrera:
        iniciarCarrera();
        long inicioTiempo = System.currentTimeMillis();

        // Mientras no se agote el tiempo de carrera estipulado, las bicicletas permanecerán avanzando:
        while (System.currentTimeMillis() - inicioTiempo < tiempoCarrera) {
            // Avanza cada bicicleta n metros aleatorios:
            for (Bicicleta bici : bicicletas) {
                bici.avanzar();
            }

            try {
                // Pausa la ejecución del hilo durante 1 segundo (esto facilita el seguimiento de la simulación):
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        // Retirar bicicletas aleatorias antes de finalizar la carrera:
        retirarBicicletas(bicicletasRetiradas);

        // Finalizar carrera y retirada del resto de bicicletas:
        finalizarCarrera();
        retirarBicicletas(bicicletas.size());
    }


    // Métodos abstractos:

    /**
     * Inicia la carrera de bicicletas
     */
    public abstract void iniciarCarrera();

    /**
     * Finaliza la carrera de bicicletas
     */
    public abstract void finalizarCarrera();
}
