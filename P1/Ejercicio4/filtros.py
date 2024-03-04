from abc import ABC, abstractmethod
from estado_motor import EstadoMotor

# DECLARACION DE LA INTERFAZ
class Filtro(ABC):
    """
    Interfaz Filtro
    
    Todos los filtros tendran que realizar una tarea (ejecutar)
    """
    @abstractmethod
    def ejecutar(self, revoluciones: float, estado_motor: EstadoMotor, verbose: bool = False) -> float: pass

# IMPLEMENTACION DE LOS FILTROS EXISTENTES
class CalcularVelocidad(Filtro):
    """
    Filtro que transforma la velocidad de RPM a KM/H
    """
    
    def __init__(self) -> None:
        self.__radio_eje = 0.15
        self.__paso_velocidad = 100
        self.__revoluciones_minimas = 0
        self.__revoluciones_maximas = 5000
    
    def ejecutar(self, revoluciones: float, estado_motor: EstadoMotor, verbose: bool = False) -> float:
        # Alteramos la velocidad del vehiculo segun el estado del motor
        match estado_motor:
            case EstadoMotor.ACELERANDO:
                revoluciones += self.__paso_velocidad if revoluciones < self.__revoluciones_maximas else 0
            case EstadoMotor.FRENANDO:
                revoluciones -= self.__paso_velocidad if revoluciones > self.__revoluciones_minimas else 0
        # Convertimos la velocidad de RPM a KM/H
        from math import pi
        resultado = 2 * pi * self.__radio_eje * revoluciones * (60/1000)
        print(f"CalcularVelocidad: {revoluciones} -> {resultado}")
        revoluciones = resultado
        return resultado
    
class RepercutirRozamiento(Filtro):
    """
    Filtro que simula el rozamiento de las ruedas, es decir, disminuye ligeramente la velocidad
    """
    
    def __init__(self) -> None:
        self.__indice_rozamiento = 1
        
    def ejecutar(self, revoluciones: float, estado_motor: EstadoMotor, verbose: bool = False) -> float:
        resultado = revoluciones
        if estado_motor in (EstadoMotor.ACELERANDO, EstadoMotor.FRENANDO):
            resultado -= self.__indice_rozamiento
            if resultado < 0: resultado = 0
        print(f"RepercutirRozamiento: {revoluciones} -> {resultado}")
        revoluciones = resultado
        return resultado