from bs4 import BeautifulSoup

def extract_data(html_content, config, stock_symbol):
    """
    Analiza el contenido HTML y extrae los datos según los selectores configurados.

    :param html_content: Contenido HTML de la página a analizar.
    :param config: Configuración con los selectores para la extracción de datos.
    :param stock_symbol: Símbolo de la empresa a escrapear.
    :return: Diccionario con los datos extraídos.
    """
    # Crea un objeto BeautifulSoup con el contenido HTML para el análisis.
    soup = BeautifulSoup(html_content, 'html.parser')
    # Inicializa un diccionario para almacenar los datos extraídos, comenzando con el símbolo de la acción.
    data = {'simbolo_accion': stock_symbol}
    
    # Itera sobre los selectores configurados para extraer los datos.
    for key, value in config['selectors'].items():
        # Extrae el selector específico de BeautifulSoup desde la configuración.
        bs_selector = value['beautiful']['atributo']
        # Intenta encontrar el elemento en el HTML usando el selector.
        found_element = soup.find(bs_selector['tag'], bs_selector['attributes'])
        # Si el elemento se encuentra, almacena su texto en el diccionario.
        if found_element:
            data[key] = found_element.text.strip()
        else:
            # Si el elemento principal no se encuentra, intenta con selectores alternativos.
            for fallback_selector in value['beautiful']['estructura']:
                span_element = soup.find(fallback_selector['tag'], text=fallback_selector['text'])
                if span_element:
                    # Encuentra el elemento hermano del elemento encontrado.
                    sibling = span_element.find_next_sibling(fallback_selector['sibling'])
                    if sibling:
                        # Almacena el texto del hermano encontrado y termina el bucle.
                        data[key] = sibling.text.strip()
                        break
            # Si después de buscar con todos los selectores el dato no se encuentra, se almacena un mensaje de valor no encontrado.
            if key not in data:
                data[key] = f'{key} Value not found'
    
    # Devuelve el diccionario con los datos extraídos.
    return data
