const { PROJECTS,ATTENDANCES } = require('../db/models');
let async = require('async');
 
function projectListFunction(uid,callback) {
    console.log(uid);
    callback = { ID: 5,
        NAME: '테스트 프로젝트41',
        CREATOR: '테스트',
        CREATOR_ID: 1,
        START: 2020-09-01,
        END: 2020-09-22,
        DESCRIPTION: '이게 뭐여41',
        NUM_TASKS: 0,
        NUM_DONE_TASKS: 0,
        createdAt: 2020-09-09,
        updatedAt: 2020-09-09,
        STATUS: null
  };
    return callback
}
exports.projectListFunction = projectListFunction;