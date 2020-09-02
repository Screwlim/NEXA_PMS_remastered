const express = require('express');
const router = express.Router();
const bcrpt = require('bcrypt');
const { isLoggedIn, isNotLoggedIn } = require('../middleware');

router.get('/', isLoggedIn, (req, res) =>{
    console.log('로그아웃 중');
    req.logout();
    req.session.destroy();
    res.redirect('/');
});

module.exports = router;