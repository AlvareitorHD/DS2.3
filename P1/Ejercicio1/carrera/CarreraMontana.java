package carrera;

import bicicleta.Bicicleta;

import java.util.ArrayList;

public class CarreraMontana extends Carrera {

    public CarreraMontana() { }

    @Override
    public void iniciarCarrera() {
        System.out.println("Se ha iniciado la carrera de montaña");
    }

    @Override
    public void finalizarCarrera() {
        System.out.println("Se ha finalizado la carrera de montaña");
    }
}
