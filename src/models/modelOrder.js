const { Sequelize, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/db');
const { Product } = require('./modelProduct');
const { User } = require('./modelUser');

const Order = sequelize.define('Order', {
    id: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
    },
    userId: {
        type: DataTypes.UUID,
        allowNull: false,
    },
    totalAmount: {
        type: DataTypes.FLOAT,
        allowNull: false,
    },
    status: {
        type: DataTypes.STRING,
        defaultValue: 'pending',
    },
},
    {
        tableName: 'order',
        timestamps: true,
    });


// relationship
Order.belongsTo(User, { foreignKey: 'userId' });
Order.belongsToMany(Product, { through: 'OrderItems' })

module.exports = { Order }