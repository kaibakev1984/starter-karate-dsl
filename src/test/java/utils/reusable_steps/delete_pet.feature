Feature: Delete pet

  Background: Preconditions
    * def res_deletes_pet = read('../response/delete_pet.json')
    * url environment.url

  Scenario: Delete pet
    Given path path_pet, __arg.id
    When method DELETE
    Then status 200
    And match response == res_deletes_pet
