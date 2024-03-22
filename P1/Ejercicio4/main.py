from gestor_filtros import GestorFiltros
from objetivo import Objetivo
from estado_motor import EstadoMotor
from filtros import Contexto, CalcularVelocidad, RepercutirRozamiento
from cliente import Cliente
from gui.ventana import Ventana

def main(iu: bool):
    """
    Funcion principal
    """
    objetivo = Objetivo()
    
    gestor = GestorFiltros(objetivo)
    gestor.aniadir_filtro(CalcularVelocidad())
    gestor.aniadir_filtro(RepercutirRozamiento())
    
    cliente = Cliente(gestor)

    if iu:
        ventana = Ventana(cliente)
        ventana.abrir()
    else:
        # Una prueba
        contexto = Contexto(0, EstadoMotor.ENCENDIDO)
        verbose = True
        
        cliente.solicitar(contexto, verbose)
        contexto.estado_motor = EstadoMotor.ACELERANDO
        cliente.solicitar(contexto, verbose)
        cliente.solicitar(contexto, verbose)
        cliente.solicitar(contexto, verbose)
        contexto.estado_motor = EstadoMotor.FRENANDO
        cliente.solicitar(contexto, verbose)
        
if __name__ == "__main__":
    iu: bool = True
    main(iu)