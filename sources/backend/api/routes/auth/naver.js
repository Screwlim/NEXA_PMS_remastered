const router = require("../main");
const passport = require("passport");

router.get('/', passport.authenticate('naver'));

router.get('/callback', passport.authenticate('naver', {
    failureRedirect: '/auth/login',
}),(req,res)=>{
    console.log('naver auth succeeded');
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