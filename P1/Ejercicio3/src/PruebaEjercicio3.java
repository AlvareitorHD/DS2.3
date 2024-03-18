import bicicleta.Bicicleta;
import constructor.ConstructorBicicletaCarretera;
import constructor.ConstructorBicicletaDecorada;
import constructor.ConstructorBicicletaMontana;
import director.Director;

public class PruebaEjercicio3 {

    public static void main(String[] args) {
        // Crear el director para manejar las construcciones:
        Director director = new Director();


        // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
        // ++ Construir una bicicleta de montaña sin más:                                                          ++ //
        // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //

        // Primero, se crea el constructor de la bicicleta de montaña:
        ConstructorBicicletaMontana constructorBiciMontana = new ConstructorBicicletaMontana();
        // Segundo, se manda a construir la bicicleta de montaña a través del director:
        director.hacerBicicletaMontana(constructorBiciMontana);
        // Tercero, se obtiene la bicicleta de montaña a través de su constructor:
        Bicicleta biciMontana = constructorBiciMontana.obtenerResultado();
        // Finalmente, se imprime la bicicleta:
        System.out.println("\nBicicleta de montaña normal:\n" + biciMontana);


        // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
        // ++ Decorar la bicicleta de montaña anterior (con estampado y funda):                                    ++ //
        // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //

        // Primero, se crea el constructor para decorar la bicicleta de montaña que se ha construido previamente:
        ConstructorBicicletaDecorada constructorBiciDecorada =
                new ConstructorBicicletaDecorada(biciMontana);
        // Segundo, se manda a decorar la bicicleta de montaña:
        director.hacerBicicletaDecorada(constructorBiciDecorada);
        // Tercero, se obtiene la bicicleta de montaña con la decoración añadida:
        Bicicleta biciMontanaDecorada = constructorBiciDecorada.obtenerResultado();
        // Finalmente, se imprime la bicicleta:
        System.out.println("\nBicicleta de montaña anterior decorada (con estampado y funda):\n" +
                biciMontanaDecorada);


        // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
        // ++ Para construir una bicicleta de carretera decorada (con estampado y funda):                          ++ //
        // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //

        // Primero, se crea el constructor de la bicicleta de carretera:
        ConstructorBicicletaCarretera constructorBicicletaCarretera = new ConstructorBicicletaCarretera();
        // Segundo, se manda a construir la bicicleta de carretera a través del director:
        director.hacerBicicletaCarretera(constructorBicicletaCarretera);
        // Tercero, se crea el constructor para decorar la bicicleta de carretera que se ha construido previamente:
        ConstructorBicicletaDecorada constructorBiciDecorada2 =
                new ConstructorBicicletaDecorada(constructorBicicletaCarretera.obtenerResultado());
        // Cuarto, se manda a decorar la bicicleta de carretera:
        director.hacerBicicletaDecorada(constructorBiciDecorada2);
        // Quinto, se obtiene la bicicleta de carretera con la decoración añadida:
        Bicicleta biciCarreteraDecorada = constructorBiciDecorada2.obtenerResultado();
        // Finalmente, se imprime la bicicleta:
        System.out.println("\nBicicleta de carretera decorada (con estampado y funda):\n" +
                biciCarreteraDecorada);
    }

}
