function fn() {
   var environment = {
        url: 'https://petstore.swagger.io'
   };
    environment.flow = {
        pet: {
            id: 10,
            categoryId: 10,
            categoryName: 'black',
            name: 'Macedonio',
            status: 'sold',
            new_categoryname: 'darkness',
            new_name: 'Raimunda',
            new_status: 'available'
        },
        store: {
            id: 10,
            petId: 10,
            quantity: 5,
            shipDate: '2022-02-22T22:53:15.160Z',
            status: 'placed',
            complete: false
        },
        user: {
            id: 10,
            username: 'kmitnick',
            firstName: 'kevin',
            lstName: 'mitnick',
            email: 'kmitnick@security.com',
            password: '123456',
            phone: '1122334455',
            userStatus: 1,
            new_id: 11,
            new_username: 'ibmlord',
            new_firstname: 'bizzz',
            new_lastname: 'ibmm',
            new_email: 'bizzz@icbc.ccc',
            new_password: 'sinbizdisponible',
            new_phone: '2233115533',
            new_userStatus: 2
        }
    }
   return environment;
}