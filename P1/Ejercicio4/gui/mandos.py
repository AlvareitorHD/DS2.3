import gui.frames_genericos
from gui.estado_label import EstadoLabel
from gui.botones_mandos_frame import BotonesMandosFrame

class Mandos(gui.frames_genericos.FramePrimario):
    def __init__(self, master, ventana):
        super().__init__(master, name='Mandos')
        self.pack(
            expand=False, 
            fill='both', 
            side='top', 
            anchor='n',
            padx=10,
            pady=10
        )
        self.estado = EstadoLabel(master=self)
        self.botones = BotonesMandosFrame(master=self, ventana=ventana)