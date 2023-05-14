'use strict'

const response = require('./../response');
const db = require('./../settings/db')

exports.getAllCategories = (req,res) =>{
    
    db.query('SELECT * FROM `categories`',(error,rows,fields)=>{
        if(error){
            response.status(400,error, res);
        }else{
            response.status(200,rows, res);
        }
    })
}
//req.params.userId
exports.getCategoryProducts = (req,res) =>{
    
    db.query("SELECT * FROM `products` WHERE `category_id`='"+req.params.id+"'",(error,rows,fields)=>{
        if(error){
            response.status(400,error, res);
        }else{
            response.status(200,rows, res);
        }
    })
}