const sequelizeSync = (sequelize) => {
    sequelize.sync({ force: true })
}

module.exports = { sequelizeSync }