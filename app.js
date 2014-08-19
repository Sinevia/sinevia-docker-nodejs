#!/bin/env node
//  OpenShift sample Node application
var express = require('express');
var fs = require('fs');
var bodyParser = require('body-parser'); // Needed for $_POST
var app = express();

app.get('/', function(req, res){
  res.send('Hello World');
});

app.listen(3000);