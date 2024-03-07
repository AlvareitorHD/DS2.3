from gestor_filtros import GestorFiltros
from objetivo import Objetivo
from estado_motor import EstadoMotor
from filtros import Contexto, CalcularVelocidad, RepercutirRozamiento
from cliente import Cliente

"""
Mi mayor pesadilla:
Rehacer todo el trabajo por querer hacerlo antes de la explicacion 🤯
"""

def main(iu: bool):
    """
    Funcion principal
    """
    objetivo = Objetivo()
    
    gestor = GestorFiltros()
    gestor.aniadir_filtro(CalcularVelocidad())
    gestor.aniadir_filtro(RepercutirRozamiento())
    gestor.objetivo = objetivo
    
    cliente = Cliente()
    cliente.gestor = gestor

    if iu:
        cliente.iniciar_iu()
    else:
        # Una prueba
        contexto = Contexto(0, EstadoMotor.ENCENDIDO)
        cliente.solicitar(contexto, True)
        contexto.estado_motor = EstadoMotor.ACELERANDO
        cliente.solicitar(contexto, True)
        cliente.solicitar(contexto, True)
        cliente.solicitar(contexto, True)
        contexto.estado_motor = EstadoMotor.FRENANDO
        cliente.solicitar(contexto, True)
        
if __name__ == "__main__":
    iu: bool = True
    main(iu)