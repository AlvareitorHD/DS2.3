package carrera;

import bicicleta.Bicicleta;

import java.util.ArrayList;

public class CarreraCarretera extends Carrera {
    public CarreraCarretera() { }

    @Override
    public void iniciarCarrera() {
        System.out.println("Se ha iniciado la carrera de carretera");
    }

    @Override
    public void finalizarCarrera() {
        System.out.println("Se ha finalizado la carrera de carretera y el ganador es la bicicleta " +
                obtenerIdGanador());
    }
}
