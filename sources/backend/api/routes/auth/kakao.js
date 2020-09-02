const router = require("../main");
const passport = require("passport");

router.get('/', passport.authenticate('kakao'));

router.get('/callback', passport.authenticate('kakao', {
    failureRedirect: '/auth/login',
}),(req,res)=>{
    res.redirect('/dashboard');
});

module.exports = router;