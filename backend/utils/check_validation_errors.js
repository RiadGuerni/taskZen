const {validationResult} = require('express-validator');
const checkValidationErrors = (req) => {
    const errors = validationResult(req);
    if(!errors.isEmpty){
        const error = new Error(errors.array()[0].msg);
        error.statusCode = 400;
        throw error
    }
};
module.exports = checkValidationErrors