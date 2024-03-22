from enum import Enum

class EstadoMotor(Enum):
    """
    Enumeracion utilizada para indicar el estado del motor del objetivo
    """
    APAGADO = 0
    ENCENDIDO = 1
    ACELERANDO = 2
    FRENANDO = 3