from Strategies.Funciones.config_carga import load_config
from Strategies.Funciones.driver_opciones import get_driver
from Strategies.Funciones.cookie_gestion import manage_cookies
from Strategies.Funciones.data_extractor import extract_data
from Strategies.scrape_Strategy import ScrapeStrategy

# Estrategia de scraping utilizando Selenium.
class SeleniumStrategy(ScrapeStrategy):
    """
    Clase que representa la estrategia Selenium para escrapear datos de una empresa a través de una url.
    Clase que hereda de la clase ScrapeStrategy.
    
    Métodos:
      scrape: escrapea datos de Yahoo Finanazas a través de la url.
    """
    # Implementación del método scrape para Selenium.
    def scrape(self, url, stock_symbol):
        """
        Realiza el scraping de datos de una página web basado en la URL y el símbolo de la acción.
        
        :param url: URL de la página a escrapear.
        :param stock_symbol: Símbolo de la acción a escrapear.
        :return: Diccionario con los datos escrapeados.
        """
        config = load_config() # Se carga el fichero de configuracion.
        
        try:
          driver = get_driver(url) # Se crea el driver
          manage_cookies(driver, config) # Gestion de las cookies.
          data = extract_data(driver, stock_symbol, config) # Datos scrapeados.
        except Exception: # Fallo a la hora de scrapear.
          data = f'Fallo al scrapear los datos. Revisa la acción elegida.'
        finally:
          driver.quit() # Se cierra el driver.
        
        return data # Se devuelve los datos extraidos. 