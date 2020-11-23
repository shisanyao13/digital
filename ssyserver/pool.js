const mysql = require("mysql");
const pool = mysql.createPool({
  // host: "127.0.0.1",
  // port: 3306,
  // user: "root",
  // password: "",
  // database: "digital",
  // connectionLimit: 10,
  host: "r.rdc.sae.sina.com.cn",
  port: 3306,
  user: "yw553x4xz5",
  password: "33yi4im2iyx2kjhjxy5h14ilz4i15jzmh32zm0jx",
  database: "app_ssyserver",
  connectionLimit: 10,
});

module.exports = pool;