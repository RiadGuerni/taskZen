const authService = require("../services/auth_service");
const jwtUtils = require("../utils/jwt_utils");
const passport = require("passport");

class AuthController {
    static async register(req, res,next) {
        const { username, password } = req.body;
        try {
            const user = await authService.register({ username, password });
            const token = jwtUtils.createToken(user._id);
            res.status(201).json({ message: "User registered successfully",  token });
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
    }
    static async login(req, res,next) {
        const { username, password } = req.body;
        try {
            const user = await authService.login({ username, password });
            const token = jwtUtils.createToken(user._id);
            res.status(200).json({ message: "User logged in successfully", token });
        } catch (error) {
            res.status(401).json({ error: error.message });
        }
    }
}

module.exports = AuthController;