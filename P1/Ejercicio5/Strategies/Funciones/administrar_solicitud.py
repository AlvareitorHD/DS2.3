import requests

def get_html_content(url):
    """
    Realiza una solicitud HTTP GET a la URL proporcionada y devuelve el contenido de la página.

    :param url: URL de la página web a solicitar.
    :return: Contenido HTML de la página si la solicitud fue exitosa, de lo contrario, devuelve None.
    """
    
    # Realiza una solicitud HTTP GET a la url proporcionada
    response = requests.get(url)
    
    # Si el codigo de respuesta es éxito, entonces devuelve el contenido de la pagina.
    if response.status_code == 200:
        return response.content
    else:
        # Sino un mensaje de error.
        print(f"Error al realizar la solicitud HTTP.")
        return None
