const express = require('express');
const router = express.Router();
const bcrpt = require('bcrypt');
const { isLoggedIn, isNotLoggedIn } = require('../middleware');

router.get('/', isLoggedIn, (req, res) =>{
    console.log('로그아웃 중');
    res.clearCookie();    
    req.session.destroy();
    req.logout();
    res.redirect('/');
});

module.exports = router;