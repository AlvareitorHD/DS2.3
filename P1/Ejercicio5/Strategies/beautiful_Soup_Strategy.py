from Strategies.scrape_Strategy import ScrapeStrategy
import requests
from bs4 import BeautifulSoup
import os
import json

# Estrategia de scraping utilizando BeautifulSoup
class BeautifulSoupStrategy(ScrapeStrategy):
    """
    Clase que representa la estrategia BeautifulSoup para escrapear datos de una empresa a través de una url.
    Clase que hereda de la clase ScrapeStrategy.
    
    Métodos:
      scrape: escrapea datos de una empresa a través de una url.
    """
    # Implementación del método scrape para BeautifulSoup
    def scrape(self, url, stock_symbol):
        """
        Función que escrapea el cierre anterior, precio de apertura, volumen y capitalización de mercado
        de una empresa a través de una url.
        
        Atributos:
            url: url de la página web a escrapear.
            stock_symbol: símbolo de la empresa a escrapear en la bolsa. 

        Returns:
            Devuelve una lista de los datos escrapeados.
        """
        # Obtiene la ruta al directorio del script principal (ej5opt.py)
        main_dir = os.path.dirname(os.path.dirname(__file__))
        # Construye la ruta al archivo de configuración
        config_path = os.path.join(main_dir, 'configuration.json')

        # Cargando la configuración de los selectores
        with open(config_path) as config_file:
            config = json.load(config_file)
        
        response = requests.get(url)
        if response.status_code == 200:
            soup = BeautifulSoup(response.content, 'html.parser')
            data = {'stock_symbol': stock_symbol}
            
            for key, value in config['selectors'].items():
                bs_selector = value['beautiful']['atributo']
                found_element = soup.find(bs_selector['tag'], bs_selector['attributes'])
                if found_element:
                    data[key] = found_element.text.strip()
                else:
                    for fallback_selector in value['beautiful']['estructura']:
                        span_element = soup.find(fallback_selector['tag'], text=fallback_selector['text'])
                        if span_element:
                            sibling = span_element.find_next_sibling(fallback_selector['sibling'])
                            if sibling:
                                data[key] = sibling.text.strip()
                                break
                    if key not in data:
                        data[key] = f'{key} Value not found'
            return data
        else:
            return f'Failed to retrieve the webpage, status code: {response.status_code}'