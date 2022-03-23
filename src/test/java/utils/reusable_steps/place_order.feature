Feature: Place order

  Background: Preconditions
    * def req_place_order_for_pet = read('../request/place_order_for_pet.json')
    * def res_place_order_for_pet = read('../response/place_order_for_pet.json')
    * url environment.url

  Scenario: place an order for a pet
    * set req_place_order_for_pet.id = __arg.id
    * set req_place_order_for_pet.petId = __arg.petId
    * set req_place_order_for_pet.quantity = environment.flow.store.quantity
    * set req_place_order_for_pet.shipDate = environment.flow.store.shipDate
    * set req_place_order_for_pet.status = environment.flow.store.status
    * set req_place_order_for_pet.complete = environment.flow.store.complete
    Given path path_order
    And request req_place_order_for_pet
    When method POST
    Then status 200
    And match response == res_place_order_for_pet

