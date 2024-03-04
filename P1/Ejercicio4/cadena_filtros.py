from filtros import Filtro
from objetivo import Objetivo
from estado_motor import EstadoMotor

class CadenaFiltros():
    """
    Cadena de filtros gestionada por el gestor de filtros
    
    Contiene una lista secuencial de filtros y la instancia objetivo
    
    Se podran agregar mas filtros a la lista y cambiar la instancia objetivo
    
    Al ejecutar la cadena, empezaran a trabajar los filtros, y al final, la instancia objetivo
    """
    
    def __init__(self, filtros: list[Filtro] = [], objetivo: Objetivo = Objetivo()):
        """Constructor

        Parametros:
            filtros (list[Filtro], optional): Lista de filtros. Por defecto esta vacia
            objetivo (Objetivo, optional): Instancia objetivo. Si no se le proporciona uno, se crea automaticamente
        """
        self.__filtros : list[Filtro] = filtros
        self.__objetivo : Objetivo = objetivo
        
    def ejecutar(self, revoluciones: float, estado_motor: EstadoMotor, verbose: bool = False):
        """Ejecuta la cadena de filtros
        
        Primero ejecuta la tarea de los filtros de la cadena de forma secuencial y finalmente la tarea del objetivo

        Argumentos:
            revoluciones (float): Velocidad angular
            estado_motor (EstadoMotor): Estado del motor
            verbose (bool, optional): Muestra el proceso por consola. Por defecto es False
        """
        for filtro in self.__filtros:
            filtro.ejecutar(revoluciones, estado_motor, verbose)
        self.__objetivo.ejecutar(revoluciones, estado_motor, verbose)
    
    def aniadir_filtro(self, filtro: Filtro) -> bool:
        """Agrega un filtro al final de la cadena

        Args:
            filtro (Filtro): Filtro a agregar

        Returns:
            bool: Si la cadena se ha agregado satisfactoriamente
        """
        puede_aniadirse: bool = isinstance(filtro, Filtro)
        if puede_aniadirse:
            self.__filtros.append(filtro)
        else:
            print('No se puede agregar el objeto proporcionado porque no es un filtro')
        return puede_aniadirse
    
    # Propiedad: objetivo 
    @property
    def objetivo(self):
        return self.__objetivo
    @objetivo.setter
    def objetivo(self, s: Objetivo):
        if isinstance(s, Objetivo):
            self.__objetivo = s