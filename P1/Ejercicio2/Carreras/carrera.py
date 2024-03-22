from abc import ABC, abstractmethod
from secrets import choice
from typing import List
from threading import *
from Bicicletas.bicicleta import *

class Carrera(ABC):
    """
    Clase abstracta Carrera que define la estructura básica de una carrera.
    Atributos:
        _bicicletas (List[Bicicleta]): Lista de bicicletas participantes en la carrera.
        _hilos (List[Thread]): Lista de hilos para simular el avance de cada bicicleta.
        _continuar (Event): Evento que permite a las bicicletas avanzar.
    """
    
    def __init__(self) -> None:
        """
        Constructor de la clase Carrera que inicializa las listas de bicicletas y hilos.
        """
        self._bicicletas : List[Bicicleta] = []
        self._hilos = []
        self._continuar = Event()
        self._continuar.set()  # Inicialmente permitimos que las bicicletas avancen
        
    def aniadir_bicicleta(self, bicicleta: Bicicleta) -> None:
        """
        Añade una bicicleta a la carrera y crea un hilo para su avance.
        
        Parámetros:
            bicicleta (Bicicleta): La bicicleta a añadir a la carrera.
        """
        self._bicicletas.append(bicicleta)
        hilo = Thread(target=bicicleta.avanzar, args=(self._continuar,))
        self._hilos.append(hilo)
        
    def detener_bicicletas(self, tipo) -> None:
        """
        Detiene las bicicletas.
        Retira las bicicletas.
        """
        self._continuar.clear()  # Indica a las bicicletas que deben detenerse
        if tipo == 'carretera':
            self.retirar_bicicletas(0.10, tipo) # Una vez detenidas, proceder a retirar bicicletas
        else:
            self.retirar_bicicletas(0.20, tipo)
    
    
    def retirar_bicicletas(self, porcentaje, tipo_carrera):
        """
        Retira un porcentaje de bicicletas de la carrera.
        
        Parámetros:
            porcentaje (float): Porcentaje de bicicletas a retirar.
            tipo_carrera (str): Tipo de carrera para mostrar en el mensaje.
        """
        numero_a_retirar = int(len(self._bicicletas) * porcentaje)
        print(f"Bicicletas retiradas de la carrera de {tipo_carrera}:\n")
        for _ in range(numero_a_retirar):
          self.retirar_bicicleta_aleatoria(tipo_carrera)
          
    def retirar_bicicleta_aleatoria(self, tipo_carrera) -> None:
        """
        Retira una bicicleta aleatoria de la carrera.
        """
        # Verifica si la lista no esta vacia
        if len(self._bicicletas) > 0:
            # Escoge una bicicleta aleatoria y la elimina
            bicicleta : Bicicleta = choice(self._bicicletas)
            self._bicicletas.remove(bicicleta)
            print(f"Se ha retirado la bicicleta con identificador \'{bicicleta._id}\' de la carrera de {tipo_carrera}")
        else:
            print("No hay bicicletas en la carretera")
    
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