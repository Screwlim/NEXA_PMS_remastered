const KakaoStrategy = require('passport-kakao').Strategy;
const { USERS } = require('../db/models');

module.exports = (passport) => {
  passport.use(new KakaoStrategy({
    clientID: process.env.KAKAO_ID,
    callbackURL: '/auth/kakao/callback',
  }, async (accessToken, refreshToken, profile, done) => {
    try {
      const exUser = await USERS.findOne({ where: { snsId: profile.id, provider: 'kakao' } });
      if (exUser) {
        console.log(exUser.email + ' logging in auto');
        done(null, exUser); //바로 로그인
      } else {
        console.log('new user create from kakao');
        const newUser = await USERS.create({
          EMAIL: profile._json && profile._json.kakao_account.email,
          SNSID: profile.id,
          PROVIDER: 'kakao',
        });
        done(null, newUser, {isNew : true}); //회원가입 후 로그인
      }
    } catch (error) {
      console.error(error);
      done(error);
    }
  }));
};
