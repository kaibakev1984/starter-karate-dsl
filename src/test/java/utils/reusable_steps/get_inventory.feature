Feature: Get inventory

  Background: Preconditions
    * url environment.url

  Scenario: get inventory
    Given path path_inventory
    When method GET
    Then status 200