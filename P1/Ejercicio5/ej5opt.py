import json
from Context.context import Context
from Strategies.beautiful_Soup_Strategy import BeautifulSoupStrategy
from Strategies.selenium_Strategy import SeleniumStrategy


def mensajeBienvenida():
    """
    Imprime una serie de mensajes iniciales dando la bienvenida y aportando algo de información sobre el script
    """
    print("Bienvenido al extractor de información de acciones de Yahoo Finanzas")
    print("Este script te permitirá obtener datos en tiempo real de cualquier acción listada en Yahoo Finanzas.")
    print("\nPor favor, sigue las instrucciones para proceder.\n")


def obtenerDatos():
    """
    Se solicitan, comprueban y almacenan los datos necesarios para llevar a cabo la inspección web
    """

    datos = []  # Lista para almacenar los datos obtenidos: símbolo de la acción y técnica de scraping seleccionada

    # Solicitud del símbolo de la acción:
    stock_symbol = input("Introduce el símbolo de la acción (por ejemplo, TSLA para Tesla): ")
    url = f'https://finance.yahoo.com/quote/{stock_symbol}'
    print(f"\nAccediendo a los datos de la acción: {stock_symbol}...")
    datos.append(stock_symbol)

    # Elección de la técnica de scraping:
    print("\nPuedes elegir entre dos técnicas de scraping:")
    print("0 - BeautifulSoup (recomendado para scrapear contenido estático)")
    print("1 - Selenium (necesario para scrapear contenido dinámico)")
    scrapeTechnique_input = input("\nElige una técnica (número): ")

    try:
        scrapeTechnique = int(scrapeTechnique_input)

        if scrapeTechnique in [0, 1]:
            datos.append(scrapeTechnique)
            return (datos)
    except ValueError:
        scrapeTechnique = -1

    # Validación del input():
    while scrapeTechnique not in [0, 1]:
        print("\nError: Por favor, elige un número válido.")
        scrapeTechnique_input = input("Técnicas: \n0 - BeautifulSoup\n1 - Selenium\nElige una técnica (número): ")
        try:
            scrapeTechnique = int(scrapeTechnique_input)

            if scrapeTechnique in [0, 1]:
                datos.append(scrapeTechnique)
                return (datos)
        except ValueError:
            continue


def crearContexto(url, stock_symbol, scrapeTechnique):
    """
    Crea el contexto en función de la estrategia pasada
    """

    context = Context(BeautifulSoupStrategy() if scrapeTechnique == 0 else SeleniumStrategy())
    return (context.scrape(url, stock_symbol))  # Transmite la url donde buscar y la empresa a crapear.


def guardarDatosEnJSON(valores, nombreFichero, permisos):
    """
    Crea o sobreescribe un fichero JSON indicado con los datos pasados. Manipula el archivo atendiendo a los permisos
    pasados
    """

    # Se sobreescriben los datos en el fichero:
    with open(nombreFichero, permisos) as archivo:
        json.dump(valores, archivo)



def main():
    """
    Función principal que guia el programa para llevar a cabo la inspección web. Se escoge una empresa a escrapear para,
    posteriormente, usar una técnica para ello, ya sea BeautifulSoup o Selenium. Posteriormente, se introducen los
    resultados en un fichero JSON
    """

    # Mostrar el mensaje de bienvenida con alguna información de uso del programa:
    mensajeBienvenida()

    # Solicitud del símbolo de la acción y elección de la técnica de scraping:
    datos = obtenerDatos()

    # Confirmación de la elección
    technique_name = "BeautifulSoup" if datos[1] == 0 else "Selenium"
    print(f"\nHas elegido {technique_name} como tu técnica de scraping.\n\nScrapeando...")

    # Crea el contexto en función de la estrategia a utilizar:
    valores = crearContexto(f'https://finance.yahoo.com/quote/{datos[0]}', datos[0], datos[1])

    # Imprime un valor de salida en función de si ha conseguido scrapear o no:
    if valores == "Fallo al scrapear los datos. Revisa la accion elegida.":
        print(valores)  # Imprime un fallo.
    else:
        # Imprime que ha sido exitoso.
        print(('Valores scrapeados por BeautifulSoupStrategy. '
               if not datos[1]
               else 'Valores scrapeados por SeleniumStrategy. '), "\nFichero datos_scrapear.json actualizado.")

        # Guardar los datos obtenidos en un fichero JSON:
        guardarDatosEnJSON(valores, "DatosScrapeados/datos_scrapear.json", "w")



if __name__ == "__main__":
    main()
