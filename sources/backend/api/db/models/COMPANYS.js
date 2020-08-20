/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('COMPANYS', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    NAME: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    CREATOR: {
      type: DataTypes.STRING(50),
      allowNull: true,
      references: {
        model: {
          tableName: 'USERS',
        },
        key: 'ID'
      }
    },
    CREATED: {
      type: DataTypes.DATE,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'COMPANYS'
  });
};
