// db.js
const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root', // Replace with your actual DB user
    password: 'HelloWorld@123', // Replace with your actual DB password
    database: 'moviesystemdb', // Ensure this matches your database name
    port:3308,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
    
});

module.exports = pool;