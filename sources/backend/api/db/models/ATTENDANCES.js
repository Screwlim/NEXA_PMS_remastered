/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('ATTENDANCES', {
    PROJECT_ID: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true,
      references: {
        model: {
          tableName: 'PROJECTS',
        },
        key: 'ID'
      }
    },
    USER_ID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: {
          tableName: 'USERS',
        },
        key: 'ID'
      }
    },
    ISPM: {
      type: DataTypes.INTEGER(1),
      allowNull: true
    },
    ROLE: {
      type: DataTypes.STRING(200),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'ATTENDANCES'
  });
};
