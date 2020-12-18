const express = require('express');
const router = express.Router();
const { ATTENDANCES } = require('../db/models');
const { Op } = require('sequelize');

const main = require('./main');
const user = require('./user');
const auth = require('./auth');
const inprogress = require('./inprogress');
const projects = require('./projects');
const dashboard = require('./dashboard');
const invites = require('./invites');
const download = require('./download');
const comments = require('./comments');
const proj_create = require('./proj_create');
const proj_delete = require('./proj_delete');
const proj_list = require('./proj_list');

router.use('/', main);
router.use('/user', user);
router.use('/auth', auth);
router.use('/inprogress', inprogress);

//set pid param value for later use
//& check the authorization to access the project
router.use('/projects/:pid', function(req, res, next){

    ATTENDANCES.findOne({
        where: {
            [Op.and] : [
                {PROJECT_ID: req.params.pid},
                {USER_ID: req.user.ID}
            ]
        }
    }).then(data => {
        if(data){
            req.pid = req.params.pid;
            if(data.ISPM==1){
                req.isPM = true;
            }else{
                req.isPM = false;
            }

            next();
        }else{
            console.log("you don't belong to this project")
            res.status(403).render('./err/error-403.pug');
        }
    })
}, projects);

router.use('/dashboard', dashboard);
router.use('/invites', invites);
router.use('/download', download);
router.use('/comments', comments);
router.use('/proj_create', proj_create);
router.use('/proj_delete', proj_delete);
router.use('/proj_list', proj_list)
module.exports = router;
