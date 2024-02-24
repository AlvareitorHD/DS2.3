package carrera;

import bicicleta.Bicicleta;

import java.util.ArrayList;
import java.util.Comparator;

public class CarreraMontana extends Carrera {

    public CarreraMontana() { }

    @Override
    public void iniciarCarrera() {
        System.out.println("Se ha iniciado la carrera de montaña");
    }

    @Override
    public void finalizarCarrera() {
        this.bicicletas.sort(new Comparator<Bicicleta>() {
            @Override
            public int compare(Bicicleta o1, Bicicleta o2) {
                return Integer.compare(o1.metros, o2.metros);
            }
        });
        System.out.println("Se ha finalizado la carrera de montaña y el ganador es la bicicleta "+ this.bicicletas.getLast().obtenerId());
    }
}
