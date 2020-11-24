const express = require("express");
var router = express.Router();
var pool = require("../pool");

const bodyParser = require("body-parser");

router.use(
  bodyParser.urlencoded({
    extended: false,
  })
);

//购物车修改商品接口put
router.put("/", (req, res) => {
  let obj = req.body;
  let sql = "UPDATE cart SET count=? WHERE cid=?";
  pool.query(sql, [obj.count, obj.cid], (err, results) => {
    if (err) throw err;
    if (!results.affectedRows) res.send({ message: "修改失败!", code: 0 });
    else res.send({ message: "修改成功!", code: 1 });
  });
});

module.exports = router;
