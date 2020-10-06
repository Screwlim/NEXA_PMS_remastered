/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('POST_TASK', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    TASK_ID: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: true,
      references: {
        model: {
          tableName: 'TASKS',
        },
        key: 'ID'
      }
    },
    AUTHOR: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: {
          tableName: 'USERS',
        },
        key: 'ID'
      }
    },
    CONTENT: {
      type: DataTypes.STRING(2048),
      allowNull: true
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: true
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: true
    },
    FILEURL: {
      type: DataTypes.STRING(200),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'POST_TASK'
  });
};
