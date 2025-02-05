require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const passport = require('passport');
const authRouter = require('./routers/auth_router');
const errorHandler = require('./middlewares/error_handler');

const app = express();

app.use(express.json());
app.use(passport.initialize());

const MONGO_URI = process.env.MONGO_URI 
mongoose.connect(MONGO_URI)
    .then(() => console.log('Connected to MongoDB'))
    .catch((error) => console.error('Error connecting to MongoDB:', error));

app.use('/api/auth', authRouter);


app.use(errorHandler);
const PORT = process.env.PORT ;
app.listen(PORT, () => console.log(`Server started on port ${PORT}`));