Feature: Find purchase order

  Background: Preconditions
    * def res_find_purchase_order = read('../' + constants.find_order.response)
    * url environment.url

  Scenario: find purchase order
    Given path path_order, __arg.id
    When method GET
    Then status 200
    And match response == res_find_purchase_order
