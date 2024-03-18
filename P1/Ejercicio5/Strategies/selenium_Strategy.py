from Strategies.scrape_Strategy import ScrapeStrategy
from selenium import webdriver
from selenium.common.exceptions import TimeoutException, NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import json
import os

# Estrategia de scraping utilizando Selenium.
class SeleniumStrategy(ScrapeStrategy):
    """
    Clase que representa la estrategia Selenium para escrapear datos de una empresa a través de una url.
    Clase que hereda de la clase ScrapeStrategy.
    
    Métodos:
      scrape: escrapea datos de una empresa a través de una url.
    """
    # Implementación del método scrape para Selenium.
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
        
        # Función que intenta encontrar el elemento usando una lista de selectores.
        def find_element_with_fallback(driver, selector_list):
          for selector in selector_list:
            try:
              element = WebDriverWait(driver, 10).until(
                        EC.presence_of_element_located((By.XPATH, selector['pattern']))
              )
              return element.text  # Se retorna el texto del elemento encontrado. 
            except TimeoutException:
              continue  # Si el selector falla, continua con el siguiente
          raise NoSuchElementException(f"No se pudo encontrar el elemento con los selectores proporcionados.")
        
        options = webdriver.ChromeOptions()  # Crea un objeto para opciones de Chrome.
        options.add_argument('headless')  # Configura Chrome para ejecutarse en modo sin interfaz gráfica.
        driver = webdriver.Chrome(options=options)  # Inicializa el navegador Chrome con las opciones definidas.
        
        try:
            
          driver.get(url)  # Navega a la URL especificada.
  
          try:
              cookies_button = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button.accept-all[name='agree']")))  # Espera hasta que el botón de aceptar cookies sea clickeable.
              cookies_button.click()  # Hace clic en el botón de aceptar cookies.
              print(f"Se aceptaron las cookies.")  # Imprime un mensaje indicando que las cookies fueron aceptadas.
          except (NoSuchElementException, TimeoutException):
              print(f"No se encontró el botón de cookies.")  # Imprime un mensaje si no se encuentra el botón de cookies.
        
          data = {}  # Crea un diccionario para almacenar los datos recopilados.
          try:
              data['stock_symbol'] = stock_symbol  # Almacena el símbolo de la acción.
              data['close'] = find_element_with_fallback(driver, config['selectors']['cierre_anterior'])  # Espera hasta que el valor de cierre sea visible y lo extrae.
              data['open'] = find_element_with_fallback(driver, config['selectors']['apertura'])  # Espera hasta que el valor de apertura sea visible y lo extrae.
              data['volume'] = find_element_with_fallback(driver, config['selectors']['volumen'])  # Espera hasta que el volumen de transacciones sea visible y lo extrae.
              data['market_cap'] = find_element_with_fallback(driver, config['selectors']['market_cap'])  # Espera hasta que el valor de capitalización de mercado sea visible y lo extrae.
          except NoSuchElementException:
              print("No se pudieron encontrar todos los elementos.")  # Imprime un mensaje si no se encuentran todos los elementos antes de que expire el tiempo de espera.
              data = None  # Asigna None al diccionario de datos si hubo un error.
            
        except Exception as e:
            print(f'Fallo al scrapear los datos: {e}')
        finally:
            driver.quit()
    
        return data  # Devuelve el diccionario de datos recopilados.
