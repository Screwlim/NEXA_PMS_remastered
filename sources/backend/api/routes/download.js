var express = require('express');
var router = express.Router();
const path = require("path");
const fs = require('fs');
const {FILE} = require('../db/models');


router.get('/:downloadfile', function(req, res) {
  console.log('download file: '+req.params.downloadfile);

  FILE.findOne({
    where: {
      server_NAME: req.params.downloadfile
    }
  }).then((data) => {
    console.log(data);
    if (data.deletedAt != null){
      res.statusCode = 410;
      res.end();
    }
    else{
      var stream; 
      var filePath = path.join('uploads',data.server_NAME);
      var fileExists = fs.existsSync(filePath);

      if(fileExists){
        stream = fs.createReadStream(filePath);
      }
      else {
        console.log("no file");
        res.statusCode = 404;
        res.end();
      }

      res.writeHead(200, {
        'Content-Type': 'application/octet-stream',
        'Content-Disposition': 'attachment; filename=' + encodeURI(data.original_NAME)
      });
      stream.pipe(res);
    }
  })
});

module.exports = router;