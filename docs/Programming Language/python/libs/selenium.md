# selenium

## Install

```
pip3 install selenium

# chromium (https://chromedriver.chromium.org/downloads)
sudo apt install chromium-browser
wget https://chromedriver.storage.googleapis.com/87.0.4280.20/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo mv chromedriver /usr/bin/chromedriver
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver

```

## Example

```python3
from selenium.webdriver.chrome.options import Options

chrome_options = Options()
chrome_options.add_argument('blink-settings=imagesEnabled=false')
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-setuid-sandbox")
chrome_options.add_argument("--remote-debugging-port=9222")
chrome_options.add_argument("--disable-dev-shm-using")
chrome_options.add_argument("--disable-extensions")
chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("start-maximized")
chrome_options.add_argument("disable-infobars")
chrome_options.add_argument("--headless")

url = 'your_url'
driver = webdriver.Chrome('/usr/bin/chromedriver',chrome_options=chrome_options)
driver.get(url)
```

