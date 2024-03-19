import gui.frames_genericos
import gui.boton

class BotonesMandosFrame(gui.frames_genericos.FrameSecundario):
    def __init__(self, master, ventana):
        super().__init__(master=master, name=None)
        self.pack(
            expand=False,
            fill='x',
            side='bottom',
            anchor='s',
            padx=10,
            pady=10,
            ipadx=10,
            ipady=10
        )
        self.boton_frenar = gui.boton.BotonFrenar(master=self, ventana=ventana)
        self.boton_acelerar = gui.boton.BotonAcelerar(master=self, ventana=ventana)
        self.boton_encendido = gui.boton.BotonEncendido(master=self, ventana=ventana)