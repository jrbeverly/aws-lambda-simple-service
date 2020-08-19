const express = require('express');
const router = require('./routes');
const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
router.routes(app);

exports.app = app;