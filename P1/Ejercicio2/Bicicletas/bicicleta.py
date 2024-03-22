from abc import ABC, abstractmethod   
from copy import deepcopy
from prototipo import Prototipo

class Bicicleta(Prototipo, ABC):
    """
    Clase abstracta Bicicleta que define la estructura básica de una bicicleta.
    Atributos:
        _id (int): Identificador único de la bicicleta.
        _puntuacion (int): Puntuación asignada a la bicicleta, indica distancia avanzada.
    """
    
    def __init__(self, id_bicicleta, puntuacion):
        """
        Constructor de la clase Bicicleta.
        
        Parámetros:
            id_bicicleta (int): Identificador único de la bicicleta.
            puntuacion (int): Puntuación inicial de la bicicleta.
        """
        self._id = id_bicicleta
        self._puntuacion = puntuacion
    
    def clone(self):
        """
        Realiza una copia profunda del Bicicleta actual y la retorna.
        """
        return deepcopy(self)
    
    @abstractmethod
    def avanzar(self, continuar) -> None: 
        """
        Método abstracto que debe ser implementado por clases derivadas.
        Define cómo avanza la bicicleta.
        """
        pass
    