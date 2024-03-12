from Strategies.scrape_Strategy import ScrapeStrategy
import requests
from bs4 import BeautifulSoup

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
        response = requests.get(url)  # Realiza una solicitud HTTP GET a la URL especificada.
        if response.status_code == 200:  # Verifica si la solicitud fue exitosa (código de estado HTTP 200).
            soup = BeautifulSoup(response.content, 'html.parser')  # Parsea el contenido HTML de la respuesta utilizando BeautifulSoup.
            data = {}  # Crea un diccionario para almacenar los datos recopilados.
            
            # Búsqueda de los elementos necesarios en el DOM
            open_value_td = soup.find('td', {'data-test': 'OPEN-value'})  # Busca el elemento td que contiene el valor de apertura.
            close_value_td = soup.find('td', {'data-test': 'PREV_CLOSE-value'})  # Busca el elemento td que contiene el valor de cierre.
            volume_td = soup.find('td', {'data-test': 'TD_VOLUME-value'})  # Busca el elemento td que contiene el volumen de transacciones.
            market_cap_td = soup.find('td', {'data-test': 'MARKET_CAP-value'})  # Busca el elemento td que contiene la capitalización de mercado.
            data['stock_symbol'] = stock_symbol  # Almacena el símbolo de la acción.
            
            # Extracción y asignación de datos
            data['open'] = open_value_td.text.strip() if open_value_td else 'Open Value not found'  # Extrae el valor de apertura o asigna un mensaje de no encontrado.
            data['close'] = close_value_td.text.strip() if close_value_td else 'Close Value not found'  # Extrae el valor de cierre o asigna un mensaje de no encontrado.
            data['volume'] = volume_td.text.strip() if volume_td else 'Volume Value not found'  # Extrae el volumen de transacciones o asigna un mensaje de no encontrado.
            data['market_cap'] = market_cap_td.text.strip() if market_cap_td else 'Market Cap Value not found'  # Extrae la capitalización de mercado o asigna un mensaje de no encontrado.
            return data  # Devuelve el diccionario con los datos recopilados.
        else:
            # Retorna un mensaje de error si no se pudo recuperar la página web correctamente.
            return f'Failed to retrieve the webpage, status code: {response.status_code}'
