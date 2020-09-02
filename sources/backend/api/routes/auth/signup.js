const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const { isLoggedIn, isNotLoggedIn } = require('../middleware');
const { USERS } = require('../../db/models');
const passport = require('passport');

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("signup page");
  res.render('auth/auth-register.html');
});

router.post('/', isNotLoggedIn, async (req, res, next) => {
  console.log('sign up in progress....');
  const { email, password } = req.body;

  try{
	  const exUSER = await USERS.findOne({where : {email}});
	  if (exUSER){
		  req.flash('signupError', '이미 가입된 이메일입니다.');
		  console.log('이미 가입된 이메일입니다.');
		  return res.redirect('/');
		}
		const hash = await bcrypt.hash(password, 12);
		await USERS.create({
			NAME: req.body.name,
			EMAIL: req.body.email,
			COMPANY: req.body.company,
			COMPANYNUMBER: req.body.companynumber,
			POSITION: req.body.position,
			PHONENUMBER: req.body.phonenumber,
			PASSWORD: hash
		});
		return res.redirect('/');
  } catch (error) {
    console.error(error);
    return next(error);
  	}
});

module.exports = router;
