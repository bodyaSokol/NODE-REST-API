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
            let final_sum = 0;
            products.forEach(element => {
                const product_id=element.id;
                const product_amount=element.productCount;
                const product_price=element.price;
                const product_discount=element.discount;
                final_sum = final_sum + ((product_price-product_discount)*product_amount);
                const sql_create_order_composition = "INSERT INTO `orders_composition` (`order_id`, `product_id`, `amount`,`price`,`discount`) VALUES ('"+order_id+"', '"+product_id+"', '"+product_amount+"', '"+product_price+"', '"+product_discount+"')";
                db.query(sql_create_order_composition,(error,rows)=>{
                    if(error){
                        console.log(error);
                    }else{
                        console.log(rows);
                    }
                })
            });
            let bonuces_percent;
            if(final_sum<2000){bonuces_percent=1}
            else if(final_sum<3000){bonuces_percent=2}
            else if(final_sum<4000){bonuces_percent=3}
            else if(final_sum<5000){bonuces_percent=4}
            else if(final_sum>=5000){bonuces_percent=5}
            let bonuses_accrued = Math.ceil(final_sum * (bonuces_percent * 0.01));
            db.query("SELECT `bonuces_amount` FROM `users` WHERE `telegram_id`='"+telegram_id+"'",(error,rows,fields)=>{
                if(error){
                    console.log(error);
                }else{
                    let actual_bonuces_amount = rows[0].bonuces_amount;
                    actual_bonuces_amount = Math.ceil(actual_bonuces_amount - bonuces_used + bonuses_accrued);
                    db.query("UPDATE `users` SET `bonuces_amount`='"+actual_bonuces_amount+"' WHERE `telegram_id`='"+telegram_id+"'",(error,rows,fields)=>{
                        if(error){
                            console.log(error);
                        }else{
                            console.log(rows);
                        }
                    })
                }
            })
            response.status(200,{id:order_id,bonuses_accrued:bonuses_accrued}, res);
        }
    })
}