@run_csv
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

  Scenario Outline: agregar nueva mascota mediante un scenario outline
    # --- seteando valores a la request
    * set req_create_pet
      | path          | value          |
      | id            | <id>           |
      | name          | <name>         |
      | status        | <status>       |
      | category.id   | <categoryId>   |
      | category.name | <categoryName> |
    # --- seteando valores a la response esperada
    * set res_create_pet
      | path          | value          |
      | id            | <id>           |
      | name          | <name>         |
      | status        | <status>       |
      | category.id   | <categoryId>   |
      | category.name | <categoryName> |
    Given path path_pet
    And request req_create_pet
    When method POST
    Then status 200
    And match response == res_create_pet
    Examples:
      | id | name        | status | categoryId | categoryName    |
      | 10 | "Macedonio" | "sold" | 11         | "perro negro"   |
      | 11 | "WallE"     | "sold" | 12         | "perro trucho"  |
      | 25 | "Pepo"      | "sold" | 14         | "gato gordo"    |
      | 23 | "Furiosa"   | "sold" | 39         | "gata agresiva" |

  Scenario Outline: agregar nueva mascota mediante un archivo CSV
    # --- seteando valores a la request
    * set req_create_pet
      | path          | value            |
      | id            | <id>             |
      | name          | '<name>'         |
      | status        | '<status>'       |
      | category.id   | <categoryId>     |
      | category.name | '<categoryName>' |
    # --- seteando valores a la response esperada
    * set res_create_pet
      | path          | value            |
      | id            | <id>             |
      | name          | '<name>'         |
      | status        | '<status>'       |
      | category.id   | <categoryId>     |
      | category.name | '<categoryName>' |
    Given path path_pet
    And request req_create_pet
    When method POST
    Then status 200
    And match response == res_create_pet
    Examples:
      | read('classpath:data/mascotas.csv') |
