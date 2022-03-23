Feature: Get pet

  Background: Preconditions
    * def res_get_pet = read('../' + constants.get_pet_by_id.response)
    * url environment.url

  Scenario: Get pet
    Given path path_pet, __arg.id
    When method GET
    Then status 200
    And match response == res_get_pet
