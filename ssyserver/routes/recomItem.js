const express = require("express");
var router = express.Router();
var pool = require("../pool");

//精选单品推荐
router.get("/", (req, res) => {
  let sql =
    "SELECT  rid,rtitle,rconfig,rsale,rnumber,rclassify,rlabel,rimg From recom_item";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

module.exports = router;
