# Desarrollo de Software UGR

###Integrantes del grupo:
- Alvaro Ruiz Luzón
- Luis Miguel Guirado Bautista
- Miguel Bravo Campos
- Miguel  ́Angel Serrano Villena
- Ginés Torres Almagro

## Práctica 1: Uso de Patrones de Diseño Creacionales y Estructurales en OO

### 1. Patrón Factoría Abstracta en Java
Programa de dos carreras simultáneas de **60 segundos** con **N** bicicletas: una de **MONTAÑA**(se va el 20% antes de terminar) y otra de **CARRETERA**(se va el 10% antes de terminar).

### 2. Patrón Factoría Abstracta + Patrón Prototipo (Python ó Ruby)
Un programa con la misma funcionalidad que el ejercicio anterior, pero que aplique el patrón Prototipo junto con el patrón Factoría Abstracta.

### 3. Patrón libre (NO usado anteriormente) estudiado en teoría en Python/Java/Ruby (a elegir)
Hemos optado en crear un programa que combina el patrón Builder junto al patrón Decorador, donde reusamos la implementación de la clase Bicicleta de los ejercicios anteriores pero agregándoles atributos
y accesorios nuevos.

### 4. Patrón (estilo) arquitectónico filtros de intercepción en java. Simulación del movimiento de un vehículo con cambio automático
Programa que representa el salpicadero de un vehículo con parámetros del movimiento del mismo (velocidad lineal en km/h, distancia recorrida en km y velocidad angular -“revoluciones”- en RPM), calculados a partir de las revoluciones del motor. Queremos además que estas revoluciones sean primero modificadas (filtradas) mediante software independiente a nuestro sistema, capaz de calcular el cambio en las revoluciones como consecuencia (1) del
estado del motor (acelerando, frenando, apagando el motor . . .) y (2) del rozamiento. Usaremos para este ejercicio el patrón arquitectónico Filtros de Intercepción. No vamos a programar los servicios de filtrado como verdaderos
componentes independientes, sino como objetos de clases no emparentadas que correrán todos bajo una única aplicación java (proyecto en el IDE).
En nuestro ejercicio, se crearán dos filtros (clases CalcularVelocidad y RepercutirRozamiento, que implementan la interfaz Filtro) para calcular la velocidad angular (“revoluciones”) y modificar la misma en base al rozamiento.

### 5.Patrón Strategy para Scraping de datos en la Web (Python)
Aplicación de WebScraping en Python donde se utilice el Patrón Strategy para scrapear información en vivo de acciones en la página web [FInance de Yahoo](https://finance.yahoo.com/quote/), donde se puede añadir el sufijo de la acción para acceder a información en vivo de ésta. Ejemplo con [TESLA](https://finance.yahoo.com/quote/TSLA).
Para el Patrón Strategy se usarán 2 estrategias:

1. BeautifulSoup
2. Selenium

Se desea scrapear de la página anterior los siguientes elementos:
- Precio de cierre anterior, precio de apertura, volumen, capitalización de mercado.
- Toda esta información se guardará en un fichero .json, de forma que cada vez que se ejecute el código se borre el contenido anterior y se mostrará el nuevo.
