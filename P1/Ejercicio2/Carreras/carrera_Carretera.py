from Carreras.carrera import Carrera
import threading

class CarreraCarretera(Carrera):
    """
    Representa una carrera de bicicletas de carretera, heredando de la clase Carrera.

    Atributos:
        _bicicletas (List[Bicicleta]): Lista de bicicletas participantes en la carrera.
        _hilos (List[Thread]): Lista de hilos para simular el avance de cada bicicleta.

    Métodos:
    - iniciar_carrera: Inicia la carrera iniciando todos los hilos de bicicletas participantes.
    - finalizar_carrera: Espera a que todos los hilos de las bicicletas finalicen, marcando el fin de la carrera.
    - ganador_carrera: Determina el ganador de la carrera basado en la distancia recorrida más alta.
    """
    
    def __init__(self) -> None:
        """
        Inicializa la carrera de carretera llamando al constructor de la clase base.
        """
        super().__init__()  # Llama al constructor de la clase base para inicializar la lista de bicicletas

    def iniciar_carrera(self) -> None:
        """
        Inicia la carrera de carretera.

        Intenta iniciar todos los hilos de las bicicletas participantes y captura excepciones si ocurren.
        """
        try:
          # Iniciar un temporizador para detener las bicicletas después de 60 segundos
          temporizador = threading.Timer(60.0, lambda : self.detener_bicicletas('carretera'))
          temporizador.start()
          print("La carrera  de carretera ha comenzado.")
          for hilo in self._hilos:
            hilo.start()
        except Exception as e:
          print(f"Excepción capturada en el hilo de iniciar carrera Carretera: {e}")
        
    def finalizar_carrera(self) -> None:
        """
        Finaliza la carrera de carretera.

        Espera a que todos los hilos de las bicicletas finalicen, indicando el fin de la carrera.
        """
        for hilo in self._hilos:
            hilo.join()  # Esperamos a que todos los hilos finalicen
        print("La carrera de carretera ha terminado.")
        
    def ganador_carrera(self) -> None:
        """
        Determina el ganador de la carrera de carretera.

        Retorna el ID de la bicicleta con la puntuación más alta.
        """
        bicicleta_max_puntuacion = max(self._bicicletas, key=lambda x: x._puntuacion)
        return bicicleta_max_puntuacion._id