package bicicleta;

public class BicicletaCarretera extends Bicicleta {

    /**
     * Constructor por parámetro, el cual se encarga de llamar al constructor de Bicicleta
     * @param id Identificar interno de la bicicleta
     */
    public BicicletaCarretera(int id) { super(id); }

    /**
     * Hace que la bicicleta de carretera avance a su modo
     */
    @Override
    public void avanzar() {
        System.out.println("La bicicleta de carretera con identificador '" + super.obtenerId() + "' está avanzando");
    }
}
