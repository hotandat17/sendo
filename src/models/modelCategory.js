const { Sequelize, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/db');

const Category = sequelize.define('Category', {
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
        tableName: 'category',
        timestamps: true,
    });

module.exports = { Category }