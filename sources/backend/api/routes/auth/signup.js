const express = require('express');
const router = express.Router();

const db = require('../../db/models/index');
const USER = db.USERS;

const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("signup page");
  res.render('auth/auth-register.html');
});

router.post('/', function(req, res){
  console.log('sign up in progress....');
  USER.create({
		NAME: req.body.name,
		EMAIL: req.body.email,
		COMPANY: req.body.company,
		PASSWORD: bcrypt.hashSync(req.body.password, 8)
	}).then(user => {
      res.redirect('/index');
	}).catch(err => {
		res.status(500).send("Fail! Error -> " + err);
	})
});

module.exports = router;
