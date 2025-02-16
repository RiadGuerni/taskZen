const taskController = require('../controllers/task_controller');
const passport = require('passport');
const {check} = require('express-validator');
const express = require('express');

const taskRouter = express.Router();

const validationList = [
    check('title').not().isEmpty().withMessage('Title is required'),
   
];

taskRouter.use(passport.authenticate("jwt", {session: false}) ,(req,res,next) => {
    if (!req.user) {
        const error = new Error('Unauthorized');
        error.statusCode = 401;
        return next(error);
    }
    return next();
});

taskRouter.get('/', taskController.getTask);
taskRouter.post('/', validationList, taskController.addTask);
taskRouter.put('/:taskId',taskController.markTaskAsDone);
taskRouter.delete('/:taskId', taskController.deleteTask);
module.exports = taskRouter;