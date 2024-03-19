import ttkbootstrap as ttkbs
from cliente import Cliente
from gui.salpicadero import Salpicadero
from gui.mandos import Mandos

class Ventana(ttkbs.Window):
    def __init__(self, cliente: Cliente):
        super().__init__(
            title="Simulador - P1 E4 - DS (2.3)",
            themename='superhero', # Para consultar los temas: https://ttkbootstrap.readthedocs.io/en/latest/themes/
            minsize=(600, 600)
        )
        self.cliente = cliente
        self.salpicadero = Salpicadero(master=self)
        self.mandos = Mandos(master=self, ventana=self)
        
    def actualizar(self) -> None:
        objetivo = self.cliente.gestor.objetivo
        self.mandos.estado.var.set(objetivo.estado_motor.name)
        self.salpicadero.velocimetro.rpm.value.set(round(objetivo.velocidad_angular))
        self.salpicadero.velocimetro.kmh.value.set(round(objetivo.velocidad_lineal, 2))
        self.salpicadero.cuentakilometros.total.value.set(round(objetivo.cuentakilometros_total, 2))
        self.salpicadero.cuentakilometros.reciente.value.set(round(objetivo.cuentakilometros_reciente, 2))
        self.after(5, self.actualizar)
    
    def abrir(self) -> None:
        self.actualizar()
        self.mainloop()