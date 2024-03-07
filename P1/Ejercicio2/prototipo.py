from abc import ABC, abstractmethod

class Prototipo(ABC):
    
    @abstractmethod
    def clone(self):
        """
        Realiza una copia profunda del objeto actual y la retorna.
        """
        pass