/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('FILE', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    TYPE: {
      type: DataTypes.CHAR(1),
      allowNull: true
    },
    SRC: {
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
    PATH: {
      type: DataTypes.STRING(500),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'FILE'
  });
};
