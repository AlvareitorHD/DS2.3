from abc import ABC, abstractmethod
    
class Bicicleta(ABC):
    """
    Clase abstracta Bicicleta que define la estructura básica de una bicicleta.
    Atributos:
        _id (int): Identificador único de la bicicleta.
        _puntuacion (int): Puntuación asignada a la bicicleta, indica distancia avanzada.
    """
    
    def __init__(self, id_bicicleta, puntuacion):
        """
        Constructor de la clase Bicicleta.
        
        Parámetros:
            id_bicicleta (int): Identificador único de la bicicleta.
            puntuacion (int): Puntuación inicial de la bicicleta.
        """
        self._id = id_bicicleta
        self._puntuacion = puntuacion

    @property
    def id(self):
        """
        Propiedad que devuelve el identificador único de la bicicleta.
        """
        return self._id

    @id.setter
    def id(self, value):
        """
        Setter para el identificador único de la bicicleta.
        """
        self._id = value

    @property
    def puntuacion(self):
        """
        Propiedad que devuelve la distancia recorrida de la bicicleta.
        """
        return self._puntuacion

    @puntuacion.setter
    def puntuacion(self, value):
        """
        Setter para la puntuación de la bicicleta.
        """
        self._puntuacion = value
    
    @abstractmethod
    def avanzar(self) -> None: 
        """
        Método abstracto que debe ser implementado por clases derivadas.
        Define cómo avanza la bicicleta.
        """
        pass

class BicicletaCarretera(Bicicleta):
    """
    Representa una bicicleta de carretera, heredando de la clase Bicicleta.
    
    Atributos:
        _id (int): Identificador único de la bicicleta.
        _puntuacion (int): Puntuación asignada a la bicicleta, indica distancia avanzada.
    
    Metodos:
    - avanzar: determina el avance de la bicicleta.
    """
    
    def __init__(self, id, puntuacion) -> None:
        """
        Constructor de la clase BicicletaCarretera.
        
        Parámetros:
            id (int): Identificador único de la bicicleta de carretera.
            puntuacion (int): Distancia recorrida inicial de la bicicleta de carretera.
        """
        super().__init__(id, puntuacion)
        
    def avanzar(self):
        """
        Implementación del método avanzar para la bicicleta de carretera.
        Intenta avanzar y captura cualquier excepción, mostrando un mensaje de error si ocurre.
        """
        try:
            print(f"Bicicleta de carretera {self.id} ha avanzado {self.puntuacion}.")
        except Exception as e:
          print(f"Excepción capturada en el hilo de bicicleta carretera {self._id}: {e}")
       

class BicicletaMontana(Bicicleta):
    """
    Representa una bicicleta de montaña, heredando de la clase Bicicleta.
    
    Atributos:
        _id (int): Identificador único de la bicicleta.
        _puntuacion (int): Puntuación asignada a la bicicleta, indica distancia avanzada.
    
    Metodos:
    - avanzar: determina el avance de la bicicleta.
    """
    
    def __init__(self, id, puntuacion) -> None:
        """
        Constructor de la clase BicicletaMontana.
        
        Parámetros:
            id (int): Identificador único de la bicicleta de montaña.
            puntuacion (int): Distancia recorrida inicial de la bicicleta de montaña.
        """
        super().__init__(id, puntuacion)  # Llama al constructor de la clase base para inicializar la lista de bicicletas
        
    def avanzar(self):
        """
        Implementación del método avanzar para la bicicleta de montaña.
        Intenta avanzar y captura cualquier excepción, mostrando un mensaje de error si ocurre.
        """
        try:
            print(f"Bicicleta de montaña {self.id} ha avanzado {self.puntuacion}.")
        except Exception as e:
          print(f"Excepción capturada en el hilo de bicicleta montaña {self._id}: {e}")
       
    