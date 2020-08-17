const express = require('express');
const path = require('path');
const routes = require('./routes');
const app = express();
const port = 3000;

app.listen(port, function () {
    console.log('Example app listening on port : ' + port);
});

//view engine setup
app.set('views', path.join(__dirname, '../web_frontend/dist'));
app.set('view engine', 'ejs');

//default route
app.use('/', routes);
