from Carreras.carrera_Carretera import CarreraCarretera
from Bicicletas.bicicleta_Carretera import BicicletaCarretera
import random
from Factorias.factoriaCarreraYBicicleta import FactoriaCarreraYBicicleta

class FactoriaCarretera(FactoriaCarreraYBicicleta):
    """
    Implementa la fábrica concreta para crear carreras y bicicletas de carretera.
    Sigue el patrón de fábrica abstracta, método abstracto y prototipo.
    
    Atributos:
        prototipo_bicicleta (BicicletaCarretera): Un prototipo de bicicleta de carretera para clonar nuevas bicicletas.
        
    Métodos:
        crear_item: Se crean carreras de carretera y bicicletas de carretera, estas última por clonación.
    """
    
    def __init__(self):
        """
        Inicialización del prototipo de bicicleta para clonación.
        """
        super().__init__(BicicletaCarretera(0, 0))   # Prototipo específico para FactoriaCarretera  

    def crear_item (self, item, id):
        """
        Se crean carreras de carretera y bicicletas de carretera, estas última por clonación y ajustando su id y puntuacion.
                
        Parametros:
            item: cadea de texto que describe el objeto a crear, una carrera o una bicicleta.
        """
        if item == 'carrera':
            return CarreraCarretera()
        elif item == 'bicicleta':
            bicicleta_clonada = self._prototipo_bicicleta.clone()
            bicicleta_clonada._id = id  # Usa el nuevo id
            bicicleta_clonada._puntuacion = random.randint(1, 20)
            return bicicleta_clonada