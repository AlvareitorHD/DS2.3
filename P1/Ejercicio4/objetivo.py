from estado_motor import EstadoMotor
from filtros import ContextoFiltro

class Objetivo():
    """
    Clase para el salpicadero
    (Objetivo == Salpicadero)
    """
    def __init__(self):
        """
        Constructor
        """
        self.estado_motor: EstadoMotor = EstadoMotor.APAGADO
        self.velocidad_lineal: float = 0
        self.velocidad_angular: float = 0
        self.cuenta_kilometros_total: float = 0
        self.cuenta_kilometros_reciente: float = 0
        
    def ejecutar(self, ctx: ContextoFiltro, verbose: bool = False) -> float:
        """Ejecuta la tarea del objetivo
        
        Consistira en almacenar los resultados proporcionados por los filtros

        Args:
            ctx: (ContextoFiltro): Contexto sobre el que tendra su ejecucion
            verbose (bool): Muestra el proceso por consola. Por defecto es False
        """
        # Se actualizan los valores del objetivo
        if verbose: print(f"RPM: {self.velocidad_angular} -> {ctx.revoluciones}")
        self.velocidad_angular = ctx.revoluciones
        if verbose: print(f"Estado: {self.estado_motor} -> {ctx.estado_motor}")
        self.estado_motor = ctx.estado_motor
        
        # La velocidad lineal sera asignada despues de esta tarea (CadenaFiltros::ejecutar)
        # self.velocidad_lineal = result
        
        # Si se apaga el motor y el cuenta kilometros reciente tiene un valor, se reestablece a cero
        if self.estado_motor == EstadoMotor.APAGADO and self.cuenta_kilometros_reciente > 0:
            print("Cuentakilometros reciente reiniciado")
            self.cuenta_kilometros_reciente = 0
        
        # TODO: Cuenta kilometros
        # Que magnitud temporal hay que usar???
        self.cuenta_kilometros_total = 0
        self.cuenta_kilometros_reciente = 0
        
        return ctx.revoluciones