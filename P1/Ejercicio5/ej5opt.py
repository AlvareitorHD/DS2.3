import json
from Context.context import Context
from Strategies.beautiful_Soup_Strategy import BeautifulSoupStrategy
from Strategies.selenium_Strategy import SeleniumStrategy

def main():
  """
  Se escoge una empresa a escrapear para posteriormente usar uns técnica para ello, ya sea 
  BeautifulSoup o Selenium. Posteriormente se introducen los resultados en un fichero .json.
  """
  print("Bienvenido al extractor de información de acciones de Yahoo Finanzas")
  print("Este script te permitirá obtener datos en tiempo real de cualquier acción listada en Yahoo Finanzas.")
  print("\nPor favor, sigue las instrucciones para proceder.\n")

  # Solicitud del símbolo de la acción
  stock_symbol = input("Introduce el símbolo de la acción (por ejemplo, TSLA para Tesla): ")
  url = f'https://finance.yahoo.com/quote/{stock_symbol}'
  print(f"\nAccediendo a los datos de la acción: {stock_symbol}...")

  # Elección de la técnica de scraping
  print("\nPuedes elegir entre dos técnicas de scraping:")
  print("0 - BeautifulSoup (recomendado para scrapear contenido estático)")
  print("1 - Selenium (necesario para scrapear contenido dinámico)")
  scrapeTechnique_input = input("Elige una técnica (número): ")

  try:
    scrapeTechnique = int(scrapeTechnique_input)
  except ValueError:
    scrapeTechnique = -1

  # Validación del input
  while scrapeTechnique not in [0, 1]:
    print("\nError: Por favor, elige un número válido.")
    scrapeTechnique_input = input("Técnicas: \n0 - BeautifulSoup\n1 - Selenium\nElige una técnica (número): ")
    try:
        scrapeTechnique = int(scrapeTechnique_input)
    except ValueError:
        continue

  # Confirmación de la elección
  technique_name = "BeautifulSoup" if scrapeTechnique == 0 else "Selenium"
  print(f"\nHas elegido {technique_name} como tu técnica de scraping.\n\nScrapeando...")
  context = Context(BeautifulSoupStrategy() if scrapeTechnique == 0 else SeleniumStrategy())  # Crea el contexto en función de la estraategia a utilizar
  values  = context.scrape(url, stock_symbol)  # Transmite la url donde buscar y la empresa a crapear.

  if values == "Fallo al scrapear los datos. Revisa la acción elegida.":
    print(values)
  else:
    print(('Valores scrapeados por BeautifulSoupStrategy. ' if not scrapeTechnique else 'Valores scrapeados por SeleniumStrategy. '),"\nFichero datos_scrapear.json actualizado.")
   
    datos_requeridos_json = "DatosScrapeados/datos_scrapear.json" # Fichero donde se guardarán los datos.
    
    # Se sobreescriben los datos en el fichero.
    with open(datos_requeridos_json, "w") as archivo:
      json.dump(values, archivo)
            
      
            
if __name__ == "__main__":
    main()
