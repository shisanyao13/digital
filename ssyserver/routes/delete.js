const express = require("express");
var router = express.Router();
var pool = require("../pool");

//购物车删除商品接口delete
router.delete("/", (req, res) => {
  let cid = req.query.cid;
  let sql = "DELETE FROM cart WHERE cid=?";
  pool.query(sql, [cid], (err, results) => {
    if (err) throw err;
    if (!results.affectedRows) res.send({ message: "删除失败!", code: 0 });
    else res.send({ message: "删除成功!", code: 1 });
  });
});

module.exports = router;
