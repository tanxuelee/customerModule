const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();

app.use(bodyParser.json());
app.use(cors());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'customerdatabase'
});

db.connect(err => {
    if (err) throw err;
    console.log('MySQL connected...');
});

app.post('/addCustomer', (req, res) => {
    const { name, ic_number, date_of_birth, address, address_country, address_postcode } = req.body;
    const sql = 'INSERT INTO customers (name, ic_number, date_of_birth, address, address_country, address_postcode) VALUES (?, ?, ?, ?, ?, ?)';
    db.query(sql, [name, ic_number, date_of_birth, address, address_country, address_postcode], (err, result) => {
        if (err) throw err;
        res.send('Customer added...');
    });
});

app.put('/editCustomer/:id', (req, res) => {
    const { name, date_of_birth, address, address_country, address_postcode } = req.body;
    const { id } = req.params;
    const sql = 'UPDATE customers SET name = ?, date_of_birth = ?, address = ?, address_country = ?, address_postcode = ? WHERE id = ?';
    db.query(sql, [name, date_of_birth, address, address_country, address_postcode, id], (err, result) => {
        if (err) throw err;
        res.send('Customer updated...');
    });
});

app.get('/listCustomers', (req, res) => {
    const sql = 'CALL GetAllCustomers()';
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json(results[0]);
    });
});

app.listen(3000, () => {
    console.log('Server started on port 3000');
});
