@parallel=false
Feature: Create, get and delete basic data

  Background:
    * def originatorReference = "TA"
    * def consignee_code = "191219IB"
    * def supplier_code = "940659"

    * def auth = call read('classpath:nl/gall/reflex/helper/auth.feature')
    * def token = auth.token

    * def javaFormattedDate = Java.type('nl.gall.reflex.java.FormattedDate')
    * def timestamp = javaFormattedDate.getDate("yyyy-MM-dd'T'HH:mm:ss.SSS'+01:00'",0)

    # Supplier data
    * def SupplierBody = read('classpath:nl/gall/reflex/json/newSupplier.json')
    # get random HD type
    * def data = read('../csv/HD_Types.csv')
    * def random = function(max){ return Math.floor(Math.random() * max) + 1 }
    * def count = random(data.length - 1)
    * def random_hd_type = karate.jsonPath(data, "$.[" + count + "].HDTYPE")
    * SupplierBody.REFLEX.hd_type_list[0].hd_type_code = random_hd_type
    * SupplierBody.LEVE.timestamp = timestamp
    * SupplierBody.REFLEX.code = supplier_code

    # Consignee data
    * def ConsigneeBody = read('classpath:nl/gall/reflex/json/newConsignee.json')
    * ConsigneeBody.code = consignee_code

  Scenario: Create a Consignee
    Given url baseUrl
    And path 'gall-e-cosmos/v1/stores'
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    And request ConsigneeBody
    When method Post
    Then status 201
    * match response.status == "WARN"
    * match response.message.error_list[0].description == "The consignee is active"

  Scenario: Get a Consignee
    Given url baseUrl
    And path 'activities', activity_code, 'consignees', consignee_code
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Get
    Then status 200
    * match response.status == "SUCCESS"

  Scenario: Delete a Consignee
    Given url baseUrl
    And path 'activities', activity_code, 'consignees', consignee_code
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Delete
    Then status 200
    * match response.status == "SUCCESS"

  Scenario: Create a Supplier
    Given url baseUrl
    And path 'gall-e-cosmos/v1/suppliers'
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    And request SupplierBody
    When method Put
    Then status 202
    * match response.reflex.status == "WARN"
    * match response.reflex.message.error_list[0].description == "This supplier is active."
    * match response.step.message == "Successfully updated request in STEP"

  Scenario: Get a Supplier
    Given url baseUrl
    And path 'activities', activity_code, 'suppliers', supplier_code
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Get
    Then status 200
    * match response.status == "SUCCESS"

  Scenario: Delete a Supplier
    Given url baseUrl
    And path 'activities', activity_code, 'suppliers', supplier_code
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Delete
    Then status 200
    * match response.status == "SUCCESS"