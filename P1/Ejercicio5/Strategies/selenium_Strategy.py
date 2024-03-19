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
        
        options = webdriver.ChromeOptions()  # Crea un objeto para opciones de Chrome.
        options.add_argument('headless')  # Configura Chrome para ejecutarse en modo sin interfaz gráfica.
        options.add_argument("--disable-logs")  # Intenta deshabilitar los logs
        options.add_argument("--log-level=3")  # Establece el nivel de registro para mostrar solo errores

         # Inicializa el navegador Chrome con las opciones definidas
        driver = webdriver.Chrome(options=options)
        
        try:
            
          driver.get(url)  # Navega a la URL especificada.
  
          try:
              cookies_button = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button.accept-all[name='agree']")))  # Espera hasta que el botón de aceptar cookies sea clickeable.
              cookies_button.click()  # Hace clic en el botón de aceptar cookies.
              print(f"Cookies aceptadas.")  # Imprime un mensaje indicando que las cookies fueron aceptadas.
          except (NoSuchElementException, TimeoutException):
              print(f"No se encontró el botón de cookies.")  # Imprime un mensaje si no se encuentra el botón de cookies.
         
          data = {'stock_symbol': stock_symbol}
          for key, value in config['selectors'].items():
                selenium_selector = value['selenium']['atributo']
                try:
                    element = WebDriverWait(driver, 10).until(
                        EC.presence_of_element_located((By.XPATH, selenium_selector))
                    )
                    data[key] = element.text.strip()
                except TimeoutException:
                    fallback_selector = value['selenium']['estructura']
                    element = WebDriverWait(driver, 10).until(
                        EC.presence_of_element_located((By.XPATH, fallback_selector))
                    )
                    data[key] = element.text.strip() if element else f'{key} Value not found'
            
        except Exception as e:
            data = f'Failed to scrape data: {e}'
        finally:
            driver.quit()
        
        return data