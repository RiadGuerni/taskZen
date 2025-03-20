const express = require("express");
const AuthRouter = express.Router();
const AuthController = require("../controllers/auth_controller");
const passport = require("passport");
const {check} = require("express-validator");
const validationList = [
    check("username").not().isEmpty().withMessage("Username is required"),
    check("password").isLength({min : 6}).withMessage("Password must be at least 6 characters long")
]
AuthRouter.post("/register", validationList, AuthController.register);
AuthRouter.post("/login",validationList, AuthController.login);

AuthRouter.get("/verifyToken" , passport.authenticate("jwt", {session : false}), ( req,res,next)=>{
    if (!req.user) {
    const error = new Error('Unauthorized');
    error.statusCode = 401;
    return next(error);
}
res.status(200).json({message : "Token is valid"});
});
module.exports = AuthRouter;