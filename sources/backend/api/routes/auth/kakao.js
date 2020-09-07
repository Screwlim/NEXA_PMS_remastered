const router = require("../main");
const passport = require("passport");

router.get('/', passport.authenticate('kakao'));

router.get('/callback', passport.authenticate('kakao', {
    failureRedirect: '/auth/login',
}),(req,res)=>{
    console.log('kakao auth succeeded');
    if(req.user.NAME === null){
        console.log('the user is newbie')
        res.redirect('/auth/signup-sns');
    } else {
        console.log('the user is ex-user')
        res.redirect('/dashboard');
    }
});


module.exports = router;