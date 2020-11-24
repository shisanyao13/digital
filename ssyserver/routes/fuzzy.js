const express = require("express");
var router = express.Router();
var pool = require("../pool");

//模糊查询
router.get("/", (req, res) => {
  let value = req.query.value;
  let sql = `SELECT  id,title,config,img,sale From allInfo WHERE title LIKE '%${value}%' OR config LIKE '%${value}%' OR img LIKE '%${value}%' OR sale LIKE '%${value}%'`;
  pool.query(sql, (err, results) => {
    if (err) throw err;
    if (!results.length)
      res.send({ message: "没有符合条件的结果。", code: 0, result: results });
    else res.send({ message: "模糊查询成功", code: 1, result: results });
  });
});

module.exports = router;
