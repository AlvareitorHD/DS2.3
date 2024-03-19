import ttkbootstrap as ttkbs
import gui.frames_genericos

class Visor(gui.frames_genericos.FrameTerciario):
    def __init__(self, master, name='Sensor', value=0.0):
        super().__init__(master, name)
        self.value = ttkbs.DoubleVar(master=self, value=value)
        self.value_label = ttkbs.Label(
            master=self,
            textvariable=self.value, 
            anchor='e',
            font=('Roboto', 24)
        )
        self.value_label.pack(
            side='top',
            expand=True,
            fill='both',
            anchor='n',
            padx=10,
            pady=10,
            ipadx=10,
            ipady=10
        )