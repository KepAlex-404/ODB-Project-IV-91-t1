const models = require('./models');

const userMapper = (user) => {
    console.log(user.id + ' | ' + user.name + ' | ' + user.role_id);
};
const roleMapper = (role) => {
    console.log(role.id + ' | ' + role.name);
};

const user_runner = (roles, users) => {
  for (var u of users) {
    r_id = u.role_id
    user_role_name = roles[r_id-1].name
    console.log(u.name + " | " + user_role_name);
  }
};



(async () => {
    console.log('--------');
    console.log('Users list');
    console.log('--------');
    const usersList = await models.Users.findAll();
    usersList.map(userMapper);

    console.log('--------');
    console.log('Roles list');
    console.log('--------');
    const roleList = await models.Role.findAll();
    roleList.map(roleMapper);


    console.log('\n\n--------');
    console.log('Role - User');
    console.log('--------');
    const roles = await models.Role.findAll();
    const users = await models.Users.findAll();
    user_runner(roles, users)

})();
