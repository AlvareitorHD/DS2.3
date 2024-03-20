from abc import ABC, abstractmethod
from estado_motor import EstadoMotor

class Contexto:
    """
    Clase utilizada para almacenar la informacion que necesitan los filtros para su ejecucion
    
    Podemos considerarla como una clase que almacena los parametros necesarios para las funciones de
    ejecucion de los filtros y la cadena de filtros y las funciones de solicitud del gestor y el cliente
    """
    def __init__(self, revoluciones: float = 0, estado_motor: EstadoMotor = EstadoMotor.APAGADO):
        self.revoluciones = revoluciones
        self.estado_motor = estado_motor

# DECLARACION DE LA INTERFAZ
class Filtro(ABC):
    """
    Interfaz Filtro
    
    Todos los filtros tendran que realizar una tarea (ejecutar)
    """
    @abstractmethod
    def ejecutar(self, ctx: Contexto, verbose: bool = False) -> float:
        """
        Funcion encargada de ejecutar la tarea del filtro

        Parametros:
            ctx: (Contexto): Contexto sobre el que tendra su ejecucion
            verbose (bool, optional): Mostrar el proceso por consola. Por defecto es False.

        Devuelve:
            float: Resultado de la tarea realizada por el filtro
        """
        pass

# IMPLEMENTACION DE LOS FILTROS EXISTENTES
class CalcularVelocidad(Filtro):
    """
    Filtro que altera la velocidad segun el estado del motor
    """
    def __init__(self, incremento_velocidad: float = 100.0, revoluciones_minimas: float = 0.0, revoluciones_maximas: float = 5000.0) -> None:
        self.incremento_velocidad : float = incremento_velocidad # Incremento/decremento de la velocidad cuando el vehiculo esta en movimiento
        self.revoluciones_minimas : float = revoluciones_minimas # Velocidad minima
        self.revoluciones_maximas : float = revoluciones_maximas # Velocidad maxima
    
    def ejecutar(self, ctx: Contexto, verbose: bool = False) -> float:
        resultado = ctx.revoluciones
        if ctx.estado_motor is EstadoMotor.ACELERANDO and ctx.revoluciones < self.revoluciones_maximas:
            resultado += self.incremento_velocidad
            if resultado > self.revoluciones_maximas:
                resultado = self.revoluciones_maximas
        elif ctx.estado_motor is EstadoMotor.FRENANDO and ctx.revoluciones > self.revoluciones_minimas:
            resultado -= self.incremento_velocidad
            if resultado < self.revoluciones_minimas:
                resultado = self.revoluciones_minimas
        if verbose: print(f"{__class__.__name__}: {ctx.revoluciones} -> {resultado}")
        ctx.revoluciones = resultado
        return ctx.revoluciones
    
class RepercutirRozamiento(Filtro):
    """
    Filtro que simula el rozamiento de las ruedas, es decir, disminuye ligeramente la velocidad
    """
    def __init__(self, indice_rozamiento: float = 1.0) -> None:
        self.indice_rozamiento = indice_rozamiento
        
    def ejecutar(self, ctx: Contexto, verbose: bool = False) -> float:
        resultado = ctx.revoluciones
        if ctx.revoluciones > 0:
            resultado -= self.indice_rozamiento
            if verbose: print(f"{__class__.__name__}: {ctx.revoluciones} -> {resultado}")
            ctx.revoluciones = resultado
        return ctx.revoluciones