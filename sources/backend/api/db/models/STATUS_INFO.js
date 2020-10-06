/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('STATUS_INFO', {
    STATUS: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    DESCRIPTION: {
      type: DataTypes.STRING(20),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'STATUS_INFO'
  });
};
