import gui.frames_genericos
from gui.visor import Visor

class Velocimetro(gui.frames_genericos.FrameSecundario):
    def __init__(self, master):
        super().__init__(master, name='Velocimetro')
        self.rpm = Visor(master=self, name='RPM')
        self.kmh = Visor(master=self, name='KM/H')