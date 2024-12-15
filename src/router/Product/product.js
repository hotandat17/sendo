const productRouter = require('express').Router();
const { productCreateController, productGetController, getDetailProductController, searchProduct, showProductHome, addToCartController } = require('../../controllers/customer/product');
const { categoryMiddleware } = require('../../middleware/header');
const { verifyToken } = require('../../middleware/verifyToken');

//router create product
productRouter.post('/product', productCreateController);
productRouter.get('/product/:id', categoryMiddleware, verifyToken, productGetController);
productRouter.get('/product/detail/:id', categoryMiddleware, verifyToken, getDetailProductController);
productRouter.get('/productre', categoryMiddleware, verifyToken, searchProduct);
productRouter.get('/', categoryMiddleware, verifyToken, showProductHome);
productRouter.post('/cart', categoryMiddleware, verifyToken, addToCartController);




module.exports = {
    productRouter,
}