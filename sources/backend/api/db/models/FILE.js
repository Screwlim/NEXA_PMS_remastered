/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('FILE', {
    TYPE: {
      type: DataTypes.CHAR(1),
      allowNull: true
    },
    SRC: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    PATH: {
      type: DataTypes.STRING(200),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'FILE'
  });
};
