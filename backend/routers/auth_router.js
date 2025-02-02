const express = require("express");
const AuthRouter = express.Router();
const AuthController = require("../controllers/auth_controller");
const passport = require("passport");
AuthRouter.post("/register", AuthController.register);
AuthRouter.post("/login", AuthController.login);
module.exports = AuthRouter;