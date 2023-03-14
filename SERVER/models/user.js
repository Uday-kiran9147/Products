const mongoose = require("mongoose");
// 
// mongoose.set('strictQuery', false);


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
                const re =  /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: "Please enter a valid email address uday",
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
        default: "",
    },
    type: {
        type: String,
        default: "user",
    }
    // cart
});
const user = mongoose.model("user", userSchema);
module.exports = user;