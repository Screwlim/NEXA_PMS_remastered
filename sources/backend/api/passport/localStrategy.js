const LocalStrategy = require('passport-local').Strategy;
const bcrypt = require('bcrypt');

const { USERS } = require('../db/models');

module.exports = (passport) => {
  passport.use(new LocalStrategy({
    usernameField: 'email',
    passwordField: 'password',
  }, async (email, password, done) => {
    try {
      const exUSERS = await USERS.findOne({ where: { email } });
      if (exUSERS) {
        const result = await bcrypt.compare(password, exUSERS.PASSWORD);
        if (result) {
          done(null, exUSERS);
        } else {
          console.log('비밀번호가 일치하지 않습니다.');
          done(null, false, { message: '비밀번호가 일치하지 않습니다.' });
        }
      } else {
        console.log('가입되지 않은 회원입니다.');
        done(null, false, { message: '가입되지 않은 회원입니다.' });
      }
    } catch (error) {
      console.error(error);
      done(error);
    }
  }));
};
