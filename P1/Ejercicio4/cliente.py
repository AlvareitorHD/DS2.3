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
        # Nodo padre de elementos
        root = tk.Tk()
        
        # Titulo de la ventana
        root.title("Simulador - Ejercicio 4 - DS (2.3)")
        
        # Frame que contendra la informacion del salpicadero
        # Propiedades del frame
        salpicadero_frame = tk.Frame(
            master=root,
            border='2px',
            relief='ridge'
        )
        # Propiedades dentro del layout
        # Pack sera el tipo de layout para los frames del salpicadero y los mandos
        salpicadero_frame.pack(
            expand=True,
            fill='both',
            side='top',
            anchor='n',
            padx=10,
            pady=10
        )
        
        # Etiqueta dentro del frame del salpicadero
        label_salpicadero_frame = tk.Label(
            master=salpicadero_frame,
            text='Salpicadero',
            font=('Roboto', 12),
            foreground='#553333',
            background='#aaffff'
        )
        # El frame tambien tiene su propio layout
        label_salpicadero_frame.pack(
            expand=True,
            fill='x',
            side='top',
            anchor='n',
            ipadx=5,
            ipady=5
        )
        
        # Repetimos lo mismo para los mandos
        mandos_frame = tk.Frame(
            master=root,
            border='2px',
            relief='ridge'
        )
        mandos_frame.pack(
            expand=True,
            fill='both',
            side='top',
            padx=10,
            pady=10
        )
        label_mandos_frame = tk.Label(
            master=mandos_frame,
            text='Mandos',
            font=('Roboto', 12),
            foreground='#553333',
            background='#aaffff'
        )
        label_mandos_frame.pack(
            expand=True,
            fill='x',
            side='top',
            anchor='n',
            ipadx=5,
            ipady=5
        )
        
        # Abrimos la ventana
        root.mainloop()