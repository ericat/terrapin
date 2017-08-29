'use strict';
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello Terraform!\n');
});

module.exports = app;

