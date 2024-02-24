package bicicleta;

import java.util.Random;

public abstract class Bicicleta {

    protected int id;
    public Bicicleta(int id) {
        //Random random = new Random();
        //id = random.nextInt(1000);
        this.id = id;
    }
    public int obtenerId() {
        return (id);
    }
    public abstract void avanzar();
}
