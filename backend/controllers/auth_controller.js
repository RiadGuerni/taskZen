const authService = require("../services/auth_service");
const jwtUtils = require("../utils/jwt_utils");
const passport = require("passport");
const { validationResult } = require("express-validator");

class AuthController {
    static async register(req, res,next) {
        
        try {
            const errors = validationResult(req);
            console.log(errors);
            if (!errors.isEmpty()) {
                const error = new Error(errors.array()[0].msg);
                error.statusCode = 400;
                throw error;
            }
            const { username, password } = req.body;
            const user = await authService.register({ username, password });
            const token = jwtUtils.createToken(user._id);
            res.status(201).json({ message: "User registered successfully",  token });
        } catch (error) {
            next(error);
        }
    }
    static async login(req, res,next) {
        try {
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                const error = new Error(errors.array()[0].msg);
                error.statusCode = 400;
                throw error;
            }
            const { username, password } = req.body;
            const user = await authService.login({ username, password });
            const token = jwtUtils.createToken(user._id);
            res.status(200).json({ message: "User logged in successfully", token });
        } catch (error) {
            next(error);
        }
    }
}

module.exports = AuthController;