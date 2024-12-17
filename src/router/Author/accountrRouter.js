const routerAccount = require('express').Router();
const { registerController, loginController, accountController } = require('../../controllers/customer/author');
const { verifyToken } = require('../../middleware/verifyToken');
const { categoryMiddleware } = require('../../middleware/header');
routerAccount.get('/register', verifyToken, registerController);
routerAccount.post('/register', registerController);
routerAccount.post('/login', loginController);
routerAccount.get('/login', verifyToken, loginController);
routerAccount.get('/account', verifyToken, categoryMiddleware, accountController);





module.exports = {
    routerAccount
}