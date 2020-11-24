const express = require("express");
var router = express.Router();
var pool = require("../pool");

//购物车查询商品接口get
router.get("/", (req, res) => {
  let username = req.query.username;
  let sql =
    "SELECT  cid,username,count,price,subtitle,img From cart WHERE username=?";
  pool.query(sql, [username], (err, results) => {
    if (err) throw err;
    if (!results.length)
      res.send({ message: "查看失败!", code: 0, result: results });
    else res.send({ message: "查看成功!", code: 1, result: results });
  });
});

module.exports = router;
