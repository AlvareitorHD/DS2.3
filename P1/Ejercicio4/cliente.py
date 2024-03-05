from gestor_filtros import GestorFiltros
from filtros import ContextoFiltro
import tkinter as tk

class Cliente:
    
    def __init__(self, gestor: GestorFiltros = None) -> None:
        self.gestor = gestor
        
    def solicitar(self, ctx: ContextoFiltro, verbose: bool = False):
        if self.gestor is None:
            raise ValueError('El cliente necesita tener un gestor establecido')
        return self.gestor.solicitar(ctx, verbose)
    
    def iniciar_iu(self):
        pass