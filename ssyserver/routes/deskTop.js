const express = require("express");
var router = express.Router();
var pool = require("../pool");

//台式机/一体机
router.get("/", (req, res) => {
  let sql =
    "SELECT  did,dtitle,dconfig,dsale,dnumber,dclassify,dimg From desk_top";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

module.exports = router;
