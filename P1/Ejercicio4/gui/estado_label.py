import ttkbootstrap as ttkbs

# Label especifica para mostrar el estado
class EstadoLabel(ttkbs.Label):
    def __init__(self, master):
        self.var = ttkbs.StringVar(master=master, value='-')
        super().__init__(
            master=master,
            textvariable=self.var,
            justify='center'
        )
        self.pack(
            side='top',
            anchor='n',
            padx=10,
            pady=10
        )