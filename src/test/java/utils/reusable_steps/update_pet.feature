Feature: Update pet

  Background: Preconditions
    * def req_update_pet = read('../' + constants.update_pet.request)
    * def res_update_pet = read('../' + constants.update_pet.response)
    Given url environment.url

  Scenario: Update pet
    * set req_update_pet
      | path          | value              |
      | name          | __arg.name         |
      | status        | __arg.status       |
      | category.name | __arg.categoryName |
    * set res_update_pet
      | path          | value              |
      | name          | __arg.name         |
      | status        | __arg.status       |
      | category.name | __arg.categoryName |
    Given path path_pet
    And request req_update_pet
    When method PUT
    Then status 200
    And match response == res_update_pet