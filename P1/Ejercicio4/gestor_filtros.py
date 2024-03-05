from objetivo import Objetivo
from cadena_filtros import CadenaFiltros
from filtros import Filtro, ContextoFiltro

class GestorFiltros:
    """
    Clase utilizada para gestionar la cadena de filtros por parte de los clientes
    
    Podremos agregar mas filtros, establecer la instancia objetivo y solicitar la ejecucion de la cadena
    """
    
    def __init__(self, objetivo: Objetivo = None):
        """Constructor

        Args:
            objetivo (Objetivo, optional): Instancia objetivo del gestor. Si no se proporciona una, se
            construye por defecto
        """
        self.__cadena = CadenaFiltros(None, objetivo)
        
    def aniadir_filtro(self, filtro: Filtro) -> bool:
        """Agrega un filtro a la cadena de filtros del gestor

        Args:
            filtro (Filtro): Filtro a agregar

        Returns:
            bool: Si el filtro se ha agregado correctamente
        """
        return self.__cadena.aniadir_filtro(filtro)
    
    def solicitar(self, ctx: ContextoFiltro, verbose: bool = False):
        """Solicita que se ejecute la cadena de filtros

        Args:
            ctx: (ContextoFiltro): Contexto sobre el que tendra su ejecucion
            verbose (bool, optional): Muestra el proceso por consola. Por defecto es False.
        """
        self.__cadena.ejecutar(ctx, verbose)
       
    # Propiedad: objetivo (propiedad de CadenaFiltros)
    # Es decir, referencia al atributo 'objetivo' de CadenaFiltros
    @property
    def objetivo(self):
        return self.__cadena.objetivo
    @objetivo.setter
    def objetivo(self, other: Objetivo):
        if isinstance(other, Objetivo):
            self.__cadena.objetivo = other