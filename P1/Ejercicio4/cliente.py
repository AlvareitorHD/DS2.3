from gestor_filtros import GestorFiltros
from filtros import Contexto

class Cliente:
    
    def __init__(self, gestor: GestorFiltros = None) -> None:
        self.gestor = gestor
        
    def solicitar(self, ctx: Contexto, verbose: bool = False) -> None:
        if verbose: print('---------------------------------------------')
        if self.gestor is None:
            raise ValueError('El cliente necesita tener un gestor establecido')
        self.gestor.solicitar(ctx, verbose)