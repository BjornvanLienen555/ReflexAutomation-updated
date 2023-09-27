from selenium import webdriver
from selenium.webdriver.common.by import By

driver = webdriver.Edge
receipts = driver.find_elements(By.XPATH, '//*[@maxlength="8"]')


def click_receipt(): driver.execute_script(
    '$(arguments[0]).click();', receipts)
