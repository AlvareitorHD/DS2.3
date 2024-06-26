from estado_motor import EstadoMotor
from filtros import Contexto
from math import pi

class Objetivo():
    """
    Clase para el salpicadero
    (Objetivo == Salpicadero)
    
    Esta clase almacena las caracteristicas principales del vehiculo (en realidad solo 1, el radio de las ruedas)
    
    Tambien almacena el estado actual del vehiculo:
    - Estado del motor
    - Velocidad
        - Lineal
        - Angular
    - Kilometros recorridos
        - En total
        - Reciente (desde el ultimo inicio hasta que se apague)
    """
    def __init__(self):
        """
        Constructor
        """
        self.__radio_rueda: float = 0.15
        self.estado_motor: EstadoMotor = EstadoMotor.APAGADO
        self.velocidad_lineal: float = 0.0
        self.velocidad_angular: float = 0
        self.cuentakilometros_total: float = 0.0
        self.cuentakilometros_reciente: float = 0.0
        
    def ejecutar(self, ctx: Contexto, verbose: bool = False) -> None:
        """Ejecuta la tarea del objetivo
        
        Consistira en almacenar los resultados proporcionados por los filtros
        
        Tambien se encarga de convertir la velocidad angular (RPM) en velocidad lineal (KM/H)

        Parametros:
            ctx: (Contexto): Contexto sobre el que tendra su ejecucion
            verbose (bool): Muestra el proceso por consola. Por defecto es False
        """
        # Si se apaga el motor y el cuentakilometros reciente tiene un valor, se reestablece a cero
        if self.estado_motor is EstadoMotor.APAGADO and self.cuentakilometros_reciente > 0:
            if verbose: print("Cuentakilometros reciente reiniciado")
            self.cuentakilometros_reciente = 0
        
        # Actualizamos la velocidad angular
        if verbose: print(f"RPM: {self.velocidad_angular} -> {ctx.revoluciones}")
        self.velocidad_angular = ctx.revoluciones
        
        # Actualizamos el estado del motor
        if verbose: print(f"Estado: {self.estado_motor} -> {ctx.estado_motor}")
        self.estado_motor = ctx.estado_motor
        
        # Actualizamos la velocidad lineal
        nueva_velocidad_lineal = 2 * pi * self.__radio_rueda * ctx.revoluciones * (60/1000)
        if verbose: print(f"KM/H: {self.velocidad_lineal} -> {nueva_velocidad_lineal}")
        self.velocidad_lineal = nueva_velocidad_lineal
        
        # Milisegundos de retardo entre acciones constantes
        milisegundos = 100
        # Tiempo entre estados (en horas)
        tiempo = (1/3600) * (milisegundos/1000)
        # Actualizamos los cuentakilometros
        agregacion_cuentakilometros = self.velocidad_lineal * tiempo
        self.cuentakilometros_total += agregacion_cuentakilometros
        self.cuentakilometros_reciente += agregacion_cuentakilometros