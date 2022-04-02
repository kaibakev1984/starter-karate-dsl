@run
Feature: Pet example
  Usage of multiple examples in scenarios outline

  Background: Preconditions
    * def req_create_pet = read('../' + constants.create_pet.request)
    * def res_create_pet = read('../' + constants.create_pet.response)
    * def res_get_pet = read('../' + constants.get_pet_by_id.response)
    * def req_update_pet = read('../' + constants.update_pet.request)
    * def res_update_pet = read('../' + constants.update_pet.response)
    * def res_deletes_pet = read('../' + constants.delete_pet.response)
    * url environment.url
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  Scenario Outline: add new pet to the store
    * set req_create_pet
      | path          | value            |
      | id            | <id>             |
      | name          | '<name>'         |
      | status        | '<status>'       |
      | category.id   | <categoryId>     |
      | category.name | '<categoryName>' |
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

    Examples: Pets in status available
      | id | categoryId | categoryName | name      | status    |
      | 1  | 1          | black        | Macedonio | available |
      | 2  | 2          | white        | Kira      | available |

    Examples: Pets in status pending
      | id | categoryId | categoryName | name     | status  |
      | 3  | 1          | black        | Raimunda | pending |
      | 4  | 2          | white        | Wallee   | pending |

    Examples: Pets in status sold
      | id | categoryId | categoryName | name   | status |
      | 5  | 1          | black        | Ranger | sold   |
      | 6  | 2          | white        | Pirata | sold   |

  Scenario Outline: find pet by ID
    * set res_get_pet
      | path          | value            |
      | id            | <id>             |
      | name          | '<name>'         |
      | status        | '<status>'       |
      | category.id   | <categoryId>     |
      | category.name | '<categoryName>' |
    Given path path_pet, <id>
    When method GET
    Then status 200
    And match response == res_get_pet

    Examples: Pets in status available
      | id | categoryId | categoryName | name      | status    |
      | 1  | 1          | black        | Macedonio | available |
      | 2  | 2          | white        | Kira      | available |

    Examples: Pets in status pending
      | id | categoryId | categoryName | name     | status  |
      | 3  | 1          | black        | Raimunda | pending |
      | 4  | 2          | white        | Wallee   | pending |

    Examples: Pets in status sold
      | id | categoryId | categoryName | name   | status |
      | 5  | 1          | black        | Ranger | sold   |
      | 6  | 2          | white        | Pirata | sold   |

  Scenario Outline: update an existing pet
    * set req_update_pet
      | path          | value               |
      | name          | '<newName>'         |
      | category.name | '<newCategoryName>' |
      | status        | '<newStatus>'       |
    * set res_update_pet
      | path          | value               |
      | name          | '<newName>'         |
      | status        | '<newStatus>'       |
      | category.name | '<newCategoryName>' |
    Given path path_pet
    And request req_update_pet
    When method PUT
    Then status 200
    And match response == res_update_pet

    Examples: Pets in status available
      | id | categoryId | categoryName | name      | status    | newName | newCategoryName | newStatus |
      | 1  | 1          | black        | Macedonio | available | Mc edOn | dark            | sold      |
      | 2  | 2          | white        | Kira      | available | KIRA    | light           | sold      |

    Examples: Pets in status pending
      | id | categoryId | categoryName | name     | status  | newName | newCategoryName | newStatus |
      | 3  | 1          | black        | Raimunda | pending | RaiMND  | dark            | available |
      | 4  | 2          | white        | Wallee   | pending | WALLY   | black           | sold      |

    Examples: Pets in status sold
      | id | categoryId | categoryName | name   | status | newName   | newCategoryName | newStatus |
      | 5  | 1          | black        | Ranger | sold   | RNGR      | light           | pending   |
      | 6  | 2          | white        | Pirata | sold   | PIRATEBAY | black           | available |