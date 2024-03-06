from abc import ABC, abstractmethod
from carrera import CarreraCarretera, CarreraMontana
from bicicleta import Bicicleta, BicicletaCarretera, BicicletaMontana
import random

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

class FactoriaCarretera(FactoriaCarreraYBicicleta):
    """
    Implementa la fábrica concreta para crear carreras y bicicletas de carretera.
    Sigue el patrón de fábrica abstracta, método abstracto y prototipo.
    
    Atributos:
        id: el identificador de las bicicletas de la carrera.
        prototipo_bicicleta (BicicletaCarretera): Un prototipo de bicicleta de carretera para clonar nuevas bicicletas.
        
    Métodos:
        crear_item: Se crean carreras de carretera y bicicletas de carretera, estas última por clonación.
    """
    
    def __init__(self):
        """
        Inicialización del prototipo de bicicleta para clonación.
        """
        super().__init__(BicicletaCarretera(0, 0))   # Prototipo específico para FactoriaCarretera  

    def crear_item (self, item):
        """
        Se crean carreras de carretera y bicicletas de carretera, estas última por clonación y ajustando su id y puntuacion.
                
        Parametros:
            item: cadea de texto que describe el objeto a crear, una carrera o una bicicleta.
        """
        if item == 'carrera':
            return CarreraCarretera()
        elif item == 'bicicleta':
            bicicleta_clonada = self._prototipo_bicicleta.clone()
            bicicleta_clonada._id = self.obtener_nuevo_id()  # Usa el nuevo id
            bicicleta_clonada._puntuacion = random.randint(1, 20)
            return bicicleta_clonada

class FactoriaMontana(FactoriaCarreraYBicicleta):
    """
    Implementa la fábrica concreta para crear carreras y bicicletas de montaña.
    Similar a FactoriaCarretera, pero para objetos de montaña, siguiendo el patrón de fábrica abstracta, método abstracto y prototipo.
    
    Atributos:
        id: el identificador de las bicicletas de la carrera.
        prototipo_bicicleta (BicicletaMontana): Un prototipo de bicicleta de montaña para clonar nuevas bicicletas.
        
    Métodos:
        crear_item: Se crean carreras de montaña y bicicletas de montaña, estas última por clonación.
    """
    
    def __init__(self):
        """
        Inicialización del prototipo de bicicleta para clonación.
        """
        super().__init__(BicicletaMontana(0, 0))   # Prototipo específico para FactoriaMontana

    def crear_item (self, item):
        """
        Se crean carreras de montaña y bicicletas de montaña, estas última por clonación y ajustando su id y puntuacion.
                
        Parametros:
            item: cadea de texto que describe el objeto a crear, una carrera o una bicicleta.
        """
        if item == 'carrera':
            return CarreraMontana()
        elif item == 'bicicleta':
            bicicleta_clonada = self._prototipo_bicicleta.clone()
            bicicleta_clonada._id = self.obtener_nuevo_id()  # Usa el nuevo id
            bicicleta_clonada._puntuacion = random.randint(1, 20)
            return bicicleta_clonada