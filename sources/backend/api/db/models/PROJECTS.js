/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('PROJECTS', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    NAME: {
      type: DataTypes.STRING(200),
      allowNull: true
    },
    CREATOR: {
      type: DataTypes.STRING(30),
      allowNull: true
    },
    CREATOR_ID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: {
          tableName: 'USERS',
        },
        key: 'ID'
      }
    },
    START_DATE: {
      type: DataTypes.DATE,
      allowNull: true
    },
    END_DATE: {
      type: DataTypes.DATE,
      allowNull: true
    },
    DESCRIPTION: {
      type: DataTypes.STRING(2500),
      allowNull: true
    },
    NUM_TASKS: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    NUM_DONE_TASKS: {
      type: DataTypes.INTEGER,
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
    STATUS: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: {
          tableName: 'STATUS_INFO',
        },
        key: 'STATUS'
      }
    }
  }, {
    sequelize,
    tableName: 'PROJECTS'
  });
};
