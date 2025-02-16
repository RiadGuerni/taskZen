const TaskList = require('../models/task_list');
class TaskService {
    //singleton Pattern 
    constructor (){ 
        if (TaskService.instance ){
            return TaskService.instance;
        }
        TaskService.instance = this ;
        return this ;
    }

    async getTasks(taskListId){
        const taskList = await this.#getTasksList(taskListId);
        return taskList.tasks;
    }
    
    async addTask({taskListId , task}){
        const taskList = await this.#getTasksList(taskListId);
        taskList.tasks.push(task);
        await taskList.save();
    }

    async markTaskAsDone({taskListId , taskId }){
        const taskList = await this.#getTasksList(taskListId);
        const taskIndex = taskList.tasks.findIndex(t =>t._id.equals(taskId)
        );
        
        if (taskIndex === -1){
            const error = new Error("Task not found");
            error.statusCode = 404;
            throw error;
        }
        taskList.tasks[taskIndex].done = true;
        await taskList.save();
    }

    async deleteTask ({taskListId , taskId}) {
        const taskList = await this.#getTasksList(taskListId);
        const taskIndex = taskList.tasks.findIndex( t => t._id.equals(taskId));
        if (taskIndex === -1){
            const error = new Error("Task not found");
            error.statusCode = 404;
            throw error;
        }
        taskList.tasks.splice(taskIndex , 1);   
        await taskList.save();
    }
    


    async #getTasksList(taskListId){
        const taskList = await TaskList.findById(taskListId);   
        if (!taskList){
            const error = new Error("Task List not found");
            error.statusCode = 404;
            throw error;
        } 
        return taskList;
    }
}

module.exports = new TaskService();