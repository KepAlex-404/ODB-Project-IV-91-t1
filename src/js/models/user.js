const connection = require('../connection');
const Sequilize = require('sequelize');
const Role = require('./role').Role;
const Model = Sequilize.Model;
class Users extends Model {}


Users.init(
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
        role_id:{
            type: Sequilize.INTEGER,
            allowNull: false,
            references: {
                model: Role,
                key: 'id'
            }
        }
    },

    {
        sequelize: connection,
        modelName: 'users',
        timestamps: false

    }
);

module.exports = {
    Users
};
