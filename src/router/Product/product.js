const productRouter = require('express').Router();
const { productCreateController,
    productGetController,
    getDetailProductController,
    searchProduct,
    showProductHome,
    addToCartController,
    getToCartController,
    updateToCartController,
    deleteToCartController,
    addOrderController
} = require('../../controllers/customer/product');
const { categoryMiddleware } = require('../../middleware/header');
const { verifyToken } = require('../../middleware/verifyToken');

//router create product
productRouter.post('/product', productCreateController);
productRouter.get('/product/:id', categoryMiddleware, verifyToken, productGetController);
productRouter.get('/product/detail/:id', categoryMiddleware, verifyToken, getDetailProductController);
productRouter.get('/productre', categoryMiddleware, verifyToken, searchProduct);
productRouter.get('/', categoryMiddleware, verifyToken, showProductHome);
productRouter.post('/cart', categoryMiddleware, verifyToken, addToCartController);
productRouter.get('/show-cart', categoryMiddleware, verifyToken, getToCartController);
productRouter.post('/show-cart/:productId', categoryMiddleware, verifyToken, updateToCartController);
productRouter.post('/show-cart/delete/:id', categoryMiddleware, verifyToken, deleteToCartController);
productRouter.get('/order/', categoryMiddleware, verifyToken, addOrderController);
productRouter.post('/order/', categoryMiddleware, verifyToken, addOrderController);
productRouter.get('/manage/', categoryMiddleware, verifyToken, (req, res) => {
    res.render('customer/page/manage')
});





module.exports = {
    productRouter,
}