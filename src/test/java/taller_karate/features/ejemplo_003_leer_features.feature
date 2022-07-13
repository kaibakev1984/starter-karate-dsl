@run_reusable_steps
Feature: Ejemplo 003

  Background: Preconditions
    * def crear_mascota = read('classpath:utils/reusable_steps/crear_mascota.feature')
    # --- ejemplo flujo completo ---
    * def create_pet = read('classpath:utils/reusable_steps/create_pet.feature')
    * def get_pet = read('classpath:utils/reusable_steps/get_pet.feature')
    * def update_pet = read('classpath:utils/reusable_steps/update_pet.feature')
    * def delete_pet = read('classpath:utils/reusable_steps/delete_pet.feature')

  Scenario: llamar crear_mascota con un json como parametro
    * def parametros_crear_mascota =
    """
    {
      id: 10,
      name: "Kira",
      status: "sold"
    }
    """
    * call crear_mascota parametros_crear_mascota

  Scenario: llamar crear_mascota con una tabla como parametro
    * table parametros_crear_mascota
      | id | name    | status      |
      | 15 | "WallE" | "available" |
    * call crear_mascota parametros_crear_mascota

  Scenario: creacion, consulta, actualizacion y eliminacion de mascota usando steps reutilizables
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
      | environment.flow.pet.new_Name | environment.flow.pet.new_categoryname | environment.flow.pet.new_Status |
    * def result = call update_pet update_pet_input

    * table delete_pet_input
      | id                      |
      | environment.flow.pet.id |
    * def result = call delete_pet delete_pet_input