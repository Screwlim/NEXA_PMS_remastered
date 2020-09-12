const router = require("../main");
const passport = require("passport");

router.get('/', passport.authenticate('google'));

router.get('/callback', passport.authenticate('google', {
    failureRedirect: '/auth/login',
}),(req,res)=>{
    console.log('google auth succeeded');
    if(req.user.NAME === null || req.user.NAME === undefined){
        console.log('the user is newbie')
        res.redirect('/auth/signup-sns');
    } else {
        console.log('the user is ex-user')
        console.log('user : ' + req.user.NAME)
        res.redirect('/dashboard');
    }
});


module.exports = router;