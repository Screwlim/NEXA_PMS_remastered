'use strict';

const fs = require('fs');
const path = require('path');
const Sequelize = require('sequelize');
const ATTENDANCES = require('./ATTENDANCES');
const PROJECTS = require('./PROJECTS');
const USERS = require('./USERS');
const basename = path.basename(__filename);
const env = process.env.NODE_ENV || 'development';
const config = require(__dirname + '/../config/config.json')[env];
const db = {};

var sequelize;
if (config.use_env_variable) {
  sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
  sequelize = new Sequelize(config.database, config.username, config.password, config);
}

// fs
//   .readdirSync(__dirname)
//   .filter(file => {
//     return (file.indexOf('.') !== 0) && (file !== 'index.js');
//   })
//   .forEach(file => {
//     const model = sequelize.import(path.join(__dirname, file));
//     db[model.name] = model;
//   });

// Object.keys(db).forEach(modelName => {
//   if (db[modelName].associate) {
//     db[modelName].associate(db);
//   }
// });

db.sequelize = sequelize;
db.Sequelize = Sequelize;

db.ACTIVITYS = require('./ACTIVITYS')(sequelize, Sequelize);
db.ATTENDANCES = require('./ATTENDANCES')(sequelize, Sequelize);
db.COMMENTS_NOTICES = require('./COMMENT_NOTICES')(sequelize, Sequelize);
db.COMMENTS_ACTIVITY = require('./COMMENTS_ACTIVITY')(sequelize, Sequelize);
db.COMMENTS_JOB_POST = require('./COMMENTS_JOB_POST')(sequelize, Sequelize);
db.COMMENTS_TASK_POST = require('./COMMENTS_TASK_POST')(sequelize, Sequelize);
db.FILE = require('./FILE')(sequelize, Sequelize);
db.INVITES = require('./INVITES')(sequelize, Sequelize);
db.JOBS = require('./JOBS')(sequelize, Sequelize);
db.NOTICES = require('./NOTICES')(sequelize, Sequelize);
db.PROJECTS = require('./PROJECTS')(sequelize, Sequelize);
db.STATUS_INFO = require('./STATUS_INFO')(sequelize, Sequelize);
db.TASKS = require('./TASKS')(sequelize, Sequelize);
db.USERS = require('./USERS')(sequelize, Sequelize);
db.POST_JOB = require('./POST_JOB')(sequelize, Sequelize);
db.POST_TASK = require('./POST_TASK')(sequelize, Sequelize);
db.LOG = require('./LOG')(sequelize, Sequelize);

db.USERS.hasMany(db.ATTENDANCES, {foreignKey: 'USER_ID', sourceKey: 'ID'});
db.ATTENDANCES.belongsTo(db.USERS, {foreignKey: 'USER_ID', targetKey: 'ID'});

db.USERS.hasMany(db.PROJECTS, {foreignKey:'CREATOR_ID', sourceKey: 'ID'});
db.PROJECTS.belongsTo(db.USERS,{foreignKey:'CREATOR_ID', targetKey: 'ID'});

db.PROJECTS.hasMany(db.ATTENDANCES, {foreignKey: 'PROJECT_ID', sourceKey: 'ID'});
db.ATTENDANCES.belongsTo(db.PROJECTS, {foreignKey: 'PROJECT_ID', targetKey: 'ID'});

// db.USERS.hasMany(db.INVITES, {foreignKey: 'RECV_USER_ID', sourceKey: 'ID'});
// db.INVITES.belongsTo(db.USERS, {foreignKey: 'RECV_USER_ID', targetKey: 'ID'});

db.USERS.hasMany(db.INVITES, {foreignKey: 'SEND_USER_ID', sourceKey: 'ID'});
db.INVITES.belongsTo(db.USERS, {foreignKey: 'SEND_USER_ID', targetKey: 'ID'});

db.PROJECTS.hasMany(db.INVITES, {foreignKey: 'PROJECT_ID', sourceKey: 'ID'});
db.INVITES.belongsTo(db.PROJECTS, {foreignKey: 'PROJECT_ID', targetKey: 'ID'});

db.USERS.hasMany(db.COMMENTS_ACTIVITY, {foreignKey: 'AUTHOR_ID', sourceKey: 'ID'});
db.COMMENTS_ACTIVITY.belongsTo(db.USERS, {foreignKey: 'AUTHOR_ID', targetKey: 'ID'});

db.USERS.hasMany(db.COMMENTS_NOTICES, {foreignKey: 'AUTHOR_ID', sourceKey: 'ID'});
db.COMMENTS_NOTICES.belongsTo(db.USERS, {foreignKey: 'AUTHOR_ID', targetKey: 'ID'});

db.USERS.hasMany(db.COMMENTS_JOB_POST, {foreignKey: 'AUTHOR_ID', sourceKey: 'ID'});
db.COMMENTS_JOB_POST.belongsTo(db.USERS, {foreignKey: 'AUTHOR_ID', targetKey: 'ID'});

db.USERS.hasMany(db.COMMENTS_TASK_POST, {foreignKey: 'AUTHOR_ID', sourceKey: 'ID'});
db.COMMENTS_TASK_POST.belongsTo(db.USERS, {foreignKey: 'AUTHOR_ID', targetKey: 'ID'});


module.exports = db;
