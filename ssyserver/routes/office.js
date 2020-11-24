const express = require("express");
var router = express.Router();
var pool = require("../pool");

//办公电脑
router.get("/", (req, res) => {
  let sql =
    "SELECT  nid,ntitle,nconfig,nsale,nnumber,nimg,nclassify,nlabel,noffice From note_game WHERE noffice=1";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

module.exports = router;
