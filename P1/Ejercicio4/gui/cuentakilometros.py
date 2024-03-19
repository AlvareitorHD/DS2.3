import gui.frames_genericos
from gui.visor import Visor

class Cuentakilometros(gui.frames_genericos.FrameSecundario):
    def __init__(self, master):
        super().__init__(master, name='Cuentakilometros')
        self.total = Visor(master=self, name='Total')
        self.reciente = Visor(master=self, name='Reciente')