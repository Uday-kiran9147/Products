const express = require("express");
const User = require("../models/user");
const authRouter = express.Router();
const bcryptjs=require('bcryptjs');


authRouter.post('/api/signup', async (req, res) => {
    // get data from client
    try {
        const { name, email, password } = req.body;
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ msg: "User with same email already exists" });
            //STATUS CODES 400,
        }
        const Hashedpassword= await bcryptjs.hash(password,8); //8 is not the length of the hashedpassword
        var user = new User({
            email,
            password:Hashedpassword, // storing hashed password in password field 
            name,
        })
        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }


    //post data in the database
    //return that data to the user

    /* {
        "name": name,
         "email": email,
          "password":password
        } */

    //
});

module.exports = authRouter; // to tell authRouter is not private

