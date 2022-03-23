@run
Feature: Pet example

  Background: Preconditions
    * def req_create_pet = read('../request/create_pet.json')
    * def res_create_pet = read('../response/create_pet.json')
    * def res_get_pet = read('../response/get_pet_by_id.json')
    * def req_update_pet = read('../request/update_existing_pet.json')
    * def res_deletes_pet = read('../response/delete_pet.json')
    * url environment.url
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  Scenario: add new pet to the store
    * set req_create_pet.id = environment.flow.pet.id
    * set req_create_pet.category.id = environment.flow.pet.categoryId
    * set req_create_pet.category.name = environment.flow.pet.categoryName
    * set req_create_pet.name = environment.flow.pet.name
    * set req_create_pet.status = environment.flow.pet.status
    Given path path_pet
    And request req_create_pet
    When method POST
    Then status 200
    And match response == res_create_pet

  Scenario: find pet by ID
    Given path path_pet, environment.flow.pet.id
    When method GET
    Then status 200
    And match response == res_get_pet

  Scenario: update an existing pet
    * set req_update_pet.category.name = environment.flow.pet.new_CategoryName
    * set req_update_pet.name = environment.flow.pet.new_Name
    * set req_update_pet.status = environment.flow.pet.new_Status
    Given path path_pet
    And request req_update_pet
    When method PUT
    Then status 200

  Scenario: deletes a pet
    Given path path_pet, environment.flow.pet.id
    When method DELETE
    Then status 200
    And match response == res_deletes_pet