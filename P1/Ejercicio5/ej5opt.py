import json
from Context.context import Context
from Strategies.beautiful_Soup_Strategy import BeautifulSoupStrategy
from Strategies.selenium_Strategy import SeleniumStrategy

def main():
    """
    Se escoge una empresa a escrapear para posteriormente usar uns técnica para ello, ya sea 
    BeautifulSoup o Selenium. Posteriormente se introducen los resultados en un fichero .json.
    """
    stock_symbol = input("Enter the stock symbol (e.g., TSLA for Tesla): ")
    url = f'https://finance.yahoo.com/quote/{stock_symbol}'
    
    # Elección de la técnica de screapeo.
    scrapeTechnique_input = input("Techniques: \nBeautifulSoup Strategy: 0\nSelenium Strategy: 1\nChoose a technique (number): ")
    
    try:
      scrapeTechnique = int(scrapeTechnique_input)
    except ValueError:
      scrapeTechnique = -1  # Asigna un valor inicial inválido para entrar al bucle.
    
    # Validación del input para la técnica de scraping.
    while scrapeTechnique > 1 or scrapeTechnique < 0:
        scrapeTechnique = input("Please choose a chooseable number, 0 or 1.\nTechniques: \nBeautifulSoup Strategy: 0\nSelenium Strategy: 1\nChoose a technique (number): ")
        try:
          scrapeTechnique = int(scrapeTechnique_input) # Toma como tipo un entero.
        except ValueError:
          continue  # Si la conversión falla, simplemente continua y vuelve a pedir la entrada.

    context = Context(BeautifulSoupStrategy())  # Crea el contexto para usar BeautifulSoup.
    values  = context.scrape(url, stock_symbol)  # Transmite la url donde buscar y la empresa a crapear.

    print(('Values BeautifulSoupStrategy:' if not scrapeTechnique else 'Values SeleniumStrategy:'), values)
   
    datos_requeridos_json = "datos_screpear.json" # Fichero donde se guardarán los datos.
    
    # Se sobreescriben los datos en el fichero.
    with open(datos_requeridos_json, "w") as archivo:
            json.dump(values, archivo)
            
      
            
if __name__ == "__main__":
    main()
