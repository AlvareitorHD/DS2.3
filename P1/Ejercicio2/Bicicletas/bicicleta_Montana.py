from Bicicletas.bicicleta import Bicicleta
import time 

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
        
    def avanzar(self, continuar):
        """
        Implementación del método avanzar para la bicicleta.
        Intenta avanzar y captura cualquier excepción, mostrando un mensaje de error si ocurre.
        El avance se detiene cuando el evento 'continuar' es limpiado.
        """
        while continuar.is_set():
          try:
            # Lógica de avance, como incrementar la puntuación
            self._puntuacion += 1
            print(f"Bicicleta {self._id} ha avanzado montana, distancia recorrida: {self._puntuacion}.")
            time.sleep(2)  # Simula el tiempo de avance
          except Exception as e:
            print(f"Excepción capturada en el hilo de bicicleta {self._id}: {e}")
            break
       