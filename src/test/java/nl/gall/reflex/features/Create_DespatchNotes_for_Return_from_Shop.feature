@parallel=false
Feature: Create despatch notes for shop returns

  Background:
    # get data from files
    * def despatchNoteBody = read('classpath:nl/gall/reflex/json/newDespatchNote_Return_from_Shop.json')
    * def RandomStringGenerator = Java.type('nl.gall.reflex.java.RandomStringGenerator')
    * def data1 = read('../csv/BierFris.csv')
    * def data2 = read('../csv/VolleDozen.csv')
    * def data3 = read('../csv/Slowmove.csv')
    * def data4 = read('../csv/LosseFlessen.csv')

    # set data for test
    * def random_string = RandomStringGenerator.generateRandomString(5)
    * def auth = call read('classpath:nl/gall/reflex/helper/auth.feature')
    * def token = auth.token
    * def dn_random = 'RET_' + random_string
    * def sender_code = "1137"
    * def receipt_type_code = despatchNoteBody.receipt_type_code
    * def dn_number = dn_random
    * despatchNoteBody.dn_number = dn_number
    * despatchNoteBody.delivery_reference = dn_number
    * despatchNoteBody.line_reference = dn_number

    # randomize items
    * def random = function(max){ return Math.floor(Math.random() * max) + 1 }
    * def random_BF = karate.jsonPath(data1, "$.[" + random(data1.length - 1) + "].BIERFRIS")
    * def random_VD = karate.jsonPath(data2, "$.[" + random(data2.length - 1) + "].VOLLEDOZEN")
    * def random_SM = karate.jsonPath(data3, "$.[" + random(data3.length - 1) + "].SLOWMOVE")
    * def random_LF = karate.jsonPath(data4, "$.[" + random(data4.length - 1) + "].LOSSEFLESSEN")
    * despatchNoteBody.line_list[0].item_code = random_BF
    * despatchNoteBody.line_list[1].item_code = random_VD
    * despatchNoteBody.line_list[2].item_code = random_SM
    * despatchNoteBody.line_list[3].item_code = random_LF

  Scenario: Create, get and delete a despatch note for return, using same randomizer
    Given url baseUrl
    And path  'activities', activity_code, 'physical_depots', physical_depot_code, 'sender_codes', sender_code, 'dn_numbers'
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    And request despatchNoteBody
    When method Post
    Then status 201
    * match response.status == "SUCCESS"
    Given url baseUrl
    And path  'activities', activity_code, 'physical_depots', physical_depot_code, 'sender_code', sender_code, 'dn_numbers', dn_number
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Get
    Then status 200
    * match response.status == "SUCCESS"
    Given url baseUrl
    And path 'activities', activity_code, 'physical_depots', physical_depot_code, 'sender_codes', sender_code, 'dn_numbers', dn_number, 'receipt_type_code', receipt_type_code
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Delete
    Then status 200
    * match response.status == "SUCCESS"
