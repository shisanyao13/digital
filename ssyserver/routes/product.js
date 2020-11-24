const express = require("express");
var router = express.Router();
var pool = require("../pool");
var query = require("./query");

//查看商品详情
router.get("/", (req, res) => {
  let img = req.query.img;
  let sql =
    "SELECT  id,title,config,img,sale,number,classify,label,office,route From allInfo WHERE img=?";
  pool.query(sql, [img], (err, results) => {
    if (err) throw err;
    if (!results.length)
      res.send({ message: "查询失败!", code: 0, result: results });
    else res.send({ message: "查询成功!", code: 1, result: results[0] });
  });
});

module.exports = router;
