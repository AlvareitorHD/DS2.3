import carrera.Carrera;
import factoria.FactoriaCarreraYBicicleta;
import factoria.FactoriaMontana;
import factoria.FactoriaCarretera;

public class Hebra extends Thread{
    public int num;
    public int porcentaje;
    private int id = 0;
    public Hebra(int num, int id){
        super();
        this.num = num;
        this.id = id;
        if(id % 2 == 0){
            porcentaje = (num * 20) / 100;
            System.out.println("Porcentaje Montaña: "+porcentaje+" (20%)");
        } else {
            porcentaje = (num * 10) / 100;
            System.out.println("Porcentaje Carretera: "+porcentaje+" (10%)");
        }

    }
    @Override
    public void run(){
        if(id % 2 == 0){
            FactoriaCarreraYBicicleta factoriaMontana   = new FactoriaMontana();
            Carrera carreraMontana   = factoriaMontana.crearCarrera();

            for (int i = 0; i < num; i++)
            {
                carreraMontana.aniadirBicicleta(factoriaMontana.crearBicicleta(i));
            }
            carreraMontana.iniciarCarrera();

            for(int i = 0; i < porcentaje; i++){
                carreraMontana.retirarBicicletaAleatoria("Montaña");
                num--;
            }

            for (int i = 0; i < num; i++)
                System.out.println("Carrera de montaña: "+ carreraMontana.consultarIdBicicleta(i));
            carreraMontana.finalizarCarrera();
        } else {
            FactoriaCarreraYBicicleta factoriaCarretera   = new FactoriaCarretera();
            Carrera carreraCarretera   = factoriaCarretera.crearCarrera();

            for (int i = 0; i < num; i++)
            {
                carreraCarretera.aniadirBicicleta(factoriaCarretera.crearBicicleta(i));
            }
            carreraCarretera.iniciarCarrera();

            for(int i = 0; i < porcentaje; i++){
                carreraCarretera.retirarBicicletaAleatoria("Carretera");
                num--;
            }

            for (int i = 0; i < num; i++)
                System.out.println("Carrera de carretera: "+ carreraCarretera.consultarIdBicicleta(i));

            carreraCarretera.finalizarCarrera();
        }

    }
}
