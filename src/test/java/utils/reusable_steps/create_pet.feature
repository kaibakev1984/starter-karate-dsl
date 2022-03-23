Feature: Create pet

  Background: Preconditions
    * def req_create_pet = read('classpath:petstore/' + constants.create_pet.request)
    * def res_create_pet = read('classpath:petstore/' + constants.create_pet.response)
    * url environment.url

  Scenario: Create pet
    * set req_create_pet.name = __arg.name
    * set req_create_pet.id = environment.flow.pet.id
    * set req_create_pet.category.id = environment.flow.pet.categoryId
    * set req_create_pet.category.name = environment.flow.pet.categoryName
    * set req_create_pet.status = environment.flow.pet.status
    Given path path_pet
    And request req_create_pet
    When method POST
    Then status 200
    And match response == res_create_pet
