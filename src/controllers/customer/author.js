const { User } = require('../../models/modelUser');
const { hashPassword, confirmPassword } = require('../../lib/config');
const jwt = require('jsonwebtoken');
const blacklistedTokens = require('../../../config/listCookie');
require('dotenv').config();
// handle login
const loginController = async (req, res) => {
    try {
        const { numberPhone, password } = req.body;

        // check input
        if (!numberPhone || !password) {
            return res.render('customer/auth/login', {
                title: 'login',
                error: 'Please enter complete information!'
            });
        }
        // Get check user exist 
        const getUser = await User.findOne({
            where: { numberPhone: numberPhone }
        })
        if (!getUser) {
            return res.render('customer/auth/login', {
                title: 'login',
                error: 'User not found!'
            });
        }
        // Check password
        const pass = confirmPassword(password, getUser);
        if (!pass) {
            return res.render('customer/auth/login', {
                title: 'login',
                error: 'Wrong password!'
            });
        }
        //return token
        const token = jwt.sign({ id: getUser.id, numberPhone: getUser.numberPhone, email: getUser.email, address: getUser.address, fullName: getUser.fullName }, process.env.SECRET_TOKEN, { expiresIn: '7d' });
        res.cookie('token', token, { httpOnly: true, maxAge: 7 * 24 * 60 * 60 * 1000 });
        res.locals.user = { id: getUser.id, fullName: getUser.fullName };
        // return result
        return res.redirect('/')

    } catch (error) {
        return res.render('customer/auth/login', {
            title: 'login',
            error: 'Internal server error. Please try again later.'
        });
    }
}

// handle register
const registerController = async (req, res) => {
    try {
        const { fullName, email, numberPhone, address, password } = req.body;
        //check input 
        if (!fullName || !email || !numberPhone || !password) {
            return res.render('customer/auth/register', {
                error: 'All fields are required.',
                user: null,
            });
        }
        // check address
        if (address === '' || address === null) {
            address = '';
        }

        // create account
        const [user, created] = await User.findOrCreate({
            where: { numberPhone: numberPhone },
            defaults: {
                fullName,
                email,
                numberPhone,
                address,
                password: hashPassword(password),

            }
        })
        // check account if fail return error
        if (!created) {
            res.render('/customer/auth/register', {
                error: 'All fields are required.',
                user: null
            });
        }
        // result returned successfully
        return res.redirect('/login');

    } catch (error) {
        return res.redirect('/404');
    }
}


const logoutController = (req, res) => {
    const token = req.cookies.token;
    if (token) {
        blacklistedTokens.add(token);
        res.clearCookie('token');
    }
    return res.redirect('/customer/auth/login');
};

// Cart product



module.exports = {
    loginController,
    registerController,
    logoutController,
}