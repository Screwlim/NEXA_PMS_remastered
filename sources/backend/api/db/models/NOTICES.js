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
    createdAt: {
      type: DataTypes.DATE,
      allowNull: true
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: true
    },
    FILES: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0
    }
  }, {
    sequelize,
    tableName: 'NOTICES'
  });
};
