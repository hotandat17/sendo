const bcrypt = require('bcryptjs');
// hash password
const hashPassword = (password) => {
    const salt = bcrypt.genSaltSync(10);
    return bcrypt.hashSync(password, salt);
}

const confirmPassword = (password, user) => {
    return bcrypt.compareSync(password, user.password);
}




module.exports = {
    hashPassword,
    confirmPassword
}