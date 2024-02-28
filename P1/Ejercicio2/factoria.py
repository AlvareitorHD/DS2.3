from abc import ABC, abstractmethod
from carrera import Carrera, CarreraCarretera, CarreraMontana
from bicicleta import Bicicleta, BicicletaCarretera, BicicletaMontana
import copy

class FactoriaCarreraYBicicleta(ABC):
    """
    Clase abstracta que define la interfaz para las fábricas de carreras y bicicletas.
    Establece los métodos para crear carreras y bicicletas específicas según el tipo.
    """
    
    @abstractmethod
    def crear_carrera(self) -> Carrera: 
        """
        Método abstracto para crear una carrera específica.
        """
        pass
    
    @abstractmethod
    def crear_bicicleta(self, id, puntuacion) -> Bicicleta: 
        """
        Método abstracto para crear una bicicleta específica.
        
        Parámetros:
            id_bicicleta (int): Identificador único de la bicicleta.
            puntuacion (int): Distancia recorrida inicial de la bicicleta.
        """
        pass

class FactoriaCarretera(FactoriaCarreraYBicicleta):
    """
    Implementa la fábrica concreta para crear carreras y bicicletas de carretera.
    Utiliza el patrón de diseño de fábrica y prototipo para generar objetos de bicicleta de carretera clonados.
    
    Atributos:
        prototipo_bicicleta (BicicletaCarretera): Un prototipo de bicicleta de carretera para clonar nuevas bicicletas.
        
    Métodos:
        crear_carrera: Crea y retorna una nueva instancia de CarreraCarretera.
        crear_bicicleta(id_secuencial, puntuacion): Clona el prototipo de bicicleta de carretera y ajusta su id y distacion recorrida.
    """
    
    def __init__(self):
        """
        Inicialización del prototipo de bicicleta para clonación.
        """
        self.prototipo_bicicleta = BicicletaCarretera(0, 0)  # Prototipo específico para FactoriaCarretera

    def crear_carrera(self):
        """
        Crea y retorna una nueva instancia de CarreraCarretera.
        """
        return CarreraCarretera()

    def crear_bicicleta(self, id_secuencial, puntuacion):
        """
        Clona y personaliza una bicicleta de carretera.
        
        Parámetros:
            id_secuencial (int): Identificador único de la bicicleta de montaña.
            puntuacion (int): Distancia recorrida inicial de la bicicleta de montaña.
        """
        bicicleta_clonada = copy.deepcopy(self.prototipo_bicicleta)
        bicicleta_clonada.id = id_secuencial
        bicicleta_clonada.puntuacion = puntuacion
        return bicicleta_clonada

class FactoriaMontana(FactoriaCarreraYBicicleta):
    """
    Implementa la fábrica concreta para crear carreras y bicicletas de montaña.
    Similar a FactoriaCarretera, pero para objetos de montaña, siguiendo el patrón de fábrica y prototipo.
    
    Atributos:
        prototipo_bicicleta (BicicletaMontana): Un prototipo de bicicleta de montaña para clonar nuevas bicicletas.
        
    Métodos:
        crear_carrera: Crea y retorna una nueva instancia de CarreraMontana.
        crear_bicicleta(id_secuencial, puntuacion): Clona el prototipo de bicicleta de montaña y ajusta su id y puntuación.
    """
    
    def __init__(self):
        """
        Inicialización del prototipo de bicicleta para clonación.
        """
        self.prototipo_bicicleta = BicicletaMontana(0, 0)  # Prototipo específico para FactoriaMontana

    def crear_carrera(self):
        """
        Crea y retorna una nueva instancia de CarreraMontana.
        """
        return CarreraMontana()

    def crear_bicicleta(self, id_secuencial, puntuacion):
        """
        Clona y personaliza una bicicleta de montaña.
        
        Parámetros:
            id_secuencial (int): Identificador único de la bicicleta de montaña.
            puntuacion (int): Distancia recorrida inicial de la bicicleta de montaña.
        """
        bicicleta_clonada = copy.deepcopy(self.prototipo_bicicleta)
        bicicleta_clonada.id = id_secuencial
        bicicleta_clonada.puntuacion = puntuacion
        return bicicleta_clonada