@run
Feature: Store example

  Background: Preconditions
    * def req_place_order_for_pet = read('../' + constants.place_order.request)
    * def res_place_order_for_pet = read('../' + constants.place_order.response)
    * def res_find_purchase_order = read('../' + constants.find_order.response)
    * def res_delete_purchase_order = read('../' + constants.delete_order.response)
    * url environment.url
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  Scenario: place an order for a pet
    * set req_place_order_for_pet
      | path     | value                           |
      | id       | environment.flow.store.id       |
      | petId    | environment.flow.store.petId    |
      | quantity | environment.flow.store.quantity |
      | shipDate | environment.flow.store.shipDate |
      | status   | environment.flow.store.status   |
      | complete | environment.flow.store.complete |
    * set res_place_order_for_pet
      | path     | value                           |
      | id       | environment.flow.store.id       |
      | petId    | environment.flow.store.petId    |
      | quantity | environment.flow.store.quantity |
      | status   | environment.flow.store.status   |
      | complete | environment.flow.store.complete |
    Given path path_order
    And request req_place_order_for_pet
    When method POST
    Then status 200
    And match response == res_place_order_for_pet

  Scenario: find purchase order by ID
    Given path path_order, environment.flow.store.id
    When method GET
    Then status 200
    And match response == res_find_purchase_order

  Scenario: delete purchase order by ID
    Given path path_order, environment.flow.store.id
    When method DELETE
    Then status 200
    And match response == res_delete_purchase_order

  Scenario: returns pet inventories by status
    Given path path_inventory
    When method GET
    Then status 200