import express from 'express'
import {adminSignIn, userSignUp, userSignIn, getUserData, getUsers, updateUserFirstName, updateUserLastName, updateUserPassword } from '../controller/userController.js'
import { authenticateToken } from '../middleware/authentication.js';
import { checkAccountType } from '../middleware/checkAccountType.js';


const userRouter = express.Router();

userRouter.post('/adminSignIn', adminSignIn);
userRouter.post('/signUp', userSignUp)
userRouter.post('/signIn', userSignIn)
userRouter.post('/list', authenticateToken, checkAccountType, getUsers)
userRouter.post('/get', authenticateToken, getUserData)
userRouter.post('/updatefirstname', authenticateToken, updateUserFirstName)
userRouter.post('/updatelastname', authenticateToken, updateUserLastName)
userRouter.post('/updatepassword', authenticateToken, updateUserPassword)

export default userRouter;