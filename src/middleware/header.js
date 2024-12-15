const { Sequelize, RANGE, Op } = require('sequelize');
const { Category } = require('../models/modelCategory');
const { Product } = require('../models/modelProduct');
const { Subcategory } = require('../models/modelSubcategory');
const { CartItems } = require('../models/modelCartItems');


// Get captegory
const categoryMiddleware = async (req, res, next) => {
    try {
        const categoryData = await Category.findAll({
            order: [['updatedAt', 'ASC']],
            attributes: ['id', 'name'],
            include: {
                model: Subcategory,
                attributes: ['id', 'name'],
            }
        });

        res.locals.categoryData = categoryData;

        next();
    } catch (error) {
        next(error);
    }
};



module.exports = {
    categoryMiddleware,
}