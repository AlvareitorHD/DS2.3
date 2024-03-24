from Strategies.scrape_Strategy import ScrapeStrategy
from Strategies.Funciones.config_carga import load_config
from Strategies.Funciones.administrar_solicitud import get_html_content
from Strategies.Funciones.soup_parser import extract_data

class BeautifulSoupStrategy(ScrapeStrategy):
    """
    Implementa la estrategia de scraping utilizando BeautifulSoup para extraer datos de una página web.
    """
    
    def scrape(self, url, stock_symbol):
        """
        Escrapea datos de una página web dada su URL y el símbolo de stock.

        :param url: URL de la página web a escrapear.
        :param stock_symbol: Símbolo de la empresa en la bolsa.
        :return: Diccionario con los datos escrapeados o un mensaje de error.
        """
        
         # Se carga el fichero de configuracion.
        config = load_config()
        
        # Se obtiene el contenido de la pagina
        html_content = get_html_content(url)
        
        # Si no ha habido ningun problema se scrapea los datos, sino se devuelve un mensaje de fallo.
        if html_content:
            #Se extraen los datos.
            data = extract_data(html_content, config, stock_symbol)
            return data
        else:
            return 'Fallo al scrapear los datos. Revisa la accion elegida.'
