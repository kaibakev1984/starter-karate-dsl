Feature: Create pet

  Background: Preconditions
    * def req_create_pet = read('classpath:petstore/' + constants.create_pet.request)
    * def res_create_pet = read('classpath:petstore/' + constants.create_pet.response)
    Given url environment.url

  Scenario: Create pet
    * set req_create_pet
      | path          | value                             |
      | name          | __arg.name                        |
      | id            | environment.flow.pet.id           |
      | status        | environment.flow.pet.status       |
      | category.id   | environment.flow.pet.categoryId   |
      | category.name | environment.flow.pet.categoryName |
    * set res_create_pet
      | path          | value                             |
      | name          | __arg.name                        |
      | id            | environment.flow.pet.id           |
      | status        | environment.flow.pet.status       |
      | category.id   | environment.flow.pet.categoryId   |
      | category.name | environment.flow.pet.categoryName |
    Given path path_pet
    And request req_create_pet
    When method POST
    Then status 200
    And match response == res_create_pet
