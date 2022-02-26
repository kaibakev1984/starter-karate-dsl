Feature: Pet example

  Background: Preconditions
    * def req_create_pet = read('../request/create_pet.json')
    * def res_create_pet = read('../response/create_pet.json')
    * def res_get_pet = read('../response/get_pet_by_id.json')
    * def req_update_pet = read('../request/update_existing_pet.json')
    * def res_deletes_pet = read('../response/delete_pet.json')
    Given url 'https://petstore.swagger.io/v2'
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  Scenario: add new pet to the store
    * set req_create_pet.id = 10
    * set req_create_pet.category.id = 10
    * set req_create_pet.category.name = 'black'
    * set req_create_pet.name = 'Macedonio'
    * set req_create_pet.status = 'sold'
    Given path 'pet'
    And request req_create_pet
    When method POST
    Then status 200
    And match response == res_create_pet

  Scenario: find pet by ID
    Given path 'pet', 10
    When method GET
    Then status 200
    And match response == res_get_pet

  Scenario: update an existing pet
    * set req_update_pet.category.name = 'darkness'
    * set req_update_pet.name = 'Raimunda'
    * set req_update_pet.status = 'sold'
    Given path 'pet'
    And request req_update_pet
    When method PUT
    Then status 200

  Scenario: deletes a pet
    Given path 'pet', 10
    When method DELETE
    Then status 200
    And match response == res_deletes_pet