const passport = require("passport");
const JwtStrategy = require("passport-jwt").Strategy;
const { ExtractJwt } = require("passport-jwt");
const User = require("../models/user");
const options =  {
    jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
    secretOrKey: process.env.JWT_SECRET, 
  }
passport.use(new JwtStrategy(options,async  (jwt_payload, done) => {
    try{
    const userId = jwt_payload.userId;
    const user =  await User.findById(userId);
    if (user) {
        return done(null, user);
    }
    return done(null, false);
    }
    catch (err) {
        return done(err, false);
    }
   
}))