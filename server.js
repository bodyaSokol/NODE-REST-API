const express = require('express');// подключаем экспресс
const app = express();//инициализируем его в переменную апп
const port = process.env.PORT || 3500;//Получаем потр из процесс енв или 3500
const bodyParser= require('body-parser');
// пакет, который позволяет разбирать тела запросов, хранящиеся в req. body
// выступая в роли ПО промежуточного слоя для серверов, основанных на Express
var cors = require('cors')

app.use(cors()) // Use this after the variable declaration

app.use(bodyParser.urlencoded({extended:true}));// необьясненная хуета
app.use(bodyParser.json());// необьясненная хуета

const routes = require('./settings/routes')//подключаем роуты
routes(app);//вызываем роуты

app.listen(port,()=>{//запускаем сервер
    console.log(`App listen on port ${port}`);//и когда он запустится - мы получим соответственное сообщение
})