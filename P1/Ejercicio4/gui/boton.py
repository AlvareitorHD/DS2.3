import ttkbootstrap as ttkbs
from estado_motor import EstadoMotor
from filtros import Contexto

class BotonEncendido(ttkbs.Button):
    def __init__(self, master, ventana):
        
        def button_func():
            obj = self.ventana.cliente.gestor.objetivo
            estado = EstadoMotor.APAGADO if obj.estado_motor != EstadoMotor.APAGADO else EstadoMotor.ENCENDIDO
            ctx = Contexto(obj.velocidad_angular, estado)
            self.ventana.cliente.solicitar(ctx)
            
        def cambiar_color(event):
            estado = self.ventana.cliente.gestor.objetivo.estado_motor
            if estado is EstadoMotor.ENCENDIDO:
                self['style'] = 'danger'
        
        super().__init__(
            master=master,
            text='Encender',
            command=button_func
        )
        self.pack(
            expand=True,
            side='left',
            fill='both',
            padx=10,
            pady=10
        )
        
        self.ventana = ventana
        
        self.bind('<Button-1>', cambiar_color)
        
class BotonAcelerar(ttkbs.Button):
    def __init__(self, master, ventana):
        
        def button_func():
            obj = self.ventana.cliente.gestor.objetivo
            if obj.estado_motor != EstadoMotor.APAGADO:
                ctx = Contexto(obj.velocidad_angular, EstadoMotor.ACELERANDO)
                self.ventana.cliente.solicitar(ctx)
        
        super().__init__(
            master=master,
            text='Acelerar',
            command=button_func
        )
        self.pack(
            expand=True,
            side='left',
            fill='both',
            padx=10,
            pady=10
        )
        
        self.ventana = ventana
        
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
        
        self.ventana = ventana