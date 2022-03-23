Feature: User example

  Background: Preconditions
    * def req_create_user = read('../' + constants.create_user.request)
    * def res_create_user = read('../' + constants.create_user.response)
    * def res_get_user = read('../' + constants.get_user.response)
    * def req_updated_user = read('../' + constants.update_user.request)
    * def res_updated_user = read('../' + constants.update_user.response)
    * def res_delete_user = read('../' + constants.delete_user.response)
    * url environment.url
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  @run
  Scenario: create user
    * set req_create_user.id = environment.flow.user.id
    * set req_create_user.username = environment.flow.user.username
    * set req_create_user.firstName = environment.flow.user.firstName
    * set req_create_user.lastName = environment.flow.user.lastName
    * set req_create_user.email = environment.flow.user.email
    * set req_create_user.password = environment.flow.user.password
    * set req_create_user.phone = environment.flow.user.phone
    * set req_create_user.userStatus = environment.flow.user.userStatus
    Given path path_user
    And request req_create_user
    When method POST
    Then status 200
    And match response == res_create_user

  @run
  Scenario: get user by user name
    Given path path_user, environment.flow.user.username
    When method GET
    Then status 200
    And match response == res_get_user

  @run
  Scenario: updated user
    * set req_updated_user.id = environment.flow.user.new_id
    * set req_updated_user.username = environment.flow.user.new_username
    * set req_updated_user.firstName = environment.flow.user.new_firstName
    * set req_updated_user.lastName = environment.flow.user.new_lastName
    * set req_updated_user.email = environment.flow.user.new_email
    * set req_updated_user.password = environment.flow.user.new_password
    * set req_updated_user.phone = environment.flow.user.new_phone
    * set req_updated_user.userStatus = environment.flow.user.new_userStatus
    Given path path_user, environment.flow.user.username
    And request res_updated_user
    When method GET
    Then status 200
    And match response == res_updated_user

  Scenario: delete user
    Given path path_user, environment.flow.user.new_username
    When method DELETE
    Then status 200
    And match response == res_delete_user