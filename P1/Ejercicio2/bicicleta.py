from abc import ABC, abstractmethod
import random

class Bicicleta(ABC):
    
    def __init__(self , id, puntuacion):
        """
        Constructor
        """
        self._id = id
        self._puntuacion = 0
    
class Bicicleta(ABC):
    def __init__(self, id_bicicleta, puntuacion):
        self._id = id_bicicleta
        self._puntuacion = puntuacion

    @property
    def id(self):
        return self._id

    @id.setter
    def id(self, value):
        self._id = value

    @property
    def puntuacion(self):
        return self._puntuacion

    @puntuacion.setter
    def puntuacion(self, value):
        self._puntuacion = value
    
    @abstractmethod
    def avanzar(self) -> None: pass

class BicicletaCarretera(Bicicleta):
    
    def __init__(self, id, puntuacion) -> None:
        super().__init__(id, puntuacion)  # Llama al constructor de la clase base para inicializar la lista de bicicletas
        
    def avanzar(self):
       self._puntuacion = random.randint(1, 10)
       print(f"Bicicleta de carretera {self.id} ha avanzado {self.puntuacion}.")

class BicicletaMontana(Bicicleta):
    
    def __init__(self, id, puntuacion) -> None:
        super().__init__(id, puntuacion)  # Llama al constructor de la clase base para inicializar la lista de bicicletas
        
    def avanzar(self):
       self._puntuacion = random.randint(1, 10)
       print(f"Bicicleta de montaña {self.id} ha avanzado {self.puntuacion}.")
    