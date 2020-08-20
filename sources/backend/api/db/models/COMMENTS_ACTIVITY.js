/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('COMMENTS_ACTIVITY', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    ACTIVITY_ID: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: true,
      references: {
        model: {
          tableName: 'ACTIVITYS',
        },
        key: 'ID'
      }
    },
    WRITER: {
      type: DataTypes.STRING(50),
      allowNull: true,
      references: {
        model: {
          tableName: 'USERS',
        },
        key: 'ID'
      }
    },
    CONTENT: {
      type: DataTypes.STRING(512),
      allowNull: true
    },
    CREATED: {
      type: DataTypes.DATE,
      allowNull: true
    },
    STATUS: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: {
          tableName: 'STATUS_INFO',
        },
        key: 'STATUS'
      }
    }
  }, {
    sequelize,
    tableName: 'COMMENTS_ACTIVITY'
  });
};
