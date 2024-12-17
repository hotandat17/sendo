const { Sequelize, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/db');
const { User } = require('./modelUser');
const { Product } = require('./modelProduct');


const Cart = sequelize.define('Cart', {
    id: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
    },
    userId: {
        type: DataTypes.UUID,
        allowNull: false,
    },
},
    {
        tableName: 'cart',
        timestamps: true,
    });

// relationship
Cart.belongsTo(User, { foreignKey: 'userId' });
Cart.belongsToMany(Product, { through: 'CartItems' });


module.exports = { Cart }