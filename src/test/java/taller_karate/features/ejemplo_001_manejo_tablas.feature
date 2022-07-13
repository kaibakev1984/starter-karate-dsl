@run_datatables
Feature: Ejemplo 001

  Background: Preconditions
    * def req_create_pet = read('../' + constants.create_pet.request)
    * def res_create_pet = read('../' + constants.create_pet.response)
    Given url environment.url
    And header Content-Type = 'application/json'

  Scenario: agregar nueva mascota seteando valores campo por campo
    # --- seteando valores a la request
    * set req_create_pet.id = 10
    * set req_create_pet.name = "Macedonio"
    * set req_create_pet.status = "sold"
    * set req_create_pet.category.id = 11
    * set req_create_pet.category.name = "perro negro"
    # --- seteando valores a la response esperada
    * set res_create_pet.id = 10
    * set res_create_pet.name = "Macedonio"
    * set res_create_pet.status = "sold"
    * set res_create_pet.category.id = 11
    * set res_create_pet.category.name = "perro negro"
    Given path path_pet
    And request req_create_pet
    When method POST
    Then status 200
    And match response == res_create_pet

  Scenario: agregar nueva mascota seteando valores mediante tablas
    # --- seteando valores a la request
    * set req_create_pet
      | path          | value         |
      | id            | 10            |
      | name          | "Macedonio"   |
      | status        | "sold"        |
      | category.id   | 11            |
      | category.name | "perro negro" |
    # --- seteando valores a la response esperada
    * set res_create_pet
      | path          | value         |
      | id            | 10            |
      | name          | "Macedonio"   |
      | status        | "sold"        |
      | category.id   | 11            |
      | category.name | "perro negro" |
    Given path path_pet
    And request req_create_pet
    When method POST
    Then status 200
    And match response == res_create_pet

    # TODO: Agregar ejemplo de replace con tablas