from abc import ABC, abstractmethod
from estado_motor import EstadoMotor
from math import pi

class ContextoFiltro:
    """
    Clase utilizada para almacenar la informacion que necesitan los filtros para su ejecucion
    
    Podemos considerarla como una clase que almacena los parametros necesarios para las funciones de
    ejecucion de los filtros, cadena de filtros y el gestor
    """
    def __init__(self, revoluciones: float = None, estado_motor: EstadoMotor = None):
        self.revoluciones = 0 if revoluciones is None else revoluciones
        self.estado_motor = EstadoMotor.APAGADO if estado_motor is None else estado_motor

# DECLARACION DE LA INTERFAZ
class Filtro(ABC):
    """
    Interfaz Filtro
    
    Todos los filtros tendran que realizar una tarea (ejecutar)
    """
    @abstractmethod
    def ejecutar(self, ctx: ContextoFiltro, verbose: bool = False) -> float:
        """Funcion encargada de ejecutar la tarea del filtro

        Parametros:
            ctx: (ContextoFiltro): Contexto sobre el que tendra su ejecucion
            verbose (bool, optional): _description_. Mostrar el proceso por consola. Por defecto es False.

        Devuelve:
            float: Resultado de la tarea realizada por el filtro
        """
        pass

# IMPLEMENTACION DE LOS FILTROS EXISTENTES
class CalcularVelocidad(Filtro):
    """
    Filtro que transforma la velocidad de RPM a KM/H
    """
    
    def __init__(self, radio_eje: float = 0.15, paso_velocidad: float = 100.0, revoluciones_minimas: float = 0.0, revoluciones_maximas: float = 5000.0) -> None:
        self.radio_eje: float = radio_eje
        self.paso_velocidad: float = paso_velocidad
        self.revoluciones_minimas: float = revoluciones_minimas
        self.revoluciones_maximas : float = revoluciones_maximas
    
    def ejecutar(self, ctx: ContextoFiltro, verbose: bool = False) -> float:
        # Alteramos la velocidad del vehiculo segun el estado del motor
        match ctx.estado_motor:
            case EstadoMotor.ACELERANDO:
                ctx.revoluciones += self.paso_velocidad if ctx.revoluciones < self.revoluciones_maximas else 0
            case EstadoMotor.FRENANDO:
                ctx.revoluciones -= self.paso_velocidad if ctx.revoluciones > self.revoluciones_minimas else 0
        # Convertimos la velocidad de RPM a KM/H
        convertir = lambda rpm: 2 * pi * self.radio_eje * rpm * (60/1000) # Formula de la conversion
        resultado = convertir(ctx.revoluciones)
        if verbose: print(f"{__class__.__name__}: {ctx.revoluciones} -> {resultado}")
        return resultado
    
class RepercutirRozamiento(Filtro):
    """
    Filtro que simula el rozamiento de las ruedas, es decir, disminuye ligeramente la velocidad
    """
    
    def __init__(self, indice_rozamiento: float = 1.0) -> None:
        self.indice_rozamiento = indice_rozamiento
        
    def ejecutar(self, ctx: ContextoFiltro, verbose: bool = False) -> float:
        resultado = ctx.revoluciones
        if ctx.estado_motor in (EstadoMotor.ACELERANDO, EstadoMotor.FRENANDO):
            resultado -= self.indice_rozamiento
            if resultado < 0: resultado = 0
        if verbose: print(f"{__class__.__name__}: {ctx.revoluciones} -> {resultado}")
        return resultado