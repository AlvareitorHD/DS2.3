from abc import ABC, abstractmethod
from secrets import choice
from typing import List
from bicicleta import *

class Carrera(ABC):
    
    def __init__(self) -> None:
        self._bicicletas : List[Bicicleta] = []
        
    def aniadir_bicicleta(self, bicicleta: Bicicleta) -> None:
        self._bicicletas.append(bicicleta)
        
    def retirar_bicicleta_aleatoria(self) -> None:
        # Verifica si la lista no esta vacia
        if len(self._bicicletas) > 0:
            # Escoge una bicicleta aleatoria y la elimina
            bicicleta : Bicicleta = choice(self._bicicletas)
            self._bicicletas.remove(bicicleta)
            print(f"Se ha retirado la bicicleta con identificador \'{bicicleta.id}\'")
        else:
            print("No hay bicicletas en la carretera")
    
    def consultar_id_bicicleta(self, indice: int) -> int | None:
        try:
            return self._bicicletas[indice].id
        except IndexError:
            print("ERROR: No hay una bicicleta con ese indice")
    
    @abstractmethod
    def iniciar_carrera(self) -> None: pass
    
    @abstractmethod
    def finalizar_carrera(self) -> None: pass

class CarreraCarretera(Carrera):
    ...
    
class CarreraCarretera(Carrera):
    ...