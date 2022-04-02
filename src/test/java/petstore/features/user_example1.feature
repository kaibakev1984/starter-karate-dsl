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
    * set req_create_user
      | path       | value                            |
      | id         | environment.flow.user.id         |
      | username   | environment.flow.user.username   |
      | firstName  | environment.flow.user.firstName  |
      | lastName   | environment.flow.user.lastName   |
      | email      | environment.flow.user.email      |
      | password   | environment.flow.user.password   |
      | phone      | environment.flow.user.phone      |
      | userStatus | environment.flow.user.userStatus |
    Given path path_user
    And request req_create_user
    When method POST
    Then status 200
    And match response == res_create_user

  @run
  Scenario: get user by user name
    * set res_get_user
      | path       | value                            |
      | id         | environment.flow.user.id         |
      | username   | environment.flow.user.username   |
      | firstName  | environment.flow.user.firstName  |
      | lastName   | environment.flow.user.lastName   |
      | email      | environment.flow.user.email      |
      | password   | environment.flow.user.password   |
      | phone      | environment.flow.user.phone      |
      | userStatus | environment.flow.user.userStatus |
    Given path path_user, environment.flow.user.username
    When method GET
    Then status 200
    And match response == res_get_user

  @run
  Scenario: updated user
    * set req_updated_user
      | path       | value                                |
      | id         | environment.flow.user.new_id         |
      | username   | environment.flow.user.new_username   |
      | firstName  | environment.flow.user.new_firstName  |
      | lastName   | environment.flow.user.new_lastName   |
      | email      | environment.flow.user.new_email      |
      | password   | environment.flow.user.new_password   |
      | phone      | environment.flow.user.new_phone      |
      | userStatus | environment.flow.user.new_userStatus |
    Given path path_user, environment.flow.user.username
    And request req_updated_user
    When method PUT
    Then status 200
    And match response == res_updated_user

  Scenario: delete user
    Given path path_user, environment.flow.user.new_username
    When method DELETE
    Then status 200
    And match response == res_delete_user
