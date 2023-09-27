@parallel=false
Feature: Create a load for performance testdata generation

  Background:
    * def auth = call read('classpath:nl/gall/reflex/helper/auth.feature')
    * def token = auth.token
    * def originatorReference = "TA0201"
    * def load_code = "TA0201"

    * def javaFormattedDate = Java.type('nl.gall.reflex.java.FormattedDate')
    * def loading_date = javaFormattedDate.getDate('yyyy-MM-dd',48)
    * def planned_loading_datetime = javaFormattedDate.getDate('yyyy-MM-dd\'T\'HH:mm:ss.\'000\'',48)

    # fill load json post data
    * def loadBody = read('classpath:nl/gall/reflex/json/newLoad.json')
    * loadBody.loading_date = loading_date
    * loadBody.planned_loading_datetime = planned_loading_datetime
    * loadBody.load_code = load_code
    # randomly choose a dock (DOCK.497 to DOCK.517)
    * def data = read('../csv/Dock.csv')
    * def random = function(max){ return Math.floor(Math.random() * max) + 1 }
    * def count = random(data.length - 1)
    * print 'COUNT: ', count
    * def random_dock_code = karate.jsonPath(data, "$.[" + count + "].DOCKCODE")
    * loadBody.dock_code_1 = "DOCK"
    * loadBody.dock_code_2 = "."
    * loadBody.dock_code_3 = random_dock_code
    #* loadBody.preparation_order_association_list[0].preparation_order_originator_reference = originatorReference

  Scenario: Create load
    Given url baseUrl
    And path 'physical_depots', physical_depot_code, 'loads'
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    And   request loadBody
    When method Post
    Then status 201
    * match response.status == "SUCCESS"

