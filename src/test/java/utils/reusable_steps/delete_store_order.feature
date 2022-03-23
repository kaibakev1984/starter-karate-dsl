Feature: Delete order

  Background: Preconditions
    * def res_delete_purchase_order = read('../response/delete_purchase_order.json')
    * url environment.url

  Scenario: delete purchase order
    Given path path_order, __arg.id
    When method DELETE
    Then status 200
    And match response == res_delete_purchase_order
