const express = require("express");
var router = express.Router();
var pool = require("../pool");

//游戏本/笔记本
router.get("/", (req, res) => {
  let sql =
    "SELECT  nid,ntitle,nconfig,nsale,nnumber,nclassify,nlabel,nimg From note_game";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

module.exports = router;
