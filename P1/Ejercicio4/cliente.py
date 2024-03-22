from gestor_filtros import GestorFiltros
from filtros import Contexto

# Excepcion personalizada para cuando se ejecute la cadena de filtros sin una cadena de filtros
class GestorDesconocido(Exception): ...

class Cliente:
    """
    Cliente de la aplicacion
    
    Clase con la que interactuara el usuario a la hora de realizar las solicitudes
    
    Debe de tener un gestor establecido antes de poder realizar una solicitud
    """
    def __init__(self, gestor: GestorFiltros = None) -> None:
        self.gestor = gestor
        
    def solicitar(self, ctx: Contexto, verbose: bool = False) -> None:
        """
        Realiza una solicitud al gestor

        Args:
            ctx (Contexto): Contexto de la solicitud. Contiene los datos.
            verbose (bool, optional): Mostrar el proceso por consola. Por defecto es False.

        Raises:
            ValueError: Si el cliente no tiene un gestor establecido
        """
        if verbose: print('---------------------------------------------')
        if self.gestor is None:
            raise GestorDesconocido('El cliente necesita tener un gestor establecido')
        self.gestor.solicitar(ctx, verbose)