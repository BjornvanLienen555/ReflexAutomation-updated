@parallel=false
Feature: Return an ecom preparation order

  Background:
    # get data from preparation order json
    * def preparationOrderBody = read('classpath:nl/gall/reflex/json/newPreparationOrder_Return_to_Supplier.json')
    * def RandomStringGenerator = Java.type('nl.gall.reflex.java.RandomStringGenerator')
    * def data1 = read('../csv/BierFris.csv')
    * def data2 = read('../csv/VolleDozen.csv')
    * def data3 = read('../csv/Slowmove.csv')
    * def data4 = read('../csv/LosseFlessen.csv')

    # set data for test
    * def random_string = RandomStringGenerator.generateRandomString(5)
    * def auth = call read('classpath:nl/gall/reflex/helper/auth.feature')
    * def token = auth.token
    * preparationOrderBody.originator_reference = "RET_" + random_string
    * def originator_reference = preparationOrderBody.originator_reference

    # randomize items
    * def random = function(max){ return Math.floor(Math.random() * max) + 1 }
    * def random_BF = karate.jsonPath(data1, "$.[" + random(data1.length - 1) + "].BIERFRIS")
    * def random_VD = karate.jsonPath(data2, "$.[" + random(data2.length - 1) + "].VOLLEDOZEN")
    * def random_SM = karate.jsonPath(data3, "$.[" + random(data3.length - 1) + "].SLOWMOVE")
    * def random_LF = karate.jsonPath(data4, "$.[" + random(data4.length - 1) + "].LOSSEFLESSEN")
    * preparationOrderBody.line_list[0].item_code = random_BF
    * preparationOrderBody.line_list[1].item_code = random_VD
    * preparationOrderBody.line_list[2].item_code = random_SM
    * preparationOrderBody.line_list[3].item_code = random_LF

  Scenario: Create a preparation order
    Given url baseUrl
    And path 'activities', activity_code, 'physical_depots', physical_depot_code, 'originators', originator, 'preparation_orders'
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    And request preparationOrderBody
    When method Post
    Then status 201
    * match response.status == "SUCCESS"
    Given url baseUrl
    And path 'activities', activity_code, 'physical_depots', physical_depot_code, 'originators', originator, 'preparations_orders', originator_reference
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Get
    Then status 200
    * match response.status == "SUCCESS"
    Given url baseUrl
    And path 'activities', activity_code, 'physical_depots', physical_depot_code, 'originators', originator, 'preparation_orders', originator_reference
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Delete
    Then status 200
    * match response.status == "SUCCESS"

