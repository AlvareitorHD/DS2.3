import gui.frames_genericos
from gui.velocimetro import Velocimetro
from gui.cuentakilometros import Cuentakilometros

class Salpicadero(gui.frames_genericos.FramePrimario):
    def __init__(self, master):
        super().__init__(master, name='Salpicadero')
        self.pack(
            expand=True,
            fill='both', 
            side='top', 
            anchor='n',
            padx=10, 
            pady=10
        )
        self.velocimetro = Velocimetro(master=self)
        self.cuentakilometros = Cuentakilometros(master=self)