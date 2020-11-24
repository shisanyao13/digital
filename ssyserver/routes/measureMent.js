const express = require("express");
var router = express.Router();
var pool = require("../pool");

//评测中心页面全部信息
router.get("/", (req, res) => {
  let sql =
    "SELECT  lid,ltitle,lcontent,limg,lclassify,ltime From leave_measurement";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

module.exports = router;
