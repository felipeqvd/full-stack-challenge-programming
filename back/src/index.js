const cors = require('cors');
const express = require('express');
const app = express();

//middlewares
app.use(cors());
app.options('*', cors());
app.use(express.json());
app.use(express.urlencoded({extended: false}));

//routes
app.use(require('./routes/apiPersonRoutes'));

port = process.env.PORT || 3000;
app.listen(port);
console.log('Simple code started on port '+port);