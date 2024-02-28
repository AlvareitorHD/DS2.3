from abc import ABC, abstractmethod
    
class Bicicleta(ABC):
    def __init__(self, id_bicicleta, puntuacion):
        self._id = id_bicicleta
        self._puntuacion = puntuacion

    @property
    def id(self):
        return self._id

    @id.setter
    def id(self, value):
        self._id = value

    @property
    def puntuacion(self):
        return self._puntuacion

    @puntuacion.setter
    def puntuacion(self, value):
        self._puntuacion = value
    
    @abstractmethod
    def avanzar(self) -> None: pass

class BicicletaCarretera(Bicicleta):
    
    def __init__(self, id, puntuacion) -> None:
        super().__init__(id, puntuacion)  # Llama al constructor de la clase base para inicializar la lista de bicicletas
        
    def avanzar(self):
        try:
            print(f"Bicicleta de carretera {self.id} ha avanzado {self.puntuacion}.")
        except Exception as e:
          print(f"Excepción capturada en el hilo de bicicleta carretera {self._id}: {e}")
       

class BicicletaMontana(Bicicleta):
    
    def __init__(self, id, puntuacion) -> None:
        super().__init__(id, puntuacion)  # Llama al constructor de la clase base para inicializar la lista de bicicletas
        
    def avanzar(self):
        try:
            print(f"Bicicleta de montaña {self.id} ha avanzado {self.puntuacion}.")
        except Exception as e:
          print(f"Excepción capturada en el hilo de bicicleta montaña {self._id}: {e}")
       
    