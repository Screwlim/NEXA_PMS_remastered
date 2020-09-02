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
        done(null, exUser);
      } else {
        const newUser = await USERS.create({
          EMAIL: profile._json && profile._json.kaccount_email,
          SNSId: profile.id,
          PROVIDER: 'kakao',
        });
        done(null, newUser);
      }
    } catch (error) {
      console.error(error);
      done(error);
    }
  }));
};
