@run
Feature: Store example

  Background: Preconditions
    * def req_place_order_for_pet = read('../request/place_order_for_pet.json')
    * def res_place_order_for_pet = read('../response/place_order_for_pet.json')
    * def res_find_purchase_order = read('../response/find_purchase_order.json')
    * def res_delete_purchase_order = read('../response/delete_purchase_order.json')
    * url environment.url
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  Scenario: place an order for a pet
    * set req_place_order_for_pet.id = environment.flow.store.id
    * set req_place_order_for_pet.petId = environment.flow.store.petId
    * set req_place_order_for_pet.quantity = environment.flow.store.quantity
    * set req_place_order_for_pet.shipDate = environment.flow.store.shipDate
    * set req_place_order_for_pet.status = environment.flow.store.status
    * set req_place_order_for_pet.complete = environment.flow.store.complete
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