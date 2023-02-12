// console.log("Hello world!");

//IMPORT FROM PACKAGES
const express = require("express");
const mongoose = require('mongoose');
mongoose.set('strictQuery', false);

//IMPORT FROM OTHER FILES
const authRouter = require('./routes/auth');


//INIT
const port = 3000;
const app = express();

const DB = "mongodb+srv://uday:amazon@cluster0.xohorue.mongodb.net/amazonflutter";

//middleware
// CLIENT --> Middleware->server-->client
app.use(express.json());
app.use(authRouter);


//connections

try {
    mongoose.connect(DB).then(function (req, res) {

        console.log(" Data base connection Successful");

        app.get("/", function (req, res) {
            res.send("This is Amazon");
        })
        app.get("/signup", function (req, res) {
            res.send("This is signup ");
        })
    })
}
catch (e) {
    console.log(e);
}


//localhost


app.listen(port, function (req, res) {

    console.log(`connected at port ${port}`);

})
