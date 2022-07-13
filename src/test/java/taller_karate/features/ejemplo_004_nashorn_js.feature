Feature: Ejemplo 004

  Background: Precondiciones
    * header Content-Type = 'application/json'

  Scenario: obtener mensaje misterioso
    * def obtener_mensaje_misterioso = read('classpath:utils/obtener_mensaje_misterioso.js')
    * def mensaje_misterioso = obtener_mensaje_misterioso()
    * print mensaje_misterioso

  Scenario Outline: llamado de codigo javascript
    * def obtener_tipo_triangulo = read('classpath:utils/obtener_tipo_triangulo.js')
    * def resultado = obtener_tipo_triangulo(<lado1>, <lado2>, <lado3>)
    * match resultado == <resultadoEsperado>
    Examples:
      | lado1 | lado2 | lado3 | resultadoEsperado |
      | 2     | 2     | 2     | "equilatero"      |
      | 2     | 2     | 1     | "isosceles"       |
      | 1     | 2     | 3     | "escaleno"        |

  Scenario: crear una orden de compra de una mascota
    # --- leyendo archivo JS ---
    * def validarFormatoHora = read('classpath:utils/validar_formato_hora.js')
    # --- leyendo request/response de archivos JSON ---
    * def req_place_order_for_pet = read('../' + constants.place_order.request)
    * def res_place_order_for_pet = read('../' + constants.place_order.response)
    # --- seteando valores en request ---
    * set req_place_order_for_pet
      | path     | value                           |
      | id       | environment.flow.store.id       |
      | petId    | environment.flow.store.petId    |
      | quantity | environment.flow.store.quantity |
      | shipDate | environment.flow.store.shipDate |
      | status   | environment.flow.store.status   |
      | complete | environment.flow.store.complete |
    # --- seteando valores en response ---
    * set res_place_order_for_pet
      | path     | value                            |
      | id       | environment.flow.store.id        |
      | petId    | environment.flow.store.petId     |
      | quantity | environment.flow.store.quantity  |
      | status   | environment.flow.store.status    |
      | complete | environment.flow.store.complete  |
      | shipDate | "#string? validarFormatoHora(_)" |
    Given url environment.url
    And path path_order
    And request req_place_order_for_pet
    When method POST
    Then status 200
    And match response == res_place_order_for_pet