import json
import os

def load_config():
    """
    Carga la configuración desde un archivo JSON.
    
    :return: Diccionario con la configuración cargada.
    """
    # Obtiene la ruta al directorio del script principal (ej5opt.py)
    main_dir = os.path.dirname(os.path.dirname(__file__))
    # Construye la ruta al archivo de configuración
    config_path = os.path.join(main_dir, '../Configuracion/configuration.json')

    # Cargando la configuración de los selectores
    with open(config_path) as config_file:
        return json.load(config_file)