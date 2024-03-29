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
    PHONENUMBER: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    COMPANYNUMBER: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    COMPANY: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    POSITION: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    PROVIDER: {
      type: DataTypes.STRING(20),
      allowNull: true,
      defaultValue: "local"
    },
    SNSID: {
      type: DataTypes.STRING(30),
      allowNull: true
    },
    prof_img_url: {
      type: DataTypes.STRING(200),
      allowNull: false,
      defaultValue: "../../assets/img/default_prof.png"
    }
  }, {
    sequelize,
    tableName: 'USERS',
    timestamps: false
  });
};
