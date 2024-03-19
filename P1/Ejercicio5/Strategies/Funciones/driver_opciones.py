from selenium.webdriver.chrome.options import Options
from selenium import webdriver

def get_driver(url):
    """
    Configura y devuelve el driver del WebDriver de Chrome.
    
    :param url: url de la página a scrapear.
    :return: Objeto driver configurado.
    """
    options = Options()
    options.add_argument('headless')  # Configura Chrome para ejecutarse en modo sin interfaz gráfica.
    options.add_argument("--disable-logs")  # Intenta deshabilitar los logs
    options.add_argument("--log-level=3")  # Establece el nivel de registro para mostrar solo errores
    
    driver = webdriver.Chrome(options=options) # Se crea el driver.
    driver.get(url)  # Navega a la URL especificada.
    
    return driver









