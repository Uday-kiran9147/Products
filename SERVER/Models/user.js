const mongoose = require("mongoose");
// 
const userSchema = mongoose.Schema({
    name: {
        type: String,
        requiured: true,
        trim: true,  //"      uday  "  ==> "uday"
    },
    email: {
        type: String,
        requiured: true,
        trim: true,
        validate: {
            validator: (value) => {
                const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return value.match(re);
            },
            message: "pleade enter a valid email address",
        }
    },
    password: {
        required: true,
        type: String,
        // validator:(value)=>{
        //     return value.length
        // }
    },
    address: {
        type: String,
        default: " ",
    },
    type: {
        type: String,
        default: "user",
    }
    // cart
});
const User = mongoose.model("User", userSchems);
module.exports = User;