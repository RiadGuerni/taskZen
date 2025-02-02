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
                const error = errors.array()[0].msg;
                throw new Error(error);
            }
            const { username, password } = req.body;
            const user = await authService.register({ username, password });
            const token = jwtUtils.createToken(user._id);
            res.status(201).json({ message: "User registered successfully",  token });
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
    }
    static async login(req, res,next) {
        try {
            const errors = validationResult(req);
            if (!errors.isEmpty()) {
                const error = errors.array()[0].msg;
                throw new Error(error);
            }
            const { username, password } = req.body;
            const user = await authService.login({ username, password });
            const token = jwtUtils.createToken(user._id);
            res.status(200).json({ message: "User logged in successfully", token });
        } catch (error) {
            res.status(401).json({ error: error.message });
        }
    }
}

module.exports = AuthController;