const NaverStrategy = require('passport-naver').Strategy;
const { USERS } = require('../db/models');

module.exports = (passport) => {
  passport.use(new NaverStrategy({
    clientID: process.env.NAVER_ID,
    clientSecret: process.env.NAVER_SECRET,
    callbackURL: '/auth/naver/callback',
  }, async (accessToken, refreshToken, profile, done) => {
    try {
      const exUser = await USERS.findOne({ where: { snsId: profile.id, provider: 'naver' } });
      if (exUser) {
        console.log(exUser.email + ' logging in auto');
        done(null, exUser); //바로 로그인
      } else {
        console.log('new user create from naver');
        const newUser = await USERS.create({
          EMAIL: profile._json && profile._json.kakao_account.email,
          SNSID: profile.id,
          PROVIDER: 'naver',
        });
        done(null, newUser, {isNew : true}); //회원가입 후 로그인
      }
    } catch (error) {
      console.error(error);
      done(error);
    }
  }));
};
