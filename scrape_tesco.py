import BeautifulSoup as bs
import requests
import pandas as pd

groceries = pd.read_csv('data/grocery_items.csv')
base = 'http://www.tesco.com/groceries/product/search/default.aspx?notepad=ITEM&newSort=true'
# page = requests.get(base)
# items = bs.BeautifulSoup(str(page.content))
# results = items.find('div', attrs={'class':'headerContent'}).getText()
urls = [base.replace('ITEM', i) for i in groceries['labels']]
groceries['url'] = urls

def getItems(url):
    page = requests.get(url)
    items = bs.BeautifulSoup(str(page.content))
    results = items.find('div', attrs={'class':'headerContent'}).getText()
    print results
    return results


groceries['product_count'] = [getItems(u) for u in urls]
r = groceries.Product_count.str.extract('(\d+)')
total = r[pd.isnull(r) != True].astype('int').sum()
groceries['actual_count'] = r.astype('int')
groceries.to_csv('data/tesco_groceries.csv')

