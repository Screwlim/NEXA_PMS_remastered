'use strict';

const fs = require('fs');
const path = require('path');
const Sequelize = require('sequelize');
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
db.COMMENTS_JOB = require('./COMMENTS_JOB')(sequelize, Sequelize);
db.COMMENTS_TASK = require('./COMMENTS_TASK')(sequelize, Sequelize);
db.COMPANYS = require('./COMPANYS')(sequelize, Sequelize);
db.FILE = require('./FILE')(sequelize, Sequelize);
db.INVITES = require('./INVITES')(sequelize, Sequelize);
db.JOBS = require('./JOBS')(sequelize, Sequelize);
db.NOTICES = require('./NOTICES')(sequelize, Sequelize);
db.PROJECTS = require('./PROJECTS')(sequelize, Sequelize);
db.STATUS_INFO = require('./STATUS_INFO')(sequelize, Sequelize);
db.TASKS = require('./TASKS')(sequelize, Sequelize);
db.USERS = require('./USERS')(sequelize, Sequelize);


module.exports = db;
