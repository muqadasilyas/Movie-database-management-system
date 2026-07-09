const mysql = require('mysql2/promise');

async function test() {
  try {
    const connection = await mysql.createConnection({
      host: 'hayabusa.proxy.rlwy.net',
      user: 'root',
      password: 'vZHXRhgJdwwseiEbSZTuaRbkessnWNrl',
      database: 'railway',
      port: 13518,
    });

    console.log('✅ Connected successfully!');

    const [rows] = await connection.query('SELECT NOW() AS now');
    console.log(rows);

    await connection.end();
  } catch (err) {
    console.error(err);
  }
}

test();