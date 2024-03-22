# Contexto para usar las estrategias de scraping
class Context:
    """
    Clase para crear el contexto para escrapear.
    
    Atributos:
    _strategy: Estrategia para escrapear.
    
    Metodos:
    __init__: constructor de la clase, tiene como parámetro strategy (la estrategia).
    set_strategy: set del atributo _strategy, tiene como parámetro strategy (la estrategia).
    scrape: función para escrapear, tiene como parámetro la url de la página web y el símbolo de la 
            empresa a escrapear.
    """
    def __init__(self, strategy):
        """
        Constructor de la clase, crear un contexto.
        
        Atributos:
            strategy: Estrategia para escrapear.
        """
        self._strategy = strategy

    def set_strategy(self, strategy):
        """
        Set del atributo _strategy
        
        Atributos:
            strategy: Estrategia para escrapear.
        """
        self._strategy = strategy

    def scrape(self, url, stock_symbol):
        """
        Función para escrapear los datos de la empresa de una url.
        
        Atributos:
            url: url de la página web a escrapear.
            stock_symbol: símbolo de la empresa a escrapear en la bolsa. 

        Returns:
            Devuelve una lista de los datos escrapeados.
        """
        return self._strategy.scrape(url, stock_symbol)
