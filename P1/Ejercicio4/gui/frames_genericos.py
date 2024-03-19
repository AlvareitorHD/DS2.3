import ttkbootstrap as ttkbs

# Frame de Tier 1
# Usado para el salpicadero y los mandos del simulador
# Contenido por la propia ventana
class FramePrimario(ttkbs.Frame):
    def __init__(self, master, name : str = 'T1Frame'):
        super().__init__(
            master=master,
            border='2px',
            relief='ridge'
        )
        self.pack(
            expand=True, 
            fill='both', 
            side='top', 
            anchor='n',
            padx=10, 
            pady=10
        )
        self.label = None
        if name is not None:
            self.label = ttkbs.Label(
                master=self,
                text=name
            )
            self.label.pack(
                fill='x',
                side='top',
                anchor='n',
                padx=10,
                pady=5
            )

# Frame de Tier 2
# Contenidas por el frame salpicadero de Tier 1
# Usadas por los frames para el velocimetro y el cuentakilometros
class FrameSecundario(ttkbs.Frame):
    def __init__(self, master, name = 'T2frame'):
        super().__init__(
            master = master,
            border='1px',
            relief='solid'
        )
        self.pack(
            side='top',
            expand=False,
            fill='x',
            anchor='n',
            padx=10,
            pady=10,
            ipadx=10,
            ipady=10
        )
        self.label = None
        if name is not None:
            self.label = ttkbs.Label(
                master=self,
                text=name
            )
            self.label.pack(
                fill='x',
                side='top',
                anchor='n',
                padx=10,
                pady=5
            )

# Frame de Tier 3
# Contenidas por los frames de Tier 2
# Usadas por los distintos componentes de los frames de Tier 2
# Por ejemplo, las medidas en RPM y KM/H del velocimetro
class FrameTerciario(ttkbs.Frame):
    def __init__(self, master, name = 'T3Frame'):
        super().__init__(
            master=master,
            relief='sunken'
        )
        self.pack(
            expand=True,
            side='left',
            fill='x',
            padx=10,
            pady=10
        )
        self.label = None
        if name is not None:
            self.label = ttkbs.Label(
                master=self,
                text=name
            )
            self.label.pack(
                expand=True,
                fill='x',
                side='top',
                padx=10,
                pady=5
            )