const express = require("express");
var router = express.Router();
var pool = require("../pool");

//热评产品
router.get("/", (req, res) => {
  let sql =
    "SELECT  bid,btitle,bconfig,bsale,bnumber,bclassify,blabel,bimg From buzz";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

module.exports = router;
