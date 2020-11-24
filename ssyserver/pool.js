//创建mysql连接池
const mysql = require("mysql");
var pool = mysql.createPool({
  // host: "127.0.0.1",
  // user: "root",
  // password: "",
  // database: "xz",
  //port:3306,
  // connectionLimit: 10,
  host: "r.rdc.sae.sina.com.cn",
  user: "yw553x4xz5",
  password: "33yi4im2iyx2kjhjxy5h14ilz4i15jzmh32zm0jx",
  database: "app_ssyserver",
  port: 3306,
  connectionLimit: 10,
});
//把创建好的连接池导出
module.exports = pool;
