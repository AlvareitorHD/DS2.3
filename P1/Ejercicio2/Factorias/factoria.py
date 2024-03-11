from abc import ABC, abstractmethod
from Bicicletas.bicicleta import Bicicleta

class FactoriaCarreraYBicicleta(ABC):
    """
    Clase abstracta que define la interfaz para las fábricas de carreras y bicicletas.
    Establece los métodos para crear carreras y bicicletas específicas según el tipo.
    
    Atributos:
      id: el identificador de las bicicletas de la carrera.
      prototipo_bicicleta: la bicicleta prototipo que se copiará y se crearán el resto de bicicletas.
    """
    
    def __init__(self, bicicleta: Bicicleta):
        """
        Inicialización del id (identificador de cada bicicleta) y del prototipo de bicicleta para clonación.
        """
        self._id = 0 # Se toma la decisión que se empezará a identificar las bicicletas desde el 0.
        self._prototipo_bicicleta = bicicleta
    
    def obtener_nuevo_id(self):
        # Incrementa el id_actual y lo devuelve para asignarlo a una nueva bicicleta
        self._id += 1
        return self._id
        
    @abstractmethod
    def crear_item(self, item):
        """
        Método abstracto para crear un item específico, ya sea una carrera o una bicicleta de montaña o carretera.
        
        Parametros:
            item: cadena de texto que describe el objeto a crear ('carrera' o 'bicicleta').
        """
        pass