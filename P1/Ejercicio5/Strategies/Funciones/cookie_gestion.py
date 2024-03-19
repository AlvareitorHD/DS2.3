from selenium.common.exceptions import TimeoutException, NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def decisionCookies ():
    """
    Se le pregunta al cliente por su decison de las cookies, y se valida
    su respuesta.

    Returns: input valido proporcionado por el cliente.
    """
    
    # Mensaje para aceptar o rechazar las cookies.
    cookies_input = input("¿Quieres aceptar las cookies?(S or N): ")
    
    # Valida si la entrada es valida o no.
    while cookies_input != "S" and cookies_input != "N" and cookies_input != "No" and cookies_input != "Si":
        print("\nError: Por favor, Responde con el formato S, N, Si, No.\n")
        cookies_input = input("¿Quieres aceptar las cookies?(S or N): ")
    return cookies_input

def cookiesGestionadas (decision, config, driver):
    """
    Se aceptan/rechazas las cookies en el navegador.
    """
    # Guarda la decision de aceptar o rechazar las cookies. 
    if decision == "Y" or decision == "Yes":
        cookies_selector = config['cookies']['aceptar']
    else:
        cookies_selector = config['cookies']['rechazar']
            
    # Espera hasta que el botón de gestionar las cookies sea clickeable.
    cookies_button = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, cookies_selector)))
    cookies_button.click()  # Hace clic en el botón de aceptar/rechazar cookies.


def manage_cookies(driver, config):
    """
    Gestiona la aceptación o rechazo de cookies en la página.
    
    Metodos:
      decisionCookies: Pregunta al cliente por su decison de las cookies, y valida su respuesta.
      cookiesGestionadas: Se aceptan/rechazas las cookies en el navegador.
      
    :param driver: Instancia del WebDriver.
    :param config: Configuración cargada desde el archivo JSON.
    """
    try:
        # Cliente decide si aceptar o rechazar cookies.
        decision = decisionCookies()
        
        # Se gestionan las cookies en el navegador
        cookiesGestionadas (decision, config, driver)
        
    except (NoSuchElementException, TimeoutException):
        print("No se encontró el botón de cookies.")