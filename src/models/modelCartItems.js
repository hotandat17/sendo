const { Sequelize, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/db');
const { Cart } = require('./modelCart');
const { Product } = require('./modelProduct');

const CartItems = sequelize.define('CartItems', {
    id: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
    },
    cartId: {
        type: DataTypes.UUID,
        allowNull: false,
    },
    productId: {
        type: DataTypes.UUID,
        allowNull: false,
    },
    quantity: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
},
    {
        tableName: 'cartItems',
        timestamps: true,
    });

// relationship
CartItems.belongsTo(Cart, { foreignKey: 'cartId' });
CartItems.belongsTo(Product, { foreignKey: 'productId', as: 'product' });

module.exports = { CartItems }