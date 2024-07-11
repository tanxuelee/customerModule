// import module
const express = require('express');
const app = express();
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');

// use the modules
app.use(bodyParser.json());
app.use(cors());

// setup database
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'customerdatabase'
});

// connect database
db.connect(err => {
    if (err) throw err;
    console.log('MySQL connected...');
});


// add customer
app.post('/addCustomer', (req, res) => {
    const { name, ic_number, date_of_birth, address, address_country, address_postcode } = req.body;
    const sql = 'INSERT INTO customers (name, ic_number, date_of_birth, address, address_country, address_postcode) VALUES (?, ?, ?, ?, ?, ?)';
    db.query(sql, [name, ic_number, date_of_birth, address, address_country, address_postcode], (err, result) => {
        if (err) throw err;
        res.send('Customer added...');
    });
});

// edit customer
app.put('/editCustomer/:id', (req, res) => {
    const { name, date_of_birth, address, address_country, address_postcode } = req.body;
    const { id } = req.params;
    const sql = 'UPDATE customers SET name = ?, date_of_birth = ?, address = ?, address_country = ?, address_postcode = ? WHERE id = ?';
    db.query(sql, [name, date_of_birth, address, address_country, address_postcode, id], (err, result) => {
        if (err) throw err;
        res.send('Customer updated...');
    });
});

// list customer
app.get('/listCustomers', (req, res) => {
    const sql = 'CALL GetAllCustomers()'; // direct call the Store Procedure
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json(results[0]);
    });
});

// starting the server
app.listen(3000, () => {
    console.log('Server started on port 3000');
});
