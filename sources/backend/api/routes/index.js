const express = require('express');
const router = express.Router();
const { ATTENDANCES, PROJECTS } = require('../db/models');
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
const { checkInvitation } = require('./middleware');

router.use('/',main);
router.use('/user', user);
router.use('/auth', auth);
router.use('/inprogress', checkInvitation, inprogress);

//set pid param value for later use
//& check the authorization to access the project
router.use('/projects/:pid', checkInvitation, function(req, res, next){
    
    ATTENDANCES.findOne({
        where: {
            [Op.and] : [
                {PROJECT_ID: req.params.pid},
                {USER_ID: req.user.ID}
            ]
        }
    }).then(data => {
        var attendance = data
        PROJECTS.findOne({
            where: {
                ID: req.params.pid
            }
        }).then(data => {
            req.proj = data
            if(attendance){
                req.pid = req.params.pid;
                if(attendance.ISPM==1){
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
        
    })
}, projects);

router.use('/dashboard', checkInvitation, dashboard);
router.use('/invites', checkInvitation, invites);
router.use('/download', download);
router.use('/comments', comments);
router.use('/proj_create', checkInvitation, proj_create);
router.use('/proj_delete', checkInvitation, proj_delete);
router.use('/proj_list', checkInvitation, proj_list)
module.exports = router;
