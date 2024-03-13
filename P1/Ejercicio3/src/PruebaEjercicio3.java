import bicicleta.Bicicleta;
import constructor.ConstructorBicicletaMontana;
import decorador.DecoradorBicicletaConEstampado;
import decorador.DecoradorBicicletaConFunda;
import director.Director;

public class PruebaEjercicio3 {

    public static void main(String[] args) {
        // Parte Builder:
        Director director = new Director();
        ConstructorBicicletaMontana constructorBiciMontana = new ConstructorBicicletaMontana();
        director.hacerBicicletaMontana(constructorBiciMontana);
        Bicicleta biciMontana = constructorBiciMontana.obtenerResultado();

        // Parte Decorator:
        Bicicleta biciMontanaConEstampado = new DecoradorBicicletaConEstampado(biciMontana);
        Bicicleta biciMontanaConEstampadoYFunda = new DecoradorBicicletaConFunda(biciMontanaConEstampado);
        System.out.println(biciMontanaConEstampadoYFunda);
    }

}
