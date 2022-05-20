Feature: Ejercio PEI

  @debug
  Scenario: Crear mascota
    Given url 'https://petstore.swagger.io/v2/pet'
    * def req_crear_mascota = read('../request/crear_mascota.json')
    * def res_crear_mascota = read('../response/crear_mascota.json')
    And request req_crear_mascota
    When method POST
    Then status 200
    And match response == res_crear_mascota

  Scenario Outline: Crear mascota Outline
    Given url 'https://petstore.swagger.io/v2/pet'
    * def req_crear_mascota = read('../request/crear_mascota.json')
    * def res_crear_mascota = read('../response/crear_mascota.json')
    * set req_crear_mascota.id = <id>
    And request req_crear_mascota
    When method POST
    Then status 200
    And match response == res_crear_mascota
    And match response.id == <id_esperado>
    Examples:
      | id | id_esperado |
      | 12 | 12          |
      | 13 | 13          |
      | 14 | 14          |