const express = require("express");
var router = express.Router();
var pool = require("../pool");

// VR专区
router.get("/", (req, res) => {
  let sql =
    "SELECT  pid,ptitle,pconfig,psale,pnumber,pimg,pclassify From peripherals WHERE pclassify='VR设备 ' ";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

module.exports = router;
