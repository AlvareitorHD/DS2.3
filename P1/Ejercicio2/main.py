import time
from factoria import FactoriaCarretera, FactoriaMontana

def retirar_bicicletas(carrera, porcentaje, tipo_carrera):
    numero_a_retirar = int(len(carrera._bicicletas) * porcentaje)
    print(f"Bicicletas retiradas de la carrera de {tipo_carrera}:")
    for _ in range(numero_a_retirar):
        carrera.retirar_bicicleta_aleatoria()
        
def comentar_ganador(carrera, tipo_carrera):
    print(f"Bicicleta ganadora en {tipo_carrera} es {carrera.ganador_carrera()}")
    

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

    carrera_carretera.iniciar_carrera()
    carrera_montana.iniciar_carrera()
    
    time.sleep(10)  # Duración de la carrera
    
    for bicicleta in carrera_carretera._bicicletas:
      bicicleta.avanzar()
    
    for bicicleta in carrera_montana._bicicletas:
      bicicleta.avanzar()
    
    retirar_bicicletas(carrera_montana, 0.20, 'montaña')  # Retirar bicicletas
    retirar_bicicletas(carrera_carretera, 0.10, 'carretera')  # Retirar bicicletas
    
    carrera_montana.finalizar_carrera()
    carrera_carretera.finalizar_carrera()
    
    comentar_ganador(carrera_montana, 'montaña')
    comentar_ganador(carrera_carretera, 'carretera')

if __name__ == '__main__':
    N = 10
    main(N)
