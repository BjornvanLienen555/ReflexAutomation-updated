@parallel=false
Feature: Create, get and delete basic data

  Background:
    # get data from files
    * def ItemBody = read('classpath:nl/gall/reflex/json/newItem.json')
    * def ItemLvBody = read('classpath:nl/gall/reflex/json/newItemLv.json')

    # set data for test
    * def auth = call read('classpath:nl/gall/reflex/helper/auth.feature')
    * def token = auth.token
    * def originatorReference = "TA"
    * def consignee_code = "191219IB"
    * def supplier_code = "940659"
    * def item = "31313131"
    * def item_lv_code = ""

  Scenario: Create an Item
    Given url baseUrl
    And path 'activities', activity_code, 'items'
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    And request ItemBody
    When method Post
    Then status 201
    * match response.status == "WARN"

  Scenario: Get an Item
    Given url baseUrl
    And path 'activities', activity_code, 'items', item
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Get
    Then status 200
    * match response.status == "SUCCESS"

  Scenario: update an Item
    Given url baseUrl
    And path 'activities', activity_code, 'items', item
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    And request ItemBody
    When method Put
    Then status 200
    * match response.status == "SUCCESS"

  Scenario: Delete an Item
    Given url baseUrl
    And path 'activities', activity_code, 'items', item
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Delete
    Then status 200
    * match response.status == "SUCCESS"

  Scenario: Create an ItemLV
    Given url baseUrl
    And path 'activities', activity_code, 'items', item, 'lvs'
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    And request ItemLvBody
    When method Post
    Then status 201
    * match response.status == "WARN"

  Scenario: Get an ItemLV
    Given url baseUrl
    And path 'activities', activity_code, 'items', item, 'lvs', item_lv_code
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Get
    Then status 200
    * match response.status == "SUCCESS"

  Scenario: update an ItemLV
    Given url baseUrl
    And path 'activities', activity_code, 'items', item, 'lvs', item_lv_code
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    And request ItemLvBody
    When method Put
    Then status 200
    * match response.status == "SUCCESS"

  Scenario: Delete an ItemLV
    Given url baseUrl
    And path 'activities', activity_code, 'items', item, 'lvs', item_lv_code
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Delete
    Then status 200
    * match response.status == "SUCCESS"