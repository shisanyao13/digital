const express = require("express");
var router = express.Router();
var pool = require("../pool");

const bodyParser = require("body-parser");

router.use(
  bodyParser.urlencoded({
    extended: false,
  })
);

//注册接口
router.post("/", (req, res) => {
  let uname = req.body.uname;
  let uphone = req.body.uphone;
  let upwd = req.body.upwd;
  let sql = "SELECT uid FROM user WHERE uname=?";
  pool.query(sql, [uname], (error, results) => {
    if (error) throw error;
    if (results.length == 0) {
      sql = "INSERT INTO user(uname,upwd,uphone) VALUES(?,MD5(?),?)";
      pool.query(sql, [uname, upwd, uphone], (error, results) => {
        if (error) throw error;
        res.send({ message: "注册成功", code: 1 });
      });
    } else {
      res.send({ message: "注册失败", code: 0 });
    }
  });
});

module.exports = router;
