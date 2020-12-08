/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('COMMENT_NOTICES', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    NOTICE_ID: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: true,
      references: {
        model: {
          tableName: 'NOTICES',
        },
        key: 'ID'
      }
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
    CONTENT: {
      type: DataTypes.STRING(512),
      allowNull: true
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: true
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'COMMENT_NOTICES'
  });
};
