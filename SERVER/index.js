// console.log("Hello world!");

//IMPORT FROM PACKAGES
const express = require("express");
const mongoose = require('mongoose');

//IMPORT FROM OTHER FILES
const authRouter = require('./Routes/auth');


//INIT
const PORT = 3000;
const app = express();
const DB="mongodb+srv://uday:amazon@cluster0.wlkogou.mongodb.net/?retryWrites=true&w=majority";

//middleware
// CLIENT --> Middleware->server-->client
app.use(express.json());
app.use(authRouter);

mongoose.connect(DB).then(() => {
    console.log("connection Successful");
})
    .catch((e) => {
        console.log(e);
    });




// const express = require('express');
//import'express/express.dart;
const port = 3000;

// const app = express();
// creating API

// CRUD functions
//http://<youripaddress>/hello-world
app.get('/hello-world', (req, res) => {
    res.json({ name: "Udaykiran" });
});

app.listen(port, "0.0.0.0", function () {

    console.log(`connected at port ${port} `);

})

//localhost


