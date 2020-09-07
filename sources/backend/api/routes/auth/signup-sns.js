const express = require('express');
const router = express.Router();
const { isLoggedIn, isNotLoggedIn } = require('../middleware');
const { USERS } = require('../../db/models');

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("signup page");
  //console.log(req);
  res.render('auth/auth-register-sns.html');
});

router.post('/', async (req, res, next) => {
  console.log('sign up-sns in progress....');
  try{
		await USERS.update({
			NAME: req.body.name,
			COMPANY: req.body.company,
			COMPANYNUMBER: req.body.companynumber,
			POSITION: req.body.position,
			PHONENUMBER: req.body.phonenumber,
		},{where : {EMAIL: req.user.EMAIL}});
		return res.redirect('/dashboard');
  } catch (error) {
    console.error(error);
    return next(error);
  	}
});

module.exports = router;
