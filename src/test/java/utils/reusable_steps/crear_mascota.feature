Feature: Crear mascota

  Background: Precondiciones
    * def req_create_pet = read('../' + constants.create_pet.request)
    * def res_create_pet = read('../' + constants.create_pet.response)
    Given url environment.url
    And header Content-Type = 'application/json'

  Scenario: Crear mascota
    # --- seteando valores a la request
    * set req_create_pet.id = __arg.id
    * set req_create_pet.name = __arg.name
    * set req_create_pet.status = __arg.status
    * set req_create_pet.category.id = 11
    * set req_create_pet.category.name = "perro negro"
    # --- seteando valores a la response esperada
    * set res_create_pet.id = __arg.id
    * set res_create_pet.name = __arg.name
    * set res_create_pet.status = __arg.status
    * set res_create_pet.category.id = 11
    * set res_create_pet.category.name = "perro negro"
    Given path path_pet
    And request req_create_pet
    When method POST
    Then status 200
    And match response == res_create_pet

