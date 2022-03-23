Feature: Update pet

  Background: Preconditions
    * def req_update_pet = read('../' + constants.update_pet.request)
    * url environment.url

  Scenario: Update pet
    * set req_update_pet.name = __arg.name
    * set req_update_pet.category.name = __arg.categoryName
    * set req_update_pet.status = __arg.status
    Given path path_pet
    And request req_update_pet
    When method PUT
    Then status 200
