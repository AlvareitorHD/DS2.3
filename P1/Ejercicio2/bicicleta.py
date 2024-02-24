from abc import ABC, abstractmethod
from random import randint

class Bicicleta(ABC):
    
    def __init__(self) -> None:
        """
        Constructor
        """
        self._id = randint(0,1000)
    
    @property
    def id(self) -> int:
        return self._id
    
    @abstractmethod
    def avanzar(self) -> None: pass

class BicicletaCarretera(Bicicleta):
    
    def avanzar(self) -> None:
        print(f"La bicicleta de carretera con identificador \'{self.id}\' está avanzando")

class BicicletaMontana(Bicicleta):
    
    def avanzar(self) -> None:
        print(f"La bicicleta de montaña con identificador \'{self.id}\' está avanzando")

    