import carrera.Carrera;
import factoria.FactoriaCarreraYBicicleta;
import factoria.FactoriaMontana;
import factoria.FactoriaCarretera;

public class Hebra extends Thread{
    public int num;
    private int id = 0;
    public Hebra(int num, int id){
        super();
        this.num = num;
        this.id = id;
    }
    @Override
    public void run(){
        if(id % 2 == 0){
            FactoriaCarreraYBicicleta factoriaMontana   = new FactoriaMontana();
            Carrera carreraMontana   = factoriaMontana.crearCarrera();

            for (int i = 0; i < num; i++)
            {
                carreraMontana.aniadirBicicleta(factoriaMontana.crearBicicleta());
            }
            carreraMontana.iniciarCarrera();

            for (int i = 0; i < num; i++)
                System.out.println("Carrera de montaña: "+ carreraMontana.consultarIdBicicleta(i));
            carreraMontana.finalizarCarrera();
        } else {
            FactoriaCarreraYBicicleta factoriaCarretera   = new FactoriaCarretera();
            Carrera carreraCarretera   = factoriaCarretera.crearCarrera();

            for (int i = 0; i < num; i++)
            {
                carreraCarretera.aniadirBicicleta(factoriaCarretera.crearBicicleta());
            }
            carreraCarretera.iniciarCarrera();

            for (int i = 0; i < num; i++)
                System.out.println("Carrera de carretera: "+ carreraCarretera.consultarIdBicicleta(i));
            carreraCarretera.finalizarCarrera();
        }

    }
}
