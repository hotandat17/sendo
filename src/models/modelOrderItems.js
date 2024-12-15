const { Sequelize, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/db');
const { Product } = require('./modelProduct');
const { Order } = require('./modelOrder');

const OrderItems = sequelize.define('OrderItems', {
    id: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
    },
    orderId: {
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
        tableName: 'orderItems',
        timestamps: true,
    });


// relationship
OrderItems.belongsTo(Order, { foreignKey: 'orderId' });
OrderItems.belongsTo(Product, { foreignKey: 'productId' })

module.exports = { OrderItems }