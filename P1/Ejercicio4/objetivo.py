from estado_motor import EstadoMotor

class Objetivo:
    """
    Clase para el salpicadero
    (Objetivo == Salpicadero)
    """
    
    def __init__(self):
        """
        Constructor
        """
        self.__estado_motor: EstadoMotor = EstadoMotor.APAGADO
        self.__velocidad_lineal: float = 0
        self.__velocidad_angular: float = 0
        self.__cuenta_kilometros_total: float = 0
        self.__cuenta_kilometros_reciente: float = 0
        
    def ejecutar(self, revoluciones: float, estado_motor: EstadoMotor, verbose: bool = False):
        """Ejecuta la tarea del objetivo

        Args:
            revoluciones (float): RPM
            estado_motor (EstadoMotor): Estado del motor
            verbose (bool): Muestra el proceso por consola. Por defecto es False
        """
        if verbose: print(f"RPM: {self.__velocidad_angular} -> {revoluciones}")
        self.__velocidad_angular = revoluciones
        
        if verbose: print(f"Estado: {self.__estado_motor} -> {estado_motor}")
        self.__estado_motor = estado_motor
        
        # Si se apaga el motor y el cuenta kilometros reciente tiene un valor, se reestablece a cero
        if self.__estado_motor == EstadoMotor.APAGADO and self.__cuenta_kilometros_reciente > 0:
            print("Cuentakilometros reciente reiniciado")
            self.__cuenta_kilometros_reciente = 0
        
        # TODO: Cuenta kilometros
        self.__cuenta_kilometros_total = 0
        self.__cuenta_kilometros_reciente = 0
        
    # Propiedad: velocidad_angular
    @property
    def velocidad_angular(self):
        return self.__velocidad_angular
    @velocidad_angular.setter
    def velocidad_angular(self, value: float):
        self.__velocidad_angular = value
        
    # Propiedad: velocidad_lineal
    @property
    def velocidad_lineal(self):
        return self.__velocidad_lineal
    @velocidad_lineal.setter
    def velocidad_lineal(self, value: float):
        self.__velocidad_lineal = value
        
    # Propiedad: estado_motor
    @property
    def estado_motor(self):
        return self.__estado_motor
    @estado_motor.setter
    def estado_motor(self, estado: EstadoMotor):
        if isinstance(estado, EstadoMotor):
            self.__estado_motor = estado