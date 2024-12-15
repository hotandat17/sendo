require('dotenv').config();
const jwt = require('jsonwebtoken');
const blacklistedTokens = require('../../config/listCookie');
const { CartItems } = require('../models/modelCartItems');
const { Cart } = require('../models/modelCart');

const verifyToken = async (req, res, next) => {

    const token = req.cookies.token;
    if (!token) {
        res.locals.user = null;
        return next();
    };
    if (blacklistedTokens.has(token)) {
        res.locals.user = null;
        return next();
    };
    try {
        if (req.path === '/login' || req.path === '/register') {
            return res.redirect('/');
        }

        const decoded = jwt.verify(token, process.env.SECRET_TOKEN);

        const userCart = await Cart.findOne({
            where: { userId: decoded.id },
        });

        let totalQuantity = 0;

        if (userCart) {
            totalQuantity = await CartItems.sum('quantity', {
                where: { cartId: userCart.id },
            });
        }

        req.user = decoded
        res.locals.user = { id: decoded.id, fullName: decoded.fullName, email: decoded.email, totalQuantity: totalQuantity };

        next();
    } catch (err) {
        res.locals.user = null;
        return next();
    }
};


module.exports = {
    verifyToken,
}