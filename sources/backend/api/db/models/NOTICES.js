/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('NOTICES', {
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
      type: DataTypes.STRING(100),
      allowNull: true
    },
    CONTENT: {
      type: DataTypes.STRING(512),
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
    tableName: 'NOTICES'
  });
};
