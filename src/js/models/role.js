const connection = require('../connection');
const Sequilize = require('sequelize');
const Model = Sequilize.Model;
class Role extends Model {}

Role.init(
    {
        id: {
            type: Sequilize.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        name: {
            type: Sequilize.STRING,
            allowNull: false
        },
    },
    {
        sequelize: connection,
        modelName: 'roles',
        timestamps: false,
    }
);


module.exports = {
    Role: Role
};
