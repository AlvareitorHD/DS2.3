package director;

import bicicleta.Bicicleta;
import builder.Builder;

public class Director {
    private Builder _builder;
    public Director(Builder builder){
        this._builder = builder;
    }
    public Bicicleta buildBicicleta(){
        this._builder.construirManillar();
        this._builder.construirCuadro("");
        this._builder.construirRuedas(2);
        this._builder.construirSillin("");
        this._builder.construirCadena(2);
        return this._builder.build();
    }
}
