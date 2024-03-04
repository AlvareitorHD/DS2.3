from objetivo import Objetivo
from cadena_filtros import CadenaFiltros
from filtros import Filtro
from estado_motor import EstadoMotor

class GestorFiltros:
    """
    Clase utilizada para gestionar la cadena de filtros por parte de los clientes
    
    Podremos agregar mas filtros, establecer la instancia objetivo y solicitar la ejecucion de la cadena
    """
    
    def __init__(self, objetivo: Objetivo = Objetivo()):
        """Constructor

        Args:
            objetivo (Objetivo, optional): Instancia objetivo del gestor. Si no se proporciona una, se
            construye por defecto
        """
        self.__cadena = CadenaFiltros(objetivo)
        
    def aniadir_filtro(self, filtro: Filtro) -> bool:
        """Agrega un filtro a la cadena de filtros del gestor

        Args:
            filtro (Filtro): Filtro a agregar

        Returns:
            bool: Si el filtro se ha agregado correctamente
        """
        return self.__cadena.aniadir_filtro(filtro)
    
    def solicitar(self, revoluciones: float, estado_motor: EstadoMotor, verbose: bool = False):
        """Solicita que se ejecute la cadena de filtros

        Args:
            revoluciones (float): RPM
            estado_motor (EstadoMotor): Estado del motor
            verbose (bool, optional): Muestra el proceso por consola. Por defecto es False.
        """
        self.__cadena.ejecutar(revoluciones, estado_motor, verbose)
       
    # Propiedad: objetivo (propiedad de CadenaFiltros)
    @property
    def objetivo(self):
        return self.__cadena.objetivo
    @objetivo.setter
    def objetivo(self, other: Objetivo):
        self.__cadena.objetivo = other