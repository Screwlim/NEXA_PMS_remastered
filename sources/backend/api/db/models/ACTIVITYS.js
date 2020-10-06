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
      type: DataTypes.STRING(200),
      allowNull: true
    },
    START_DATE: {
      type: DataTypes.DATE,
      allowNull: true
    },
    END_DATE: {
      type: DataTypes.DATE,
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
    DESCRIPTION: {
      type: DataTypes.STRING(2048),
      allowNull: true
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
    FILEURL: {
      type: DataTypes.STRING(50),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'ACTIVITYS'
  });
};
