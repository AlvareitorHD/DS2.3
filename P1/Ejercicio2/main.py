from factoria import FactoriaCarretera, FactoriaMontana
from threading import Thread
import time
import random

def main(N):
    # Crear instancias de las factorías de bicicletas de carretera y montaña
    factoria_carretera = FactoriaCarretera()
    factoria_montana = FactoriaMontana()

    # Crear carreras para bicicletas de carretera y montaña
    carrera_carretera = factoria_carretera.crear_carrera()
    carrera_montana = factoria_montana.crear_carrera()

    # Inicializamos un identificador secuencial para las bicicletas
    id_secuencial = 1

    # Crear bicicletas y añadirlas a sus respectivas carreras
    for _ in range(N):
        # Crear bicicleta de carretera con ID único y velocidad aleatoria entre 1 y 20
        bicicleta_carretera = factoria_carretera.crear_bicicleta(id_secuencial, random.randint(1, 20))
        # Crear bicicleta de montaña con ID único y velocidad aleatoria entre 1 y 20
        bicicleta_montana = factoria_montana.crear_bicicleta(id_secuencial, random.randint(1, 20))
        # Añadir las bicicletas creadas a sus respectivas carreras
        carrera_carretera.aniadir_bicicleta(bicicleta_carretera)
        carrera_montana.aniadir_bicicleta(bicicleta_montana)
        id_secuencial += 1  # Incrementar el ID secuencial para la próxima bicicleta

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
    print(f"Bicicleta ganadora en montaña es {carrera_montana.ganador_carrera()}")
    print(f"Bicicleta ganadora en carretera es {carrera_carretera.ganador_carrera()}")

# Punto de entrada del script
if __name__ == '__main__':
    N = 10 # Número de bicicletas por carrera
    main(N) # Ejecutar la función principal
