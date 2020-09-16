const express = require('express');
const router = express.Router();
const { isLoggedIn, isNotLoggedIn } = require('../middleware');
const passport = require('passport');
/* GET users listing. */
router.get('/', function(req, res) {
  console.log("login page");
  res.render('auth/auth-login');
});

router.post('/',isNotLoggedIn, (req, res, next) => {
  console.log("login processing")

  passport.authenticate('local', (authError, user, info) => {
    if (authError){
      console.error(authError);
      return next(authError);
    }
    if(!user) {
      req.flash('loginError', info.message);
      return res.redirect('/');
    }
    return req.login(user, (loginError) => {
      if (loginError) {
        console.error(loginError);
        return next(loginError);
      }
      console.log('login successful');
      return res.redirect('/dashboard');
    });
  })(req, res, next);
});
module.exports = router;
