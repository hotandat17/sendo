const { Sequelize, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/db');
const { Subcategory } = require('./modelSubcategory');

const Product = sequelize.define('Product', {
    id: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
    },
    name: {
        type: DataTypes.STRING(100),
        allowNull: false
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    price: {
        type: DataTypes.DECIMAL(10, 2),
        allowNull: false
    },
    image: {
        type: DataTypes.STRING(255),
        allowNull: false
    },
    quantity: {
        type: DataTypes.INTEGER,
        allowNull: false
    }
},
    {
        tableName: 'product',
        timestamps: true,
    });
// relationship
Subcategory.hasMany(Product, {
    foreignKey: 'subCategoryId',
    onDelete: 'CASCADE',
});
Product.belongsTo(Subcategory, {
    foreignKey: 'subCategoryId',
});


module.exports = { Product };