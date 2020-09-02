const local = require('./localStrategy');
const kakao = require('./kakaoStrategy');
const { USERS } = require('../db/models');

module.exports = (passport) => {
  passport.serializeUser((USERS, done) => {
    done(null, USERS.ID);
  });

  passport.deserializeUser((id, done) => {
    USERS.findOne({ where: { id } })
      .then(USERS => done(null, USERS))
      .catch(err => done(err));
  });

  local(passport);
  kakao(passport);
};
