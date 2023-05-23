'use strict'

const response = require('./../response');
const db = require('./../settings/db')

exports.getAllUsers = (req,res) =>{
    
    db.query('SELECT * FROM `users`',(error,rows,fields)=>{
        if(error){
            response.status(400,error, res);
        }else{
            response.status(200,rows, res);
        }
    })
}
exports.getUser = (req,res) =>{
    const telegram_id=req.params.id;
    db.query("SELECT * FROM `users` WHERE `telegram_id`='"+telegram_id+"'",(error,rows,fields)=>{
        if(error){
            response.status(400,error, res);
        }else if(rows.length > 0){
            response.status(200,{user_existence:true,rows}, res);
        }
        else{
            response.status(200,{user_existence:false}, res);
        }
    })
}
exports.getUserOrders = (req,res) =>{
    const telegram_id=req.params.id;
    db.query("SELECT * FROM `orders` WHERE `telegram_id`='"+telegram_id+"'",(error,rows,fields)=>{
        if(error){
            response.status(400,error, res);
        }else {
            response.status(200,rows, res);
        }
    })
}
exports.create = (req,res) =>{
    const telegram_id=req.body.telegram_id;
    db.query("SELECT `telegram_id` FROM `users` WHERE `telegram_id`='"+telegram_id+"'",(error,rows,fields)=>{
        if(error){
            response.status(400,error, res);
        }else if(typeof rows !== 'undefined' && rows.length > 0){
            console.log(rows);
            const row = JSON.parse(JSON.stringify(rows));
            row.map(rw=>{
                response.status(302,{message:'Пользователь с таким telegram_id уже зарегистрирован!'}, res);
                return true;
            })
        }
        else{
            const telegram_name=req.body.telegram_name;
            const telegram_lastname= req.body.telegram_lastname;
            const telegram_nickname= req.body.telegram_nickname;
            const sql = "INSERT INTO `users` (`telegram_id`, `telegram_name`, `telegram_lastname`, `telegram_nickname`) VALUES ('"+telegram_id+"', '"+telegram_name+"', '"+telegram_lastname+"', '"+telegram_nickname+"');"
            db.query(sql,(error,rows)=>{
                if(error){
                    response.status(400,error, res);
                }else{
                    response.status(200,{message:"Регистрация прошла успешно!",rows}, res);
                }
            })
        }
    })
}
exports.checkPhone = (req,res) =>{
    const telegram_id=req.body.telegram_id;
    db.query("SELECT `phone` FROM `users` WHERE `telegram_id`='"+telegram_id+"'",(error,rows,fields)=>{
        if(error){
            response.status(400,error, res);
        }else if(rows[0].phone != null && rows.length > 0){
            response.status(200,{phone_existence:true,rows}, res);
        }
        else{
            response.status(200,{phone_existence:false}, res);
        }
    })
}
exports.setPhone = (req,res) =>{
    const telegram_id=req.body.telegram_id;
    const phone=req.body.phone;
    const sql = "UPDATE `users` SET `phone`='"+phone+"' WHERE `telegram_id`='"+telegram_id+"'";
    db.query(sql,(error,rows,fields)=>{
        if(error){
            response.status(400,error, res);
        }else{
            response.status(200,rows,res);
        }
    })
}