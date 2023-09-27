@parallel=false
Feature: Create preparation orders testdata for order pick performance test

  Background:
    # get data for test
    * def data1 = read('../csv/Consignees.csv')
    * def data2 = read('../csv/ItemsForPT.csv')
    * def preparationOrderBody = read('classpath:nl/gall/reflex/json/newPreparationOrder_PT.json')

    # set data for test
    * def auth = call read('classpath:nl/gall/reflex/helper/auth.feature')
    * def token = auth.token

    * def javaFormattedDate = Java.type('nl.gall.reflex.java.FormattedDate')
    * def start_datetime = javaFormattedDate.getDate('yyyy-MM-dd\'T\'HH:mm:ss.\'000\'',48)
    * def end_datetime = javaFormattedDate.getDate('yyyy-MM-dd\'T\'HH:mm:ss.\'000\'',49)
    * def loading_date = javaFormattedDate.getDate('yyyy-MM-dd',48)
    * def referenceDate = javaFormattedDate.getDate('',48)
    * def originatorReference = "TA" + referenceDate

    # randomize test data
    * def random = function(max){ return Math.floor(Math.random() * max) + 1 }
    * def random_consignee = karate.jsonPath(data1, "$.[" + random(data1.length - 1) + "].CONSIGNEES")
    * def random_item1 = karate.jsonPath(data2, "$.[" + random(data2.length - 1) + "].ITEMSFORPT")
    * def random_item2 = karate.jsonPath(data2, "$.[" + random(data2.length - 1) + "].ITEMSFORPT")
    * def random_item3 = karate.jsonPath(data2, "$.[" + random(data2.length - 1) + "].ITEMSFORPT")
    * def random_item4 = karate.jsonPath(data2, "$.[" + random(data2.length - 1) + "].ITEMSFORPT")
    * def random_item5 = karate.jsonPath(data2, "$.[" + random(data2.length - 1) + "].ITEMSFORPT")
    * def random_qty1 = random(10)
    * def random_qty2 = random(10)
    * def random_qty3 = random(10)
    * def random_qty4 = random(10)
    * def random_qty5 = random(10)

    # adjust data in json
    * preparationOrderBody.originator_reference = originatorReference
    * preparationOrderBody.preparation_type_code = "010"
    * preparationOrderBody.load_code = "TA0201"
    # adjust consignee
    * preparationOrderBody.end_consignee_code = random_consignee
    * preparationOrderBody.planned_final_delivery_start_datetime = start_datetime
    * preparationOrderBody.planned_final_delivery_end_datetime = end_datetime
    * preparationOrderBody.pick_sequence_code = "B2B_STORE"
    * preparationOrderBody.loading_date = loading_date
    * preparationOrderBody.optional_attributes.reason_code = "REG"
    * preparationOrderBody.optional_attributes.apt_with_end_consignee = "true"
    * preparationOrderBody.optional_attributes.end_consignee_apt_start_datetime = start_datetime
    * preparationOrderBody.optional_attributes.end_consignee_apt_end_datetime = end_datetime
    * preparationOrderBody.optional_attributes.apt_with_intermediate = "false"
    * preparationOrderBody.optional_attributes.load_grouping = "101"
    # adjust items
    * preparationOrderBody.line_list[0].item_code = random_item1
    * preparationOrderBody.line_list[0].input_order_data = "true"
    * preparationOrderBody.line_list[0].level_2_quantity_to_prepare = random_qty1
    * preparationOrderBody.line_list[0].level_2_quantity_ordered = random_qty1
    * preparationOrderBody.line_list[0].owner_code_ordered = "GAL"
    * preparationOrderBody.line_list[0].grade_code_ordered = "STD"
    * preparationOrderBody.line_list[1].item_code = random_item2
    * preparationOrderBody.line_list[1].input_order_data = "true"
    * preparationOrderBody.line_list[1].level_2_quantity_to_prepare = random_qty2
    * preparationOrderBody.line_list[1].level_2_quantity_ordered = random_qty2
    * preparationOrderBody.line_list[1].owner_code_ordered = "GAL"
    * preparationOrderBody.line_list[1].grade_code_ordered = "STD"
    * preparationOrderBody.line_list[2].item_code = random_item3
    * preparationOrderBody.line_list[2].input_order_data = "true"
    * preparationOrderBody.line_list[2].level_2_quantity_to_prepare = random_qty3
    * preparationOrderBody.line_list[2].level_2_quantity_ordered = random_qty3
    * preparationOrderBody.line_list[2].owner_code_ordered = "GAL"
    * preparationOrderBody.line_list[2].grade_code_ordered = "STD"
    * preparationOrderBody.line_list[3].item_code = random_item4
    * preparationOrderBody.line_list[3].input_order_data = "true"
    * preparationOrderBody.line_list[3].level_2_quantity_to_prepare = random_qty4
    * preparationOrderBody.line_list[3].level_2_quantity_ordered = random_qty4
    * preparationOrderBody.line_list[3].owner_code_ordered = "GAL"
    * preparationOrderBody.line_list[3].grade_code_ordered = "STD"
    * preparationOrderBody.line_list[4].item_code = random_item5
    * preparationOrderBody.line_list[4].input_order_data = "true"
    * preparationOrderBody.line_list[4].level_2_quantity_to_prepare = random_qty5
    * preparationOrderBody.line_list[4].level_2_quantity_ordered = random_qty5
    * preparationOrderBody.line_list[4].owner_code_ordered = "GAL"
    * preparationOrderBody.line_list[4].grade_code_ordered = "STD"
    * print "PREPARATION ORDER BODY", preparationOrderBody

  Scenario: Create a preparation order
    Given url baseUrl
    And path 'activities', activity_code, 'physical_depots', physical_depot_code, 'originators', originator, 'preparation_orders'
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    And   request preparationOrderBody
    When method Post
    Then status 201
    * match response.status == "SUCCESS"