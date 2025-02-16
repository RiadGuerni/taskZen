
const { Task } = require('../models/task');
const taskService = require('../services/task_service');
const checkValidationErrors = require('../utils/check_validation_errors');
class TaskController {
    static async getTask (req,res,next) {
        try {
            const taskListId = req.user.taskListId;
            const tasks = await taskService.getTasks(taskListId);
            res.status(200).json({tasks});
        } 
        catch(err){
            next(err);
        }
    }

    static async addTask (req,res,next) {
        try {
            checkValidationErrors(req);
            const taskListId = req.user.taskListId;
            const {title , description} = req.body;
            const task = new Task({title , description});
            await taskService.addTask({taskListId , task});
            res.status(201).json({message : "Task added successfully"});
        }
        catch (err){
            next(err);
        }
    }
    static async markTaskAsDone (req,res,next) {
        try {
            const taskListId = req.user.taskListId;
            const taskId = req.params.taskId;
            await taskService.markTaskAsDone({taskListId , taskId});
            res.status(200).json({message : "Task updated successfully"});
        }
        catch (err){
            next(err);
        }
    }
    static async deleteTask (req,res,next) {
        try {
            const taskListId = req.user.taskListId;
            const taskId = req.params.taskId;
            await taskService.deleteTask({taskListId , taskId});
            res.status(200).json({message : "Task deleted successfully"});
        }
        catch (err){
            next(err);
        }
    }
}
module.exports = TaskController;