from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException

def extract_data(driver, stock_symbol, config):
    """
    Extrae los datos de la página utilizando Selenium.
    
    :param driver: Instancia del WebDriver.
    :param stock_symbol: Símbolo de la acción a escrapear.
    :param config: Configuración cargada desde el archivo JSON.
    :return: Diccionario con los datos extraídos.
    """
    # Inicializa un diccionario para almacenar los datos extraídos con el símbolo de la acción como primer elemento.
    data = {'simbolo_accion': stock_symbol}

    # Itera sobre los selectores configurados en el archivo JSON para extraer los datos de la página.
    for key, value in config['selectors'].items():
        # Obtiene el selector XPATH de buscar por atributo para Selenium desde la configuración.
        selenium_selector = value['selenium']['atributo']
        try:
            # Espera hasta 10 segundos para que el elemento especificado por 'selenium_selector' esté presente en el DOM.
            element = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.XPATH, selenium_selector))
            )
            # Extrae el texto del elemento encontrado y lo almacena en el diccionario 'data', eliminando espacios en blanco al inicio y al final.
            data[key] = element.text.strip()
        except TimeoutException:
            # En caso de no encontrar el elemento con el selector principal, intenta con un selector por estructura.
            fallback_selector = value['selenium']['estructura']
            # Espera hasta 10 segundos para que el elemento especificado por 'fallback_selector' esté presente en el DOM.
            element = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.XPATH, fallback_selector))
            )
            # Almacena el texto del elemento encontrado en el diccionario 'data', o un mensaje indicando que el valor no se encontró.
            data[key] = element.text.strip() if element else f'{key} Value not found'

    # Devuelve el diccionario 'data' con los datos extraídos. 
    return data