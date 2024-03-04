package carrera;

import bicicleta.Bicicleta;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Random;

/**
 * Clase abstracta para representar la carrera de bicicletas
 */
public abstract class Carrera {
    /**
     * Contendrá todas las bicicletas que participarán en la carrera
     */
    protected ArrayList<Bicicleta> bicicletas;


    // Métodos NO abstractos:

    /**
     * Constructor sin parámetros que inicializa el array de las bicicletas para poder utilizarlo sin problemas a partir
     * del momento en el que se cree la instancia
     */
    public Carrera() {
        bicicletas = new ArrayList<>();
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
     * @param tipo Tipo de carrera
     */
    public void retirarBicicletaAleatoria(int tipo) {
        // Verificar si la lista no está vacía:
        if (!bicicletas.isEmpty()) {
            // Crear un objeto Random:
            Random rand = new Random();

            // Generar un índice aleatorio:
            int indiceAleatorio = rand.nextInt(bicicletas.size());
            int idBicicleta     = bicicletas.get(indiceAleatorio).obtenerId();

            // Eliminar el elemento en el índice aleatorio:
            bicicletas.remove(indiceAleatorio);

            System.out.println("Se ha retirado la bicicleta con identificador '" + idBicicleta +
                    "' de la carrera " + ((tipo%2==0) ? "Montaña" : "Carretera"));
        } else {
            // En este punto, no hay bicicletas en la carrera:
            System.out.println("No hay bicicletas en la carrera");
        }
    }

    /**
     * Consultor del identificador de la bicicleta que ocupa el lugar pasado por parámetro en el array
     * @param indice Índice de la bicicleta en el array de bicicletas
     * @return identificador interno de la bicicleta especificada
     */
    public int consultarIdBicicleta(int indice) {
        return (bicicletas.get(indice).obtenerId());
    }

    /**
     * Consultor del identificador de la bicicleta que ha ganado la carrera
     * @return Identificador de la bicicleta que ha ganado la carrera
     */
    public int obtenerIdGanador() {
        this.bicicletas.sort(new Comparator<Bicicleta>() {
            @Override
            public int compare(Bicicleta o1, Bicicleta o2) {
                return Integer.compare(o1.metros, o2.metros);
            }
        });

        return (this.bicicletas.getLast().obtenerId());
    }

    /**
     * Consultor del array de bicicletas de la carrera
     * @return Array con las bicicletas de la carrera
     */
    public ArrayList<Bicicleta> obtenerBicicletas(){
        return (bicicletas);
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
