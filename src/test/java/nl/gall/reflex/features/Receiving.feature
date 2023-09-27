@parallel=false
Feature: Create a despatch note and a carrier appointment and delete all after

  Background:
    # get data from files
    * def despatchNoteBody = read('classpath:nl/gall/reflex/json/newDespatchNote.json')
    * def carrierAppointmentBody = read('classpath:nl/gall/reflex/json/newCarrierAppointment.json')

    # set data for test
    * def auth = call read('classpath:nl/gall/reflex/helper/auth.feature')
    * def token = auth.token

    * def sender_code = 10059
    * def dn_number = "12345-1"
    * def receipt_type_code = "REC"
    * def line_reference = "12345-1"
    * def appointment_reference = "TESTAUTOMATIONREF1"
    * def appointment_designation = "TESTAUTOMATIONDES1"

    * def javaFormattedDate = Java.type('nl.gall.reflex.java.FormattedDate')
    * def planned_receipt_datetime = javaFormattedDate.getDate('yyyy-MM-dd\'T\'HH:mm:ss.\'000\'',24)
    * def planned_unloading_start_datetime = javaFormattedDate.getDate('yyyy-MM-dd\'T\'HH:mm:ss.\'000\'',24)
    * def planned_unloading_end_datetime = javaFormattedDate.getDate('yyyy-MM-dd\'T\'HH:mm:ss.\'000\'',25)

    # adjust json files
    * despatchNoteBody.dn_number = dn_number
    * despatchNoteBody.line_list[0].line_reference = line_reference
    * despatchNoteBody.planned_receipt_datetime = planned_receipt_datetime

    * carrierAppointmentBody.appointment_reference = appointment_reference
    * carrierAppointmentBody.appointment_designation = appointment_designation
    * carrierAppointmentBody.physical_receipt_list[0].physical_receipt_reference = line_reference
    * carrierAppointmentBody.planned_unloading_start_datetime = planned_unloading_start_datetime
    * carrierAppointmentBody.planned_unloading_end_datetime = planned_unloading_end_datetime

  Scenario: Create a despatch note
    Given url baseUrl
    And path 'activities', activity_code, 'physical_depots', physical_depot_code, 'sender_codes', sender_code, 'dn_numbers'
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    And   request despatchNoteBody
    When method Post
    Then status 201
    * match response.status == "SUCCESS"

  Scenario: Create a carrier appointment
    Given url baseUrl
    And path 'activities', activity_code, 'physical_depots', physical_depot_code, 'carrier_appointments'
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    And   request carrierAppointmentBody
    When method Post
    Then status 201
    * match response.status == "SUCCESS"

  Scenario: Delete a carrier appointment
    Given url baseUrl
    And path 'activities', activity_code, 'physical_depots', physical_depot_code, 'carrier_appointments', appointment_reference
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Delete
    Then status 200
    * match response.status == "SUCCESS"

  Scenario: Delete a despatch note
    Given url baseUrl
    And path 'activities', activity_code, 'physical_depots', physical_depot_code, 'sender_codes', sender_code, 'dn_numbers', dn_number, 'receipt_type_code', receipt_type_code
    And header Content-Type = 'application/json'
    And header Authorization = 'JWT ' + token
    When method Delete
    Then status 200
    * match response.status == "SUCCESS"

