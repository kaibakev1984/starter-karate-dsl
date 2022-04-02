Feature: Get pet

  Background: Preconditions
    * def res_get_pet = read('../' + constants.get_pet_by_id.response)
    * url environment.url

  Scenario: Get pet
    * set res_get_pet
      | path          | value                             |
      | name          | __arg.name                        |
      | id            | environment.flow.pet.id           |
      | status        | environment.flow.pet.status       |
      | category.id   | environment.flow.pet.categoryId   |
      | category.name | environment.flow.pet.categoryName |
    Given path path_pet, __arg.id
    When method GET
    Then status 200
    And match response == res_get_pet
