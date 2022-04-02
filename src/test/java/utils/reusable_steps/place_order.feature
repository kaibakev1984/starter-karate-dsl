Feature: Place order

  Background: Preconditions
    * def req_place_order_for_pet = read('../' + constants.place_order.request)
    * def res_place_order_for_pet = read('../' + constants.place_order.response)
    * url environment.url

  Scenario: place an order for a pet
    * set req_place_order_for_pet
      | path     | value                           |
      | id       | __arg.id                        |
      | petId    | __arg.petId                     |
      | quantity | environment.flow.store.quantity |
      | shipDate | environment.flow.store.shipDate |
      | status   | environment.flow.store.status   |
      | complete | environment.flow.store.complete |
    * set res_place_order_for_pet
      | path     | value                           |
      | id       | __arg.id                        |
      | petId    | __arg.petId                     |
      | quantity | environment.flow.store.quantity |
      | status   | environment.flow.store.status   |
      | complete | environment.flow.store.complete |
    Given path path_order
    And request req_place_order_for_pet
    When method POST
    Then status 200
    And match response == res_place_order_for_pet

