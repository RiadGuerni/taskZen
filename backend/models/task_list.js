const mongoose  = require("mongoose");
const {taskSchema} = require("./task");
const taskListSchema = new mongoose.Schema({
    tasks : [taskSchema]
})
const TaskList = mongoose.model("TaskList", taskListSchema);
module.exports = TaskList;