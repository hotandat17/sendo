const { Category } = require('../../models/modelCategory');
const { Subcategory } = require('../../models/modelSubcategory');


// handle create category
const categoryCreateController = async (req, res) => {
    try {
        const { name } = req.body;
        const [category, created] = await Category.findOrCreate({
            where: { name: name },
            defaults: {
                name: name,
            }
        })
        if (!created) {
            return res.status(400).json({ message: 'Category already exists' })
        }
        return res.status(200).json({
            message: null,
            data: category
        })
    } catch (error) {
        return res.redirect('/404')
    }
}

// handle get category
// const categoryGetController = async (req, res) => {
//     try {
//         const getCategory = await Category.findAll({
//             order: [['updatedAt', 'ASC']],
//             attributes: ['id', 'name'],
//             include: {
//                 model: Subcategory,
//                 attributes: ['id', 'name'],
//             }
//         })
//         if (!getCategory) {
//             return res.redirect('/404')
//         }

//         // return res.status(200).json({
//         //     message: null,
//         //     data: getCategory
//         // })
//         return res.render('customer/header/header', {

//             categoryData: getCategory,
//         });
//     } catch (error) {

//         return res.redirect('/404')
//     }
// }



// handle Create sub category
const subCategoryCreateController = async (req, res) => {
    try {
        const { name, categoryId } = req.body;
        if (!name || !categoryId) {
            return res.redirect('/404')
        }
        const [subCategory, created] = await Subcategory.findOrCreate({
            where: { name: name },
            defaults: {
                name: name,
                categoryId: categoryId
            }
        })
        if (!created) {
            return res.status(400).json({ message: 'Category already exists' })
        }
        return res.status(200).json({
            message: null,
            data: subCategory
        })
    } catch (error) {
        return res.redirect('/404')
    }
}

// handle Create sub category
const subCategoryGetController = async (req, res) => {
    try {
        const getSubCatelory = await Subcategory.findAll({
            attributes: ['id', 'name'],
        });

        return res.status(200).json({
            message: null,
            data: getSubCatelory
        })
    } catch (error) {
        return res.redirect('/404')
    }
}

module.exports = {
    categoryCreateController,

    subCategoryCreateController,
    subCategoryGetController,

}