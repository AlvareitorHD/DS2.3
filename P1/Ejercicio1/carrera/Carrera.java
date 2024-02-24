package carrera;

import bicicleta.Bicicleta;

import java.util.ArrayList;
import java.util.Random;

public abstract class Carrera {
    protected ArrayList<Bicicleta> bicicletas;

    public Carrera() {
        bicicletas = new ArrayList<>();
    }
    public void aniadirBicicleta(Bicicleta bicicleta) {
        bicicletas.add(bicicleta);
    }
    public void retirarBicicletaAleatoria(String tipo) {
        // Verificar si la lista no está vacía
        if (!bicicletas.isEmpty()) {
            // Crear un objeto Random:
            Random rand = new Random();

            // Generar un índice aleatorio:
            int indiceAleatorio = rand.nextInt(bicicletas.size());
            int idBicicleta     = bicicletas.get(indiceAleatorio).obtenerId();

            // Eliminar el elemento en el índice aleatorio:
            bicicletas.remove(indiceAleatorio);

            System.out.println("Se ha retirado la bicicleta con identificador '" + idBicicleta + "' de la carrera "+tipo);
        } else {
            System.out.println("No hay bicicletas en la carrera");
        }
    }
    public int consultarIdBicicleta(int indice) {
        return (bicicletas.get(indice).obtenerId());
    }
    public abstract void iniciarCarrera();
    public abstract void finalizarCarrera();
}
