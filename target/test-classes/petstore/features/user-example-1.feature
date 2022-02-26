Feature: User example

  Background: Preconditions
    * def req_create_user = read('../request/create_user.json')
    * def res_create_user = read('../response/create_user.json')
    * def res_get_user = read('../response/get_user_by_user_name.json')
    * def req_updated_user = read('../request/updated_user.json')
    * def res_updated_user = read('../response/updated_user.json')
    * def res_delete_user = read('../response/delete_user.json')
    Given url 'https://petstore.swagger.io/v2'
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  Scenario: create user
    * set req_create_user.id = 10
    * set req_create_user.username = 'kmitnick'
    * set req_create_user.firstName = 'kevin'
    * set req_create_user.lastName = 'mitnick'
    * set req_create_user.email = 'kmitnick@security.com'
    * set req_create_user.password = 'outbreak'
    * set req_create_user.phone = '1111111111'
    * set req_create_user.userStatus = 1
    Given path 'user'
    And request req_create_user
    When method POST
    Then status 200
    And match response == res_create_user

  Scenario: get user by user name
    Given path 'user', 'kmitnick'
    When method GET
    Then status 200
    And match response == res_get_user

  Scenario: updated user
    * set req_updated_user.id = 10
    * set req_updated_user.username = 'ibmuser'
    * set req_updated_user.firstName = 'biz'
    * set req_updated_user.lastName = 'ibm'
    * set req_updated_user.email = 'biz@ibm.com'
    * set req_updated_user.password = 'sinbizdisponible'
    * set req_updated_user.phone = '11223344'
    * set req_updated_user.userStatus = 2
    Given path 'user', 'kmitnick'
    And request res_updated_user
    When method GET
    Then status 200
    And match response == res_updated_user

  Scenario: delete user
    Given path 'user', 'kmitnick'
    When method DELETE
    Then status 200
    And match response == res_delete_user