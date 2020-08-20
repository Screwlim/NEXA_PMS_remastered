/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('JOBS', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    PROJECT_ID: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: true,
      references: {
        model: {
          tableName: 'PROJECTS',
        },
        key: 'ID'
      }
    },
    TITLE: {
      type: DataTypes.STRING(200),
      allowNull: true
    },
    START: {
      type: DataTypes.DATE,
      allowNull: true
    },
    END: {
      type: DataTypes.DATE,
      allowNull: true
    },
    CREATED: {
      type: DataTypes.DATE,
      allowNull: true
    },
    DESCRIPTION: {
      type: DataTypes.STRING(512),
      allowNull: true
    },
    WRITER: {
      type: DataTypes.STRING(50),
      allowNull: true,
      references: {
        model: {
          tableName: 'USERS',
        },
        key: 'ID'
      }
    },
    NUM_TASKS: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    NUM_DONE_TASKS: {
      type: DataTypes.INTEGER,
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
    tableName: 'JOBS'
  });
};
