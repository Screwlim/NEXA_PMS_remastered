/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('LOG', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    USER_ID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: {
          tableName: 'USERS',
        },
        key: 'ID'
      }
    },
    USER_NAME: {
      type: DataTypes.STRING(20),
      allowNull: true
    },
    OBJECT: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    OBJECT_NAME: {
      type: DataTypes.STRING(200),
      allowNull: true
    },
    ACTION: {
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
    URL: {
      type: DataTypes.STRING(200),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'LOG'
  });
};
