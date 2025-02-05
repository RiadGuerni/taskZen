const User = require("../models/user");
const TaskList = require("../models/task_list");
const hashUtils = require("../utils/hash_utils");
class AuthService{
    // singleton pattern
    constructor () {
        if (AuthService.instance){
            return AuthService.instance;
        }
        AuthService.instance = this ;
        return this ;
    }
    async register({username , password}){
        const hashedPassword = await hashUtils.hashPassword(password);
 
    const user = await User.findOne({username});
    if (user) {
        throw new Error("User already exists");
    }
    else {
        const taskList=  new TaskList({tasks : []});
        await taskList.save();
        const newUser = new User({
            username,
            password : hashedPassword,
            taskListId : taskList._id
        });
        await newUser.save();
        return newUser;
     
    }

}

async login ( {username , password}){
    const user = await User.findOne({username});
    if (!user) {
        throw new Error("User not found");
    }
    const passwordMatch = await hashUtils.comparePassword(password, user.password);
    if (!passwordMatch) {
        throw new Error("Wrong password");
    }
    return user;
}

}

module.exports = new AuthService();

