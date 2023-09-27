Feature: generate token for Reflex

  Background:
    * url 'https://reflex-tst.gall.nl/reflexWS/'

  Scenario: get auth token
    Given path 'JWTServlet'
    And param login = username
    And param password = credential
    When method get
    Then status 200
    And def token = response
    * print 'the value of token is:', token