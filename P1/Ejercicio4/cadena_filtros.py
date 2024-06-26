from filtros import Filtro, Contexto
from objetivo import Objetivo
from copy import copy

# Excepcion personalizada para cuando se ejecute la cadena de filtros sin un objetivo
class ObjetivoDesconocido(Exception): ...

class CadenaFiltros():
    """
    Cadena de filtros gestionada por el gestor de filtros
    
    Contiene una lista secuencial de filtros y la instancia objetivo
    
    Se podran agregar mas filtros a la lista y cambiar la instancia objetivo
    
    Al ejecutar la cadena, empezaran a trabajar los filtros, y al final, la instancia objetivo
    """
    def __init__(self, filtros: list[Filtro] = [], objetivo: Objetivo = None):
        """Constructor

        Parametros:
            filtros (list[Filtro], optional): Lista de filtros. Por defecto esta vacia
            objetivo (Objetivo, optional): Instancia objetivo. Si no se le proporciona uno, se crea automaticamente
        """
        self.__filtros : list[Filtro] = filtros
        self.objetivo : Objetivo = objetivo
        
    def ejecutar(self, ctx: Contexto, verbose: bool = False) -> None:
        """Ejecuta la cadena de filtros
        
        Primero ejecuta la tarea de los filtros de la cadena de forma secuencial y finalmente la tarea del objetivo
        
        Para ejecutarse correctamente, la cadena debe de tener un objetivo establecido

        Argumentos:
            ctx: (Contexto): Contexto sobre el que tendra su ejecucion
            verbose (bool, optional): Muestra el proceso por consola. Por defecto es False
        """
        if self.objetivo is None:
            raise ObjetivoDesconocido("La cadena de filtros no tiene un objetivo establecido")
        
        # Ejecutamos los filtros
        if verbose: print('--- Ejecutando filtros ---')
        for filtro in self.__filtros:
            filtro.ejecutar(ctx, verbose)

        # Ejecutamos el objetivo
        if verbose: print('--- Ejecutando objetivo ---')
        self.objetivo.ejecutar(ctx, verbose)
    
    def aniadir_filtro(self, filtro: Filtro) -> None:
        """Agrega un filtro al final de la cadena

        Parametros:
            filtro (Filtro): Filtro a agregar

        Devuelve:
            bool: Si la cadena se ha agregado satisfactoriamente
        """
        puede_aniadirse: bool = isinstance(filtro, Filtro)
        if puede_aniadirse:
            self.__filtros.append(filtro)
        else:
            raise TypeError('El objeto proporcionado no es un filtro')