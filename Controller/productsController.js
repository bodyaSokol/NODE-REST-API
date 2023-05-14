'use strict'

const response = require('./../response');
const db = require('./../settings/db')

exports.getAllProducts = (req,res) =>{
    db.query('SELECT * FROM `products`',(error,rows,fields)=>{
        if(error){
            response.status(400,error, res);
        }else{
            response.status(200,rows, res);
        }
    })
}
exports.productsSearch = (req,res) =>{
    db.query("SELECT * FROM `products` WHERE `name` LIKE '%"+req.body.serachValue+"%'",(error,rows,fields)=>{
        if(error){
            response.status(400,error, res);
        }else{
            response.status(200,rows, res);
        }
    })
}