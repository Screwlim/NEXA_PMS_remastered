/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('TASKS', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    JOB_ID: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: true,
      references: {
        model: {
          tableName: 'JOBS',
        },
        key: 'ID'
      }
    },
    TITLE: {
      type: DataTypes.STRING(100),
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
      type: DataTypes.STRING(512),
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
    WEIGHT: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    STATUS: {
      type: DataTypes.INTEGER,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'TASKS'
    });
};
