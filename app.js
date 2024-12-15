const express = require('express');
const ejs = require('ejs');
const path = require('path');
const cookieParser = require('cookie-parser');
const { sequelize, connect } = require('./config/db');
const { routerAccount } = require('./src/router/Author/accountrRouter');
const { categoryRouter } = require('./src/router/Category/categoryRouter');
const { productRouter } = require('./src/router/Product/product');
const { categoryMiddleware } = require('./src/middleware/header')
sequelize.sync({ alter: true });


const app = express();
//Port
const port = 3000;
app.use(cookieParser());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

//Get the path to the public folder
app.use(express.static(path.join(__dirname, './src/public')));
//Get the path to the views folder
app.set('view engine', 'ejs');
app.set('views', './src/views');


//Get router account
app.use(routerAccount);
//Get router category
app.use(categoryRouter);
// Get router product
app.use(productRouter);



// // app.use(router);

// Get home in views
// app.get('/', categoryMiddleware, (req, res) => {
//     res.render('customer/page/home', { title: 'Shopping' });
// });


app.get('/404', (req, res) => {
    res.render('404');
});
// app.get('/login', (req, res) => {
//     res.render('customer/auth/login', { title: 'Login' });
// });

// app.get('/register', (req, res) => {
//     res.render('customer/auth/register', { title: 'Login' });
// });


// Run server
app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
});