from abc import ABC, abstractmethod
from Bicicletas.bicicleta import Bicicleta

class FactoriaCarreraYBicicleta(ABC):
    """
    Clase abstracta que define la interfaz para las fábricas de carreras y bicicletas.
    Establece los métodos para crear carreras y bicicletas específicas según el tipo.
    
    Atributos:
      prototipo_bicicleta: la bicicleta prototipo que se copiará y se crearán el resto de bicicletas.
    """
    
    def __init__(self, bicicleta: Bicicleta):
        """
        Inicialización del prototipo de bicicleta para clonación.
        """
        self._prototipo_bicicleta = bicicleta
        
    @abstractmethod
    def crear_item(self, item, id):
        """
        Método abstracto para crear un item específico, ya sea una carrera o una bicicleta de montaña o carretera.
        
        Parametros:
            item: cadena de texto que describe el objeto a crear ('carrera' o 'bicicleta').
            id: identificador númerico para cada bicicleta.
        """
        pass