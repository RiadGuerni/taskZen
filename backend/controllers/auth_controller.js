const authService = require("../services/auth_service");
const jwtUtils = require("../utils/jwt_utils");
const passport = require("passport");
const checkValidationErrors = require("../utils/check_validation_errors");

class AuthController {
    static async register(req, res,next) {
        
        try {
            checkValidationErrors(req);
            const { username, password } = req.body;
            const user = await authService.register({ username, password });
            const token = jwtUtils.createToken(user._id);
            res.status(201).json({ message: "User registered successfully",  token  , taskListId : user.taskListId});
        } catch (error) {
            next(error);
        }
    }
    static async login(req, res,next) {
        try {
            checkValidationErrors(req);
            const { username, password } = req.body;
            const user = await authService.login({ username, password });
            const token = jwtUtils.createToken(user._id);
            res.status(200).json({ message: "User logged in successfully", token , taskListId : user.taskListId});
        } catch (error) {
            next(error);
        }
    }
}

module.exports = AuthController;