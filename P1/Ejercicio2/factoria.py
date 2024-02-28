from abc import ABC, abstractmethod
from carrera import Carrera, CarreraCarretera, CarreraMontana
from bicicleta import Bicicleta, BicicletaCarretera, BicicletaMontana
import copy

class FactoriaCarreraYBicicleta(ABC):
    
    @abstractmethod
    def crear_carrera(self) -> Carrera: pass
    
    @abstractmethod
    def crear_bicicleta(self, id) -> Bicicleta: pass

class FactoriaCarretera(FactoriaCarreraYBicicleta):
    def __init__(self):
        self.prototipo_bicicleta = BicicletaCarretera(0, 0)  # Prototipo específico para FactoriaCarretera

    def crear_carrera(self):
        return CarreraCarretera()

    def crear_bicicleta(self, id_secuencial, puntuacion):
        bicicleta_clonada = copy.deepcopy(self.prototipo_bicicleta)
        bicicleta_clonada.id = id_secuencial
        bicicleta_clonada.puntuacion = puntuacion
        return bicicleta_clonada

class FactoriaMontana(FactoriaCarreraYBicicleta):
    def __init__(self):
        self.prototipo_bicicleta = BicicletaMontana(0, 0)  # Prototipo específico para FactoriaMontana

    def crear_carrera(self):
        return CarreraMontana()

    def crear_bicicleta(self, id_secuencial, puntuacion):
        bicicleta_clonada = copy.deepcopy(self.prototipo_bicicleta)
        bicicleta_clonada.id = id_secuencial
        bicicleta_clonada.puntuacion = puntuacion
        return bicicleta_clonada