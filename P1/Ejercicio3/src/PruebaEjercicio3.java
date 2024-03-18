import bicicleta.Bicicleta;
import constructor.ConstructorBicicletaCarretera;
import constructor.ConstructorBicicletaDecorada;
import constructor.ConstructorBicicletaMontana;
import director.Director;

public class PruebaEjercicio3 {

    public static void main(String[] args) {
        // Crear el director para manejar las construcciones:
        Director director = new Director();

        // Construir una bicicleta de montaña decorada (con estampado y funda):
        // Primero, se crea el constructor de la bicicleta de montaña:
        ConstructorBicicletaMontana constructorBiciMontana = new ConstructorBicicletaMontana();
        // Segundo, se manda a construir la bicicleta de montaña:
        director.hacerBicicletaMontana(constructorBiciMontana);
        // Tercero, se crea el constructor para decorar la bicicleta de montaña que se ha construido:
        ConstructorBicicletaDecorada constructorBiciDecorada =
                new ConstructorBicicletaDecorada(constructorBiciMontana.obtenerResultado());
        // Cuarto, se manda a decorar la bicicleta de montaña:
        director.hacerBicicletaDecorada(constructorBiciDecorada);
        // Quinto, se obtiene la bicicleta de montaña con la decoración añadida:
        Bicicleta biciMontanaDecorada = constructorBiciDecorada.obtenerResultado();
        // Finalmente, se imprime la bicicleta:
        System.out.println(biciMontanaDecorada);



        // Para construir una bicicleta de carretera decorada (con estampado y funda), los pasos son los mismos:
        ConstructorBicicletaCarretera constructorBicicletaCarretera = new ConstructorBicicletaCarretera();
        director.hacerBicicletaCarretera(constructorBicicletaCarretera);
        ConstructorBicicletaDecorada constructorBiciDecorada2 =
                new ConstructorBicicletaDecorada(constructorBicicletaCarretera.obtenerResultado());
        director.hacerBicicletaDecorada(constructorBiciDecorada2);
        Bicicleta biciCarreteraDecorada = constructorBiciDecorada2.obtenerResultado();
        System.out.println(biciCarreteraDecorada);
    }

}
