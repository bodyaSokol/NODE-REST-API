const mysql = require("mysql");
const env = require("./../dbenv");

const connection = mysql.createConnection({
    host:env.HOST,
    user: env.USER,
    password:env.PASSWORD,
    database:env.DATABASE
})

connection.connect(function(err){
    if (err) {
      throw err;
    }
    else{
      console.log("Подключение к серверу MySQL успешно установлено");
    }
 });

module.exports = connection