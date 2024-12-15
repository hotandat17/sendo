const categoryRouter = require('express').Router();
const { categoryCreateController, categoryGetController, subCategoryCreateController, subCategoryGetController } = require('../../controllers/customer/category');
// category
categoryRouter.post('/category', categoryCreateController);
// categoryRouter.get('/', categoryGetController);
// categoryRouter.get('/category', categoryGetController);
//subcategory
categoryRouter.post('/subcategory', subCategoryCreateController);
categoryRouter.get('/subcategory', subCategoryGetController);

module.exports = {
    categoryRouter,
}