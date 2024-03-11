from Factorias.factoria_Carretera import FactoriaCarretera
from Factorias.factoria_Montana import FactoriaMontana
from threading import Thread
import random

def main(min_N, max_N):
    
    # Inicializamos el número de bicicletas por carrera
    N = random.randint (min_N, max_N)
    
    # Crear instancias de las factorías de bicicletas de carretera y montaña
    factoria_carretera = FactoriaCarretera()
    factoria_montana = FactoriaMontana()

    # Crear carreras para bicicletas de carretera y montaña
    carrera_carretera = factoria_carretera.crear_item('carrera')
    carrera_montana = factoria_montana.crear_item('carrera')

    # Crear bicicletas y añadirlas a sus respectivas carreras
    for _ in range(N):
        # Crear bicicleta de carretera con ID único y velocidad aleatoria entre 1 y 20
        bicicleta_carretera = factoria_carretera.crear_item('bicicleta')
        # Crear bicicleta de montaña con ID único y velocidad aleatoria entre 1 y 20
        bicicleta_montana = factoria_montana.crear_item('bicicleta')
        # Añadir las bicicletas creadas a sus respectivas carreras
        carrera_carretera.aniadir_bicicleta(bicicleta_carretera)
        carrera_montana.aniadir_bicicleta(bicicleta_montana)

    # Crear hilos para iniciar las carreras en paralelo
    hilo_carretera = Thread(target=carrera_carretera.iniciar_carrera)
    hilo_montana = Thread(target=carrera_montana.iniciar_carrera)
    
    # Iniciar los hilos y por lo tanto, las carreras
    hilo_carretera.start()
    hilo_montana.start()
    
    # Esperar a que ambos hilos terminen
    hilo_carretera.join()
    hilo_montana.join()
    
    # Finalizar las carreras
    carrera_montana.finalizar_carrera()
    carrera_carretera.finalizar_carrera()
    
    # Imprimir los ganadores de cada carrera
    print(f"Bicicleta ganadora en montana es {carrera_montana.ganador_carrera()}")
    print(f"Bicicleta ganadora en carretera es {carrera_carretera.ganador_carrera()}")

# Punto de entrada del script
if __name__ == '__main__':
    min_N = 5 # Número minimo de bicicletas por carrera
    max_N = 20 # Número máximo de bicicletas por carrera
    main(min_N, max_N) # Ejecutar la función principal
