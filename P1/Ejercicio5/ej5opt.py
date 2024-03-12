from selenium import webdriver
from bs4 import BeautifulSoup
from selenium.common.exceptions import TimeoutException, NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import requests
import json


class ScrapeStrategy():
    def scrape(self, url):
        pass



class BeautifulSoupStrategy(ScrapeStrategy):
    def scrape(self, url, stock_symbol):
        response = requests.get(url)
        if response.status_code == 200:
            soup = BeautifulSoup(response.content, 'html.parser')
            data = {}
            open_value_td = soup.find('td', {'data-test': 'OPEN-value'})
            close_value_td = soup.find('td', {'data-test': 'PREV_CLOSE-value'})
            volume_td = soup.find('td', {'data-test': 'TD_VOLUME-value'})
            market_cap_td = soup.find('td', {'data-test': 'MARKET_CAP-value'})
            data['stock_symbol'] = stock_symbol
            if open_value_td:
                data['open'] = open_value_td.text.strip()
            else:
                data['open'] = 'Open Value not found'
            if close_value_td:
                data['close'] = close_value_td.text.strip()
            else:
                data['close'] = 'Close Value not found'
            if volume_td:
                data['volume'] = volume_td.text.strip()
            else:
                data['volume'] = 'Volume Value not found'
            if market_cap_td:
                data['market_cap'] = market_cap_td.text.strip()
            else:
                data['market_cap'] = 'Market Cap Value not found'
            return data
        else:
            return f'Failed to retrieve the webpage, status code: {response.status_code}'



class SeleniumStrategy(ScrapeStrategy):
    def scrape(self, url, stock_symbol):
        options = webdriver.ChromeOptions()
        #options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36")
        options.add_argument('--ignore-ssl-errors=yes')
        options.add_argument('--ignore-certificate-errors')
        options.add_argument('headless')
        driver = webdriver.Chrome(options=options)
        driver.get(url)
        
        # Espera explícita hasta que el elemento esté presente en la página
        wait = WebDriverWait(driver, 10)  # Aumentamos el tiempo de espera a 10 segundos    
        
        # Intenta encontrar y hacer clic en uno de los botones de cookies
        try:
          cookies_button = wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button.accept-all[name='agree']")))
          cookies_button.click()
          print(f"Se aceptaron las cookies.")
        except (NoSuchElementException, TimeoutException):
          # Si no encuentra el botón con ese texto, continúa con el siguiente
          print(f"No se encontró el botón de cookies.")  
           
        # Obtener los datos incluidos 
        try:
            data = {}
            data['stock_symbol'] = stock_symbol
            data['close'] = wait.until(EC.visibility_of_element_located((By.CSS_SELECTOR, 'td[data-test="PREV_CLOSE-value"]'))).text.strip()
            data['open'] = wait.until(EC.visibility_of_element_located((By.CSS_SELECTOR, 'td[data-test="OPEN-value"]'))).text.strip()
            data['volume'] = wait.until(EC.visibility_of_element_located((By.CSS_SELECTOR, 'td[data-test="TD_VOLUME-value"]'))).text.strip()
            data['market_cap'] = wait.until(EC.visibility_of_element_located((By.CSS_SELECTOR, 'td[data-test="MARKET_CAP-value"]'))).text.strip()
        except TimeoutException:
            print("No se pudieron encontrar todos los elementos dentro del tiempo de espera.")
            data = None
        
        # Cierra el navegador Selenium
        driver.quit()
        return data



class Context:
    def __init__(self, strategy):
        self._strategy = strategy

    def set_strategy(self, strategy):
        self._strategy = strategy

    def scrape(self, url, stock_symbol):
        return self._strategy.scrape(url, stock_symbol)



def main():
    stock_symbol = input("Enter the stock symbol (e.g., TSLA for Tesla): ")
    url = f'https://finance.yahoo.com/quote/{stock_symbol}'
    # Elección de la técnica de screapeo.
    scrapeTechnique_input = input("Techniques: \nBeautifulSoup Strategy: 0\nSelenium Strategy: 1\nChoose a technique (number): ")
    
    try:
      scrapeTechnique = int(scrapeTechnique_input)
      
    except ValueError:
      scrapeTechnique = -1  # Asigna un valor inicial inválido para entrar al bucle.
    
    # Repetir la elección si no ha sido válida.
    while scrapeTechnique > 1 or scrapeTechnique < 0:
        scrapeTechnique = input("Please choose a chooseable number, 0 or 1.\nTechniques: \nBeautifulSoup Strategy: 0\nSelenium Strategy: 1\nChoose a technique (number): ")
        try:
          scrapeTechnique = int(scrapeTechnique_input)
        except ValueError:
          continue  # Si la conversión falla, simplemente continua y vuelve a pedir la entrada.
    
    if scrapeTechnique == 0:
        #------------------------------------------------------------------Beautiful-----------------------------------------------------------------------
        ##################################################################################################################################################
        context = Context(BeautifulSoupStrategy())
        values = context.scrape(url, stock_symbol)
        print('Values BeautifulSoupStrategy:', values)
        ##################################################################################################################################################
    else:
        #------------------------------Selenium-----------------------------------------------------------------------------------------------------------------
        ##################################################################################################################################################
        context = Context(SeleniumStrategy())
        values = context.scrape(url,stock_symbol)
        print('Values SeleniumStrategy:', values)
        ##################################################################################################################################################
   
    datos_requeridos_json = "datos_screpear.json"
    
    with open(datos_requeridos_json, "w") as archivo:
            json.dump(values, archivo)
            
      
            
if __name__ == "__main__":
    main()
