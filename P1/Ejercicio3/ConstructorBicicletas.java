import bicicleta.Bicicleta;
import builder.BuilderBicicletaCarretera;
import director.Director;

public class ConstructorBicicletas {
    public static void main(String[]args){
        BuilderBicicletaCarretera constructorCar = new BuilderBicicletaCarretera();
        Director director = new Director(constructorCar);
        Bicicleta bici = director.buildBicicleta();
        System.out.println(bici);
    }
}
