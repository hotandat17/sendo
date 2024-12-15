const routerAccount = require('express').Router();
const { registerController, loginController } = require('../../controllers/customer/author');
const { verifyToken } = require('../../middleware/verifyToken');

routerAccount.get('/register', verifyToken, registerController);
routerAccount.post('/register', registerController);
routerAccount.post('/login', loginController);
routerAccount.get('/login', verifyToken, loginController);





module.exports = {
    routerAccount
}