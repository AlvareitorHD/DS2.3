from gestor_filtros import GestorFiltros
from filtros import Contexto
import tkinter as tk
from tkinter import ttk

class Cliente:
    
    def __init__(self, gestor: GestorFiltros = None) -> None:
        self.gestor = gestor
        
    def solicitar(self, ctx: Contexto, verbose: bool = False) -> None:
        if verbose: print('---------------------------------------------')
        if self.gestor is None:
            raise ValueError('El cliente necesita tener un gestor establecido')
        self.gestor.solicitar(ctx, verbose)
        
    def iniciar_iu(self):
        # Nodo padre de elementos
        root = tk.Tk()
        
        # Titulo de la ventana
        root.title("Simulador - P1 E4 - DS (2.3)")
        
        # Tamanio y posicion de la ventana
        screen_width, screen_height = root.winfo_screenwidth(), root.winfo_screenheight() # Resolucion de la pantalla
        window_width, window_height = 500, 700 # Tamanio de la ventana
        # La ventana estara centrada en la pantalla
        window_xpos = int(screen_width / 2 - window_width / 2)
        window_ypos = int(screen_height / 2 - window_height / 2)
        root.geometry(f"{window_width}x{window_height}+{window_xpos}+{window_ypos}")
        
        # Salpicadero
        salpicadero_frame = ttk.Frame(master=root, border='2px', relief='ridge')
        salpicadero_frame.pack(expand=True, fill='both', side='top', anchor='n', padx=10, pady=10)
        
        # Mandos
        mandos_frame = ttk.Frame(master=root, border='2px', relief='ridge')
        mandos_frame.pack(expand=True, fill='both', side='top', padx=10, pady=10)

        # Abrimos la ventana
        root.mainloop()