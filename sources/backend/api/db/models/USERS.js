/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('USERS', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    PASSWORD: {
      type: DataTypes.STRING(512),
      allowNull: true
    },
    EMAIL: {
      type: DataTypes.STRING(80),
      allowNull: true
    },
    NAME: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    COMPANY: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    DEPARTMENT: {
      type: DataTypes.STRING(50),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'USERS'
  });
};
