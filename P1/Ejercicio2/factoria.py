from abc import ABC, abstractmethod
from carrera import Carrera
from bicicleta import Bicicleta

class FactoriaCarreraYBicicleta(ABC):
    
    @abstractmethod
    def crear_carrera(self) -> Carrera: pass
    
    @abstractmethod
    def crear_bicicleta(self) -> Bicicleta: pass

class FactoriaCarretera(FactoriaCarreraYBicicleta):
    ...
    
class FactoriaMontana(FactoriaCarreraYBicicleta):
    ...