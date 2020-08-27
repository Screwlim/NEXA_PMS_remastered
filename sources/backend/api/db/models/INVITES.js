/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('INVITES', {
    PROJECT_ID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    SEND_USER_ID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    RECV_USER_ID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    ISPM: {
      type: DataTypes.INTEGER(1),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'INVITES'
  });
};
