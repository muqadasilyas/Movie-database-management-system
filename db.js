// db.js
const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host: 'hayabusa.proxy.rlwy.net',
      user: 'root',
      password: 'vZHXRhgJdwwseiEbSZTuaRbkessnWNrl',
      database: 'railway',
      port: 13518,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
    
});

module.exports = pool;