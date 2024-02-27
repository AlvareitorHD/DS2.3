from factoria import FactoriaCarretera, FactoriaMontana
from threading import Thread
import time

def main(N):
    factoria_carretera = FactoriaCarretera()
    factoria_montana = FactoriaMontana()

    carrera_carretera = factoria_carretera.crear_carrera()
    carrera_montana = factoria_montana.crear_carrera()

    id_secuencial = 1

    for _ in range(N):
        bicicleta_carretera = factoria_carretera.crear_bicicleta(id_secuencial, 0)
        bicicleta_montana = factoria_montana.crear_bicicleta(id_secuencial, 0)
        carrera_carretera.aniadir_bicicleta(bicicleta_carretera)
        carrera_montana.aniadir_bicicleta(bicicleta_montana)
        id_secuencial += 1

    hilo_carretera = Thread(target=carrera_carretera.iniciar_carrera)
    hilo_montana = Thread(target=carrera_montana.iniciar_carrera)
    
    hilo_carretera.start()
    hilo_montana.start()
    
    time.sleep(60)
    
    hilo_carretera.join()
    hilo_montana.join()
    
    carrera_montana.finalizar_carrera()
    carrera_carretera.finalizar_carrera()
    
    print(f"Bicicleta ganadora en montaña es {carrera_montana.ganador_carrera()}")
    print(f"Bicicleta ganadora en carretera es {carrera_carretera.ganador_carrera()}")

if __name__ == '__main__':
    N = 10
    main(N)
