const express = require("express");
var router = express.Router();
var pool = require("../pool");

const bodyParser = require("body-parser");

router.use(
  bodyParser.urlencoded({
    extended: false,
  })
);

//购物车添加商品接口post
router.post("/", (req, res) => {
  let username = req.body.username;
  let count = req.body.count;
  let price = req.body.price;
  let subtitle = req.body.subtitle;
  let img = req.body.img;
  let sql =
    "INSERT INTO cart(username,count,price,subtitle,img) VALUES(?,?,?,?,?)";
  pool.query(sql, [username, count, price, subtitle, img], (error, results) => {
    if (error) throw error;
    if (results.affectedRows > 0) {
      res.send({ message: "添加商品成功", code: 1 });
    } else {
      res.send({ message: "添加商品失败", code: 0 });
    }
  });
});

module.exports = router;
