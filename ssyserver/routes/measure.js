const express = require("express");
var router = express.Router();
var pool = require("../pool");

//评测中心页面分类信息
router.get("/", (req, res) => {
  let classify = req.query.classify;
  let sql =
    "SELECT  lid,ltitle,lcontent,limg,lclassify,ltime From leave_measurement WHERE lclassify=?";
  pool.query(sql, [classify], (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

module.exports = router;
