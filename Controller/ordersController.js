'use strict'

const response = require('./../response');
const db = require('./../settings/db');

exports.create = (req,res) =>{
    const telegram_id=req.body.telegram_id;
    const bonuces_used=req.body.bonuces_used;
    const delivery_address=req.body.delivery_address;
    const sql_create_order = "INSERT INTO `orders` (`telegram_id`, `bonuces_used`, `delivery_address`) VALUES ('"+telegram_id+"', '"+bonuces_used+"', '"+delivery_address+"')";
    db.query(sql_create_order,(error,rows,fields)=>{
        if(error){
            response.status(400,error, res);
        }else{
            const order_id=rows.insertId;
            const products = req.body.products;
            let done = [];
            let errors_list = [];
            products.forEach(element => {
                const product_id=element.id;
                const product_amount=element.amount;
                const product_price=element.price;
                const product_discount=element.discount;
                const sql_create_order_composition = "INSERT INTO `orders_composition` (`order_id`, `product_id`, `amount`,`price`,`discount`) VALUES ('"+order_id+"', '"+product_id+"', '"+product_amount+"', '"+product_price+"', '"+product_discount+"')";
                db.query(sql_create_order_composition,(error,rows)=>{
                    if(error){
                        console.log(error);
                    }else{
                        console.log(rows);
                    }
                })
            });
            response.status(200,{id:order_id}, res);
        }
    })
}