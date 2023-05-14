'use strict'

module.exports = (app) =>{
    const usersController = require("./../Controller/usersController");//загружаем индекс контроллер
    const categoriesController = require("./../Controller/categoriesController");
    const productsController = require("./../Controller/productsController");
    const ordersController = require("./../Controller/ordersController");

    app.route('/api/orders/create').post(ordersController.create);//устанавливаем роут
    app.route('/api/searchProducts').post(productsController.productsSearch);//устанавливаем роут
    app.route('/api/allProducts').get(productsController.getAllProducts);//устанавливаем роут
    app.route('/api/category/:id').get(categoriesController.getCategoryProducts);//устанавливаем роут
    app.route('/api/category').get(categoriesController.getAllCategories);//устанавливаем роут
    app.route('/api/users/phone/check').post(usersController.checkPhone);//устанавливаем роут
    app.route('/api/users/phone/set').post(usersController.setPhone);//устанавливаем роут
    app.route('/api/users').get(usersController.getAllUsers);//устанавливаем роут
    app.route('/api/users/:id').get(usersController.getUser);//устанавливаем роут
    app.route('/api/users/create').post(usersController.create);//устанавливаем роут
}