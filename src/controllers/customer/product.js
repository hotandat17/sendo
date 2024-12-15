const { UUIDV4, Sequelize, Op } = require('sequelize');
const { Product } = require('../../models/modelProduct');
const { Cart } = require('../../models/modelCart');
const { CartItems } = require('../../models/modelCartItems');


// handle create product 
const productCreateController = async (req, res) => {
    try {
        const { name, description, price, image, quantity, subCategoryId } = req.body;
        if (!name || !description || !price || !image || !subCategoryId) {
            return res.status(400).json({ message: 'Invalid data' });
        };
        const createProduct = await Product.create({
            name: name,
            description: description,
            price: price,
            image: image,
            quantity: quantity,
            subCategoryId,
        });
        if (!createProduct) {
            return res.status(400).json({ message: 'No database' });
        }
        return res.status(201).json({
            message: 'Product created successfully',
            createProduct
        });


    } catch (error) {
        return res.redirect('/404')
    }
}


//Get product by id
const productGetController = async (req, res) => {
    try {
        //Get params form id 
        const { id } = req.params;
        // limit
        const limit = parseInt(req.query.limit) || 10;
        //offset
        const offset = parseInt(req.query.offset) || 0;
        const { count, rows: product } = await Product.findAndCountAll({
            where: { subCategoryId: id },
            attributes: ['id', 'name', 'description', 'price', 'image', 'quantity'],
            order: [['updatedAt', 'ASC']],
            limit: limit,
            offset: offset,
        })
        if (product.length === 0) {
            return res.render('customer/page/product', {
                title: 'Sản Phẩm',
                message: 'Chưa có sản phẩm',
                product: [],
                total: count,
                limit,
                offset,
            });
        }
        return res.render('customer/page/product', {
            title: 'Sản Phẩm',
            product,
            total: count,
            limit,
            offset,
        })
    } catch (error) {
        return res.redirect('/404')
    }

}

const getDetailProductController = async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) {
            return res.render('customer/page/detail', {
                title: 'Thông báo',
                message: 'Sản phẩm không tồn tại!',
            });
        }
        const getDetail = await Product.findByPk(id, {
            attributes: { exclude: ['subCategoryId'] }
        });

        if (!getDetail) {
            return res.render('customer/page/detail', {
                title: 'Thông báo',
                message: 'Sản phẩm không tồn tại!',
            });
        }
        let cartQuantity = await CartItems.findOne({
            where: { productId: getDetail.id },
        });
        const cartQuantityValue = cartQuantity ? parseInt(cartQuantity.quantity) : 0;

        const quantity = parseInt(getDetail.quantity) - cartQuantityValue;

        if (quantity <= 0) {
            return res.render('customer/page/detail', {
                title: getDetail.name,
                detailData: getDetail,
                quantity: 0,
                messageQuantity: 'Sản phẩm đã hết hàng!',
            });
        }


        return res.render('customer/page/detail', {
            title: getDetail.name,
            detailData: getDetail,
            quantity: quantity,
        });
    } catch (error) {
        return res.redirect('/404');

    }
}

// search product
const searchProduct = async (req, res) => {
    try {
        // limit
        const limit = parseInt(req.query.limit) || 10;
        //offset
        const offset = parseInt(req.query.offset) || 0;
        // search\
        const search = req.query.q || '';
        const whereSearch = search
            ? {
                [Op.or]: [
                    { name: { [Op.like]: `%${search}%` } },
                    { description: { [Op.like]: `%${search}%` } },
                ],
            }
            : {};

        //Get search query
        const { count, rows: product } = await Product.findAndCountAll({
            where: whereSearch,
            limit: limit,
            offset: offset,
            order: Sequelize.fn('RAND'),
        });
        // check if product am zero
        if (product.length === 0) {
            return res.render('customer/page/search', {
                title: 'Sản phẩm',
                message: 'Chưa có sản phẩm',
                data: [],
                total: count,
                limit: limit,
                offset: offset,

            });

        }
        return res.render('customer/page/search', {
            title: 'Sản phẩm',
            data: product,
            total: count,
            limit: limit,
            offset: offset,
        })
    } catch (error) {
        return res.redirect('/404');
    }
};


// search product
const showProductHome = async (req, res) => {
    try {
        // limit
        const limit = parseInt(req.query.limit) || 10;
        //offset
        const offset = parseInt(req.query.offset) || 0;
        // search\
        const { count, rows: product } = await Product.findAndCountAll({
            limit: limit,
            offset: offset,
            order: Sequelize.fn('RAND'),
        });
        // check if product am zero
        if (product.length === 0) {
            return res.render('customer/page/home', {
                title: 'Trang chủ',
                message: 'Chưa có sản phẩm',
            });

        }
        return res.render('customer/page/home', {
            title: 'Trang chủ',
            data: product,
            total: count,
            limit: limit,
            offset: offset,
        })
    } catch (error) {
        return res.redirect('/404');
    }
};


// Cart Product 
const addToCartController = async (req, res) => {
    try {
        const { productId, quantity } = req.body;
        const userId = req.user.id;

        if (!userId) {
            return res.redirect('/login');
        }
        if (!productId || !quantity) {
            return res.redirect('/product/detail/' + productId);
        }
        const product = await Product.findByPk(productId);
        if (!product) {
            return res.redirect(`/product/detail/${productId}`);
        }

        const cartItems = await CartItems.findAll({
            where: { productId },
            attributes: [[Sequelize.fn('SUM', Sequelize.col('quantity')), 'totalQuantity']],
        });
        const totalQuantityInCart = parseInt(cartItems[0]?.dataValues?.totalQuantity || 0);
        const availableQuantity = product.quantity - totalQuantityInCart;
        if (availableQuantity <= 0) {
            return res.redirect(`/product/detail/${productId}?error=out_of_stock`);
        }
        let cart = await Cart.findOne({ where: { userId } });
        if (!cart) {
            cart = await Cart.create({ userId });
        }

        const cartItem = await CartItems.findOne({
            where: { cartId: cart.id, productId },
        });

        const requestedQuantity = parseInt(quantity);

        if (requestedQuantity > availableQuantity) {
            return res.redirect(`/product/detail/${productId}?error=exceed_stock`);
        }

        if (cartItem) {
            cartItem.quantity += requestedQuantity;
            await cartItem.save();
        } else {
            await CartItems.create({
                cartId: cart.id,
                productId,
                quantity: requestedQuantity,
            });
        }

        return res.redirect(`/product/detail/${productId}`);
    } catch (error) {
        console.error('Error in addToCartController:', error);
        return res.redirect('/login');
    }
};


module.exports = {
    productCreateController,
    productGetController,
    getDetailProductController,
    searchProduct,
    showProductHome,
    addToCartController,
}
