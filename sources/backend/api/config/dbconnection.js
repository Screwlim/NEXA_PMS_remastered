const Sequelize = require('sequelize');

const SequelizeConnection = new Sequelize(
  'pmsDB', // 데이터베이스 이름
  'pmsDB', // 유저 명
  '1234', // 비밀번호
  {
    'host': 'localhost', // 데이터베이스 호스트
    'dialect': 'mysql' // 사용할 데이터베이스 종류
  }
);

module.exports = SequelizeConnection;
