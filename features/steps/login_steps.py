from selenium.webdriver.chrome.options import Options
from selenium.webdriver.firefox.options import Options
import geckodriver_autoinstaller

from behave import given
from selenium import webdriver

@given("I am on the login page")
def step_impl(context):
    fire_fox_options = Options()
    fire_fox_options.add_argument('--headless')
    context.driver = webdriver.Remote(command_executor='http://selenium-firefox:4444/wd/hub', options=fire_fox_options)
    context.driver.get("https://x.com/i/flow/login")
    print(context.driver.title)

    # geckodriver_autoinstaller.install()
    # driver = webdriver.Firefox()
    # driver.get("https://x.com/i/flow/login")
    # print(driver.title)