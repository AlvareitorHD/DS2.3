package carrera;

import bicicleta.Bicicleta;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Random;

public abstract class Carrera {
    protected ArrayList<Bicicleta> bicicletas;

    public Carrera() {
        bicicletas = new ArrayList<>();
    }
    public void aniadirBicicleta(Bicicleta bicicleta) {
        bicicletas.add(bicicleta);
    }
    public void retirarBicicletaAleatoria(int tipo) {
        // Verificar si la lista no está vacía
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
            System.out.println("No hay bicicletas en la carrera");
        }
    }
    public int consultarIdBicicleta(int indice) {
        return (bicicletas.get(indice).obtenerId());
    }
    public int obtenerIdGanador() {
        this.bicicletas.sort(new Comparator<Bicicleta>() {
            @Override
            public int compare(Bicicleta o1, Bicicleta o2) {
                return Integer.compare(o1.metros, o2.metros);
            }
        });

        return (this.bicicletas.getLast().obtenerId());
    }

    public abstract void iniciarCarrera();
    public abstract void finalizarCarrera();

    public ArrayList<Bicicleta> getBicicletas(){
        return bicicletas;
    }
}
