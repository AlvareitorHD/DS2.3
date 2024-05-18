# Backend de la aplicacion

## API RestFUL usando Ruby On Rails

### Modelo Bicicleta
```
rails generate model Bicicleta --force-plural tipo_manillar:string tipo_frenos:string num_frenos:integer tipo_transmision:string  tipo_cuadro:string tipo_sillin:string tipo_ruedas:string num_ruedas:integer imagen_representativa:string tipo_bicicleta:string tipo_suspension:string num_suspensiones:integer
```
### Modelo Decoracion
```
rails generate model Decoracion extra:string decora_a:references{polymorphic}
```

**IMPORTANTE:** Para generar comandos para crear los modelos podeis usar la siguiente pagina (https://rails-generate.com/)