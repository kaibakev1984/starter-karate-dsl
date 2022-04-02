function fn() {
    var constants = {};
    constants.create_pet = {
        request: 'request/create_pet.json',
        response: 'response/create_pet.json'
    }
    constants.get_pet_by_id = {
        response: 'response/get_pet_by_id.json'
    }
    constants.update_pet = {
        request: 'request/update_existing_pet.json',
        response: 'response/update_existing_pet.json'
    }
    constants.delete_pet = {
        response: 'response/delete_pet.json'
    }
    constants.place_order = {
        request: 'request/place_order_for_pet.json',
        response: 'response/place_order_for_pet.json',
    }
    constants.find_order = {
        response: 'response/find_purchase_order.json'
    }
    constants.delete_order = {
        response: 'response/delete_purchase_order.json'
    }
    constants.create_user = {
        request: 'request/create_user.json',
        response: 'response/create_user.json'
    }
    constants.get_user = {
        response: 'response/get_user_by_user_name.json'
    }
    constants.update_user = {
        request: 'request/updated_user.json',
        response: 'response/updated_user.json'
    }
    constants.delete_user = {
        response: 'response/delete_user.json'
    }
    return constants;
}