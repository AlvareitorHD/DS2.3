from abc import ABC, abstractmethod
from secrets import choice
from typing import List
from threading import Thread
from bicicleta import *

class Carrera(ABC):
    """
    Clase abstracta Carrera que define la estructura básica de una carrera.
    Atributos:
        _bicicletas (List[Bicicleta]): Lista de bicicletas participantes en la carrera.
        _hilos (List[Thread]): Lista de hilos para simular el avance de cada bicicleta.
    """
    
    def __init__(self) -> None:
        """
        Constructor de la clase Carrera que inicializa las listas de bicicletas y hilos.
        """
        self._bicicletas : List[Bicicleta] = []
        self._hilos = []
        
    def aniadir_bicicleta(self, bicicleta: Bicicleta) -> None:
        """
        Añade una bicicleta a la carrera y crea un hilo para su avance.
        
        Parámetros:
            bicicleta (Bicicleta): La bicicleta a añadir a la carrera.
        """
        self._bicicletas.append(bicicleta)
        hilo = Thread(target=bicicleta.avanzar)
        self._hilos.append(hilo)
        
    def retirar_bicicleta_aleatoria(self) -> None:
        """
        Retira una bicicleta aleatoria de la carrera.
        """
        # Verifica si la lista no esta vacia
        if len(self._bicicletas) > 0:
            # Escoge una bicicleta aleatoria y la elimina
            bicicleta : Bicicleta = choice(self._bicicletas)
            self._bicicletas.remove(bicicleta)
            print(f"Se ha retirado la bicicleta con identificador \'{bicicleta.id}\'")
        else:
            print("No hay bicicletas en la carretera")
    
    def retirar_bicicletas(self, porcentaje, tipo_carrera):
        """
        Retira un porcentaje de bicicletas de la carrera.
        
        Parámetros:
            porcentaje (float): Porcentaje de bicicletas a retirar.
            tipo_carrera (str): Tipo de carrera para mostrar en el mensaje.
        """
        numero_a_retirar = int(len(self._bicicletas) * porcentaje)
        print(f"Bicicletas retiradas de la carrera de {tipo_carrera}:")
        for _ in range(numero_a_retirar):
          self.retirar_bicicleta_aleatoria()
    
    @abstractmethod
    def iniciar_carrera(self) -> None: 
        """Método abstracto para iniciar la carrera."""
        pass
    
    @abstractmethod
    def finalizar_carrera(self) -> None: 
        """Método abstracto para finalizar la carrera."""
        pass
    
    @abstractmethod
    def ganador_carrera(self) -> None: 
        """Método abstracto para determinar el ganador de la carrera."""
        pass

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
        bicicleta_max_puntuacion = max(self._bicicletas, key=lambda x: x.puntuacion)
        return bicicleta_max_puntuacion.id
        
    
class CarreraMontana(Carrera):
    """
    Representa una carrera de bicicletas de montaña, heredando de la clase Carrera.

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
        Inicializa la carrera de montaña llamando al constructor de la clase base.
        """
        super().__init__()  # Llama al constructor de la clase base para inicializar la lista de bicicletas

    def iniciar_carrera(self) -> None:
        """
        Inicia la carrera de montaña.

        Intenta iniciar todos los hilos de las bicicletas participantes y captura excepciones si ocurren.
        """
        try:
          print("La carrera de montaña ha comenzado.")
          for hilo in self._hilos:
            hilo.start()
        except Exception as e:
          print(f"Excepción capturada en el hilo de iniciar carrera montaña: {e}")
    
    def finalizar_carrera(self) -> None:
        """
        Finaliza la carrera de montaña.

        Espera a que todos los hilos de las bicicletas finalicen, indicando el fin de la carrera.
        """
        for hilo in self._hilos:
            hilo.join()  # Esperamos a que todos los hilos finalicen
        print("La carrera de montaña ha terminado.")
        
    def ganador_carrera(self) -> None:
        """
        Determina el ganador de la carrera de carretera.

        Retorna el ID de la bicicleta con la puntuación más alta.
        """
        bicicleta_max_puntuacion = max(self._bicicletas, key=lambda x: x.puntuacion)
        return bicicleta_max_puntuacion.id