const GoogleStrategy = require('passport-google-oauth20').Strategy;
const { USERS } = require('../db/models');

module.exports = (passport) => {
  passport.use(new GoogleStrategy({
    clientID: process.env.GOOGLE_ID,
    clientSecret: process.env.GOOGLE_SECRET,
    callbackURL: '/auth/google/callback'
  }, async (accessToken, refreshToken, profile, cb) => {
    try {
      console.log(profile);
      const exUser = await USERS.findOne({ where: { snsId: profile.id, provider: 'google' } });
      if (exUser) {
        console.log(exUser.email + ' logging in auto');
        done(null, exUser); //바로 로그인
      } else {
        console.log('new user create from google');
        const newUser = await USERS.create({
          EMAIL: profile._json && profile._json.email,
          SNSID: profile.id,
          PROVIDER: 'google',
        });
        done(null, newUser, {isNew : true}); //회원가입 후 로그인
      }
    } catch (error) {
      console.error(error);
      done(error);
    }
  }));
};
