package bicicleta;

import java.util.Random;

public abstract class Bicicleta {

    protected int id;

    public Bicicleta() {
        Random random = new Random();
        id = random.nextInt(1000);
    }
    public int obtenerId() {
        return (id);
    }
    public abstract void avanzar();
}
