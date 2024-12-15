const { Sequelize, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/db');
const { Category } = require('./modelCategory');
const Subcategory = sequelize.define('Subcategory', {
    id: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    description: {
        type: DataTypes.TEXT,
    },
},
    {
        tableName: 'subcategory',
        timestamps: true,
    });
// relationship
Category.hasMany(Subcategory, {
    foreignKey: 'categoryId',
    onDelete: 'CASCADE',
});
Subcategory.belongsTo(Category, {
    foreignKey: 'categoryId',
});

module.exports = { Subcategory };