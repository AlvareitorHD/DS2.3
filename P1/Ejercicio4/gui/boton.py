import ttkbootstrap as ttkbs
from estado_motor import EstadoMotor
from filtros import Contexto

class BotonEncendido(ttkbs.Button):
    def __init__(self, master, ventana):
        
        def button_func():
            obj = self.ventana.cliente.gestor.objetivo
            self.ventana.contexto.estado_motor = EstadoMotor.APAGADO if obj.estado_motor != EstadoMotor.APAGADO else EstadoMotor.ENCENDIDO
            self.cambiar_color()
        
        super().__init__(
            master=master,
            text='Encender',
            command=button_func,
            style='danger.TButton'
        )
        self.pack(
            expand=True,
            side='left',
            fill='both',
            padx=10,
            pady=10
        )
        
        self.ventana = ventana
        
    def cambiar_color(self):
        objetivo = self.ventana.cliente.gestor.objetivo
        
        estado_label = self.ventana.mandos.estado
        estado_label.var.set(objetivo.estado_motor.name)
        
        color_label = 'danger.TButton' if objetivo.estado_motor == EstadoMotor.APAGADO else 'success.TButton'
        self.configure(style=color_label)
        
        colores: ttkbs.Colors = self.ventana.style.colors
        color_estado = colores.danger if objetivo.estado_motor == EstadoMotor.APAGADO else colores.success
        self.ventana.mandos.estado.configure(foreground=color_estado)
        
class BotonAcelerar(ttkbs.Button):
    def __init__(self, master, ventana):
        
        def button_func():
            obj = self.ventana.cliente.gestor.objetivo
            if obj.estado_motor != EstadoMotor.APAGADO:
                ctx = Contexto(obj.velocidad_angular, EstadoMotor.ACELERANDO)
                self.ventana.cliente.solicitar(ctx)
        
        super().__init__(
            master=master,
            text='Acelerar'
        )
        self.pack(
            expand=True,
            side='left',
            fill='both',
            padx=10,
            pady=10
        )
        
        self.hold = False
        self.estado_previo = None
        self.ventana = ventana
        
        def hold_button_func(event=None):
            self.hold = True
            self.estado_previo = self.ventana.contexto.estado_motor
            make_request()
            
        def make_request():
            if self.hold:
                obj = self.ventana.cliente.gestor.objetivo
                if obj.estado_motor != EstadoMotor.APAGADO:
                    self.ventana.contexto.estado_motor = EstadoMotor.ACELERANDO
            self.after(100, make_request)

        def release_button_func(event=None):
            self.hold = False
            self.ventana.contexto.estado_motor = self.estado_previo
        
        self.bind('<Button-1>', hold_button_func)
        self.bind('<ButtonRelease-1>', release_button_func)
        
class BotonFrenar(ttkbs.Button):
    def __init__(self, master, ventana):
        
        def button_func():
            obj = self.ventana.cliente.gestor.objetivo
            if obj.estado_motor != EstadoMotor.APAGADO:
                ctx = Contexto(obj.velocidad_angular, EstadoMotor.FRENANDO)
                self.ventana.cliente.solicitar(ctx)
        
        super().__init__(
            master=master,
            text='Frenar',
            command=button_func
        )
        self.pack(
            expand=True,
            side='left',
            fill='both',
            padx=10,
            pady=10
        )
        
        self.hold = False
        self.estado_previo = None
        self.ventana = ventana
        
        def hold_button_func(event=None):
            self.hold = True
            self.estado_previo = self.ventana.contexto.estado_motor
            make_request()
            
        def make_request():
            if self.hold:
                obj = self.ventana.cliente.gestor.objetivo
                if obj.estado_motor != EstadoMotor.APAGADO:
                    self.ventana.contexto.estado_motor = EstadoMotor.FRENANDO
            self.after(100, make_request)

        def release_button_func(event=None):
            self.hold = False
            self.ventana.contexto.estado_motor = self.estado_previo
        
        self.bind('<Button-1>', hold_button_func)
        self.bind('<ButtonRelease-1>', release_button_func)