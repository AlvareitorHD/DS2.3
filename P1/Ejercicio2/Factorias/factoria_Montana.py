from Carreras.carrera_Montana import CarreraMontana
from Bicicletas.bicicleta_Montana import BicicletaMontana
import random
from Factorias.factoriaCarreraYBicicleta import FactoriaCarreraYBicicleta

class FactoriaMontana(FactoriaCarreraYBicicleta):
    """
    Implementa la fábrica concreta para crear carreras y bicicletas de montaña.
    Similar a FactoriaCarretera, pero para objetos de montaña, siguiendo el patrón de fábrica abstracta, método abstracto y prototipo.
    
    Atributos:
        prototipo_bicicleta (BicicletaMontana): Un prototipo de bicicleta de montaña para clonar nuevas bicicletas.
        
    Métodos:
        crear_item: Se crean carreras de montaña y bicicletas de montaña, estas última por clonación.
    """
    
    def __init__(self):
        """
        Inicialización del prototipo de bicicleta para clonación.
        """
        super().__init__(BicicletaMontana(0, 0))   # Prototipo específico para FactoriaMontana
    
    def crear_item (self, item, id):
        """
        Se crean carreras de montaña y bicicletas de montaña, estas última por clonación y ajustando su id y puntuacion.
                
        Parametros:
            item: cadea de texto que describe el objeto a crear, una carrera o una bicicleta.
        """
        if item == 'carrera':
            return CarreraMontana()
        elif item == 'bicicleta':
            bicicleta_clonada = self._prototipo_bicicleta.clone()
            bicicleta_clonada._id = id  # Usa el nuevo id
            bicicleta_clonada._puntuacion = random.randint(1, 20)
            return bicicleta_clonada