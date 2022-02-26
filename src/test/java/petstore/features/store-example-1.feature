Feature: Store example

  Background: Preconditions
    * def req_place_order_for_pet = read('../request/place_order_for_pet.json')
    * def res_place_order_for_pet = read('../response/place_order_for_pet.json')
    * def res_find_purchase_order = read('../response/find_purchase_order.json')
    * def res_delete_purchase_order = read('../response/delete_purchase_order.json')
    * url 'https://petstore.swagger.io/v2'
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  Scenario: place an order for a pet
    * set req_place_order_for_pet.id = 10
    * set req_place_order_for_pet.petId = 10
    * set req_place_order_for_pet.quantity = 5
    * set req_place_order_for_pet.shipDate = '2022-02-22T22:53:15.160Z'
    * set req_place_order_for_pet.status = 'placed'
    * set req_place_order_for_pet.complete = false
    Given path 'store', 'order'
    And request req_place_order_for_pet
    When method POST
    Then status 200
    And match response == res_place_order_for_pet

  Scenario: find purchase order by ID
    Given path 'store', 'order', 10
    When method GET
    Then status 200
    And match response == res_find_purchase_order

  Scenario: delete purchase order by ID
    Given path 'store', 'order', 10
    When method DELETE
    Then status 200
    And match response == res_delete_purchase_order

  Scenario: returns pet inventories by status
    Given path 'store', 'inventory'
    When method GET
    Then status 200
