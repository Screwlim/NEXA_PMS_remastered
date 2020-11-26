/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('ACTIVITYS', {
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
    TITLE: {
      type: DataTypes.STRING(100),
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
    CONTENTS: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    AUTHOR_ID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: {
          tableName: 'USERS',
        },
        key: 'ID'
      }
    },
    AUTHOR: {
      type: DataTypes.STRING(20),
      allowNull: true
    },
    FILES: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0
    },
    STATUS: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0
    },
    TAG: {
      type: DataTypes.INTEGER,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'ACTIVITYS'
  });
};
