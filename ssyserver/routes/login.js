const express = require("express");
var router = express.Router();
var pool = require("../pool");

const bodyParser = require("body-parser");
const md5 = require("md5");
router.use(
  bodyParser.urlencoded({
    extended: false,
  })
);

//登录接口
router.post("/", (req, res) => {
  let uname = req.body.uname;
  let upwd = md5(req.body.upwd);
  let sql = "SELECT uid,uname,upwd,uphone FROM user WHERE uname=? AND upwd=?";
  pool.query(sql, [uname, upwd], (error, results) => {
    if (error) throw error;
    if (results.length == 1) {
      res.send({ message: "登陆成功", code: 1, results: results });
    } else {
      res.send({ message: "登陆失败", code: 0 });
    }
  });
});

module.exports = router;
