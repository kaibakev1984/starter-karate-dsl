@run
Feature: Store example

  Background: Preconditions
    * def place_order = read('classpath:utils/reusable_steps/place_order.feature')
    * def find_order = read('classpath:utils/reusable_steps/find_order.feature')
    * def delete_order = read('classpath:utils/reusable_steps/delete_store_order.feature')
    * def get_inventory = read('classpath:utils/reusable_steps/get_inventory.feature')
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  Scenario: place an order for a pet and get inventory
    * table place_order_input
      | id                        | petId                        |
      | environment.flow.store.id | environment.flow.store.petId |
    * def result = call place_order place_order_input

    * table find_order_input
      | id                        |
      | environment.flow.store.id |
    * def result = call find_order find_order_input

    * table delete_order_input
      | id                        |
      | environment.flow.store.id |
    * def result = call delete_order delete_order_input

    * def result = call get_inventory