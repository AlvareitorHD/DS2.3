from gestor_filtros import GestorFiltros
from filtros import CalcularVelocidad, RepercutirRozamiento

def main():
    """
    Funcion principal
    
    Actua como cliente de nuestro programa
    """
    gestor = GestorFiltros()
    gestor.aniadir_filtro(CalcularVelocidad())
    gestor.aniadir_filtro(RepercutirRozamiento())
    # ...

if __name__ == "__main__":
    main()