@parallel=false
Feature: Create despatch notes for performance test

  Background:
    # get data from files
    * def data = read('../csv/ItemsForPT.csv')
    * def despatchNoteBody = read('classpath:nl/gall/reflex/json/newDespatchNote_PT.json')

    # set data for test
    * def auth = call read('classpath:nl/gall/reflex/helper/auth.feature')
    * def token = auth.token
    * def activity_code = activity_code
    * def physical_depot_code = physical_depot_code
    * def sender_code = 10059
    * def receipt_type_code = "REC"
    * def appointment_reference = "PERFORMANCETEST1"
    * def appointment_designation = "PERFORMANCETEST1"

    * def javaFormattedDate = Java.type('nl.gall.reflex.java.FormattedDate')
    * def start_datetime = javaFormattedDate.getDate('yyyy-MM-dd\'T\'HH:mm:ss.\'000\'',48)
    * def referenceDate = javaFormattedDate.getDate('',0)
    * def line_reference = referenceDate
    * def dn_number = referenceDate

    # get random items from csv plus random quantity
    * def random = function(max){ return Math.floor(Math.random() * max) + 1 }
    * def random_item1 = karate.jsonPath(data, "$.[" + random(data.length - 1) + "].ITEMSFORPT")
    * def random_item2 = karate.jsonPath(data, "$.[" + random(data.length - 1) + "].ITEMSFORPT")
    * def random_item3 = karate.jsonPath(data, "$.[" + random(data.length - 1) + "].ITEMSFORPT")
    * def random_item4 = karate.jsonPath(data, "$.[" + random(data.length - 1) + "].ITEMSFORPT")
    * def random_qty1 = random(10)
    * def random_qty2 = random(10)
    * def random_qty3 = random(10)
    * def random_qty4 = random(10)

    # adjusting the json file
    * despatchNoteBody.dn_number = dn_number
    * despatchNoteBody.planned_receipt_datetime = javaFormattedDate.getDate('yyyy-MM-dd\'T\'HH:mm:ss.\'000\'',24)

    * despatchNoteBody.line_list[0].line_reference = line_reference
    * despatchNoteBody.line_list[0].item_code = random_item1
    * despatchNoteBody.line_list[0].level_2_quantity = random_qty1
    * despatchNoteBody.line_list[0].additional_data_value_list[0].additional_data_item_value = random_qty1
    * despatchNoteBody.line_list[1].line_reference = line_reference
    * despatchNoteBody.line_list[1].item_code = random_item2
    * despatchNoteBody.line_list[1].level_2_quantity = random_qty2
    * despatchNoteBody.line_list[1].additional_data_value_list[0].additional_data_item_value = random_qty2
    * despatchNoteBody.line_list[2].line_reference = line_reference
    * despatchNoteBody.line_list[2].item_code = random_item3
    * despatchNoteBody.line_list[2].level_2_quantity = random_qty3
    * despatchNoteBody.line_list[2].additional_data_value_list[0].additional_data_item_value = random_qty3
    * despatchNoteBody.line_list[3].line_reference = line_reference
    * despatchNoteBody.line_list[3].item_code = random_item4
    * despatchNoteBody.line_list[3].level_2_quantity = random_qty4
    * despatchNoteBody.line_list[3].additional_data_value_list[0].additional_data_item_value = random_qty4

  Scenario: Create a despatch note
    Given url baseUrl
    And path 'activities', activity_code, 'physical_depots', physical_depot_code, 'sender_codes', sender_code, 'dn_numbers'
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    And   request despatchNoteBody
    When method Post
    Then status 201
    * match response.status == "SUCCESS"
