@run
Feature: Pet example

  Background: Preconditions
    * def create_pet = read('classpath:utils/reusable_steps/create_pet.feature')
    * def get_pet = read('classpath:utils/reusable_steps/get_pet.feature')
    * def update_pet = read('classpath:utils/reusable_steps/update_pet.feature')
    * def delete_pet = read('classpath:utils/reusable_steps/delete_pet.feature')
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  Scenario: create and delete pet
    * table create_pet_input
      | name                      |
      | environment.flow.pet.name |
    * def result = call create_pet create_pet_input

    * table get_pet_input
      | id                      |
      | environment.flow.pet.id |
    * def result = call get_pet get_pet_input

    * table update_pet_input
      | name                          | categoryName                          | status                          |
      | environment.flow.pet.new_Name | environment.flow.pet.new_CategoryName | environment.flow.pet.new_Status |
    * def result = call update_pet update_pet_input

    * table delete_pet_input
      | id                      |
      | environment.flow.pet.id |
    * def result = call delete_pet delete_pet_input