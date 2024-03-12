from selenium import webdriver
from bs4 import BeautifulSoup
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import requests
import time
import json


class ScrapeStrategy():
    def scrape(self, url):
        pass

"""
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

"""
class SeleniumStrategy(ScrapeStrategy):
    def scrape(self, url, stock_symbol):
        options = webdriver.ChromeOptions()
        options.add_argument('headless')
        driver = webdriver.Chrome(options=options)
        driver.get(url)
        
        # Espera explícita hasta que el elemento esté presente en la página
        wait = WebDriverWait(driver, 10)  # Aumentamos el tiempo de espera a 10 segundos
        try:
            open_value_elem = wait.until(EC.presence_of_element_located((By.XPATH, "//td[@data-test='OPEN-value']")))
            close_value_elem = wait.until(EC.presence_of_element_located((By.XPATH, "//td[@data-test='PREV_CLOSE-value']")))
            volume_elem = wait.until(EC.presence_of_element_located((By.XPATH, "//td[@data-test='TD_VOLUME-value']")))
            market_cap_elem = wait.until(EC.presence_of_element_located((By.XPATH, "//td[@data-test='MARKET_CAP-value']")))
        except TimeoutException:
            print("Elementos no encontrados dentro del tiempo de espera.")
            driver.quit()
            return None
        
        # Extrae el texto de los elementos
        open_value = open_value_elem.text.strip()
        close_value = close_value_elem.text.strip()
        volume = volume_elem.text.strip()
        market_cap = market_cap_elem.text.strip()
        
        # Crea un diccionario con los datos y el símbolo de la acción
        data = {
            'stock_symbol': stock_symbol,
            'open': open_value,
            'close': close_value,
            'volume': volume,
            'market_cap': market_cap
        }
        
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
    
    """
    #------------------------------------------------------------------Beautiful-----------------------------------------------------------------------
    context = Context(BeautifulSoupStrategy())
    values = context.scrape(url, stock_symbol)
    print('Values BeautifulSoupStrategy:', values)

    datos_requeridos1 = "datos_beautifulSoap.json"
    
    with open(datos_requeridos1, "w") as archivo:
        json.dump(values, archivo)
    """
    #------------------------------Selenium-----------------------------------------------------------------------------------------------------------------
    context = Context(SeleniumStrategy())
    values = context.scrape(url,stock_symbol)
    print('Values SeleniumStrategy:', values)

    datos_requeridos2 = "datos_seleniumStrategy.json"
    
    with open(datos_requeridos2, "w") as archivo:
        json.dump(values, archivo)


if __name__ == "__main__":
    main()
