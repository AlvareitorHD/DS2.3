# Clase base para las estrategias de scraping
class ScrapeStrategy():
    """
    Clase que representa la estrategia a usar para escrapear.
    
    Metodo:
      scrape: Función que escrapea una empresa a través de una url.
    """
     # Método de scraping que debe ser implementado por las estrategias concretas
    def scrape(self, url, stock_symbol):
        """
        Función que escrapea el cierre anterior, precio de apertura, volumen y capitalización de mercado
        de una empresa a través de una url
        
        Atributos:
            url: url de la página web a escrapear.
            stock_symbol: símbolo de la empresa a escrapear en la bolsa. 
        """
        pass
