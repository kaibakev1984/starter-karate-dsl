@run
Feature: Pet example

  Background: Preconditions
    * def req_create_pet = read('../' + constants.create_pet.request)
    * def res_create_pet = read('../' + constants.create_pet.response)
    * def res_get_pet = read('../' + constants.get_pet_by_id.response)
    * def req_update_pet = read('../' + constants.update_pet.request)
    * def res_update_pet = read('../' + constants.update_pet.response)
    * def res_deletes_pet = read('../' + constants.delete_pet.response)
    * url environment.url
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  Scenario: add new pet to the store
    * set req_create_pet
      | path          | value                             |
      | id            | environment.flow.pet.id           |
      | name          | environment.flow.pet.name         |
      | status        | environment.flow.pet.status       |
      | category.id   | environment.flow.pet.categoryId   |
      | category.name | environment.flow.pet.categoryName |
    * set res_create_pet
      | path          | value                             |
      | id            | environment.flow.pet.id           |
      | name          | environment.flow.pet.name         |
      | status        | environment.flow.pet.status       |
      | category.id   | environment.flow.pet.categoryId   |
      | category.name | environment.flow.pet.categoryName |
    Given path path_pet
    And request req_create_pet
    When method POST
    Then status 200
    And match response == res_create_pet

  Scenario: find pet by ID
    * set res_get_pet
      | path          | value                             |
      | id            | environment.flow.pet.id           |
      | name          | environment.flow.pet.name         |
      | status        | environment.flow.pet.status       |
      | category.id   | environment.flow.pet.categoryId   |
      | category.name | environment.flow.pet.categoryName |
    Given path path_pet, environment.flow.pet.id
    When method GET
    Then status 200
    And match response == res_get_pet

  Scenario: update an existing pet
    * set req_update_pet
      | path          | value                                 |
      | name          | environment.flow.pet.new_Name         |
      | status        | environment.flow.pet.new_Status       |
      | category.name | environment.flow.pet.new_CategoryName |
    * set res_update_pet
      | path          | value                                 |
      | name          | environment.flow.pet.new_Name         |
      | status        | environment.flow.pet.new_Status       |
      | category.name | environment.flow.pet.new_CategoryName |
    Given path path_pet
    And request req_update_pet
    When method PUT
    Then status 200
    And match response == res_update_pet

  Scenario: deletes a pet
    Given path path_pet, environment.flow.pet.id
    When method DELETE
    Then status 200
    And match response == res_deletes_pet