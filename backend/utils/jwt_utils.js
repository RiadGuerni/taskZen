const jsonwebtoken = require("jsonwebtoken");
const secret = process.env.JWT_SECRET;
const createToken = (userId) => jsonwebtoken.sign({userId}, secret, {expiresIn: "1h"});
module.exports = {createToken};
