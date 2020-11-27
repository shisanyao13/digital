const express = require("express");
const server = express();
const cors = require("cors");
const mysql = require("mysql");
const bodyParser = require("body-parser");
const md5 = require("md5");
const pool = mysql.createPool({
  //host: "w.rdc.sae.sina.com.cn",
  host: "r.rdc.sae.sina.com.cn",
  port: 3306,
  user: "yw553x4xz5",
  password: "33yi4im2iyx2kjhjxy5h14ilz4i15jzmh32zm0jx",
  database: "app_ssyserver"
});

let port=process.env.PORT || 5050;

server.use(
  cors({
    origin: [
      "http://digital.applinzi.com"
    ],
    credentials:true,
  })
);


server.use(
  bodyParser.urlencoded({
    extended: false,
  })
);

//服务器首页
server.get("/", (req, res) => {
    res.send({ message: "Welcome to ssy_server" });
});

//注册接口
server.post("/register", (req, res) => {
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

//登录接口
server.post("/login", (req, res) => {
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

//精选单品推荐
server.get("/recomItem", (req, res) => {
  let sql =
    "SELECT  rid,rtitle,rconfig,rsale,rnumber,rclassify,rlabel,rimg From recom_item";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

//游戏本/笔记本
server.get("/noteGame", (req, res) => {
  let sql =
    "SELECT  nid,ntitle,nconfig,nsale,nnumber,nclassify,nlabel,nimg From note_game";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

//台式机/一体机
server.get("/deskTop", (req, res) => {
  let sql =
    "SELECT  did,dtitle,dconfig,dsale,dnumber,dclassify,dimg From desk_top";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

//外设系列
server.get("/peripheralsSeries", (req, res) => {
  let sql =
    "SELECT  pid,ptitle,pconfig,psale,pnumber,pclassify,pimg From peripherals";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

//热评产品
server.get("/buzz", (req, res) => {
  let sql =
    "SELECT  bid,btitle,bconfig,bsale,bnumber,bclassify,blabel,bimg From buzz";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

//评测中心
server.get("/assessMent", (req, res) => {
  let sql = "SELECT  aid,atitle,acontent,aimg From assessment";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

//评测中心页面首屏加载前四条的信息
server.get("/measureFourth", (req, res) => {
  let sql =
    "SELECT  lid,ltitle,lcontent,limg,lclassify,ltime From leave_measurement LIMIT 4";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

//评测中心页面全部信息
server.get("/measureMent", (req, res) => {
  let sql =
    "SELECT  lid,ltitle,lcontent,limg,lclassify,ltime From leave_measurement";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

//评测中心页面分类信息
server.get("/measure", (req, res) => {
  let classify = req.query.classify;
  let sql =
    "SELECT  lid,ltitle,lcontent,limg,lclassify,ltime From leave_measurement WHERE lclassify=?";
  pool.query(sql, [classify], (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

//办公电脑
server.get("/office", (req, res) => {
  let sql =
    "SELECT  nid,ntitle,nconfig,nsale,nnumber,nimg,nclassify,nlabel,noffice From note_game WHERE noffice=1";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

// 高清摄像头
server.get("/camera", (req, res) => {
  let sql =
    "SELECT  pid,ptitle,pconfig,psale,pnumber,pimg,pclassify From peripherals WHERE pclassify='摄像头' ";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

// 鼠标
server.get("/mouse", (req, res) => {
  let sql =
    "SELECT  pid,ptitle,pconfig,psale,pnumber,pimg,pclassify From peripherals WHERE pclassify='鼠标' ";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

// 键盘
server.get("/keyboard", (req, res) => {
  let sql =
    "SELECT  pid,ptitle,pconfig,psale,pnumber,pimg,pclassify From peripherals WHERE pclassify='键盘' ";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

// VR专区
server.get("/vrzone", (req, res) => {
  let sql =
    "SELECT  pid,ptitle,pconfig,psale,pnumber,pimg,pclassify From peripherals WHERE pclassify='VR设备 ' ";
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, result: results });
  });
});

//模糊查询
server.get("/fuzzy", (req, res) => {
  let value = req.query.value;
  let sql = `SELECT  id,title,config,img,sale From allinfo WHERE title LIKE '%${value}%' OR config LIKE '%${value}%' OR img LIKE '%${value}%' OR sale LIKE '%${value}%'`;
  pool.query(sql, (err, results) => {
    if (err) throw err;
    if (!results.length)
      res.send({ message: "没有符合条件的结果。", code: 0, result: results });
    else res.send({ message: "模糊查询成功", code: 1, result: results });
  });
});

//查看商品详情
// server.get("/product", (req, res) => {
//   let img = req.query.img;
server.get("/product/:img", (req, res) => {
  let $img = req.params.img;
  let sql = 'SELECT  id,title,config,img,sale,number,classify,label,office,route From allinfo WHERE img=?';
  pool.query(sql,[$img], (err, results) => {
    if (err) throw err;
    if (!results.length){
      res.send({ "message": "查询失败!", "code": 0, "result": results });
    }
    else{
      res.send({ "message": "查询成功!", "code": 1, "result": results[0] });
    } 
  });
});

//购物车添加商品接口post
server.post("/enterCart", (req, res) => {
  let username = req.body.username;
  let count = req.body.count;
  let price = req.body.price;
  let subtitle = req.body.subtitle;
  let img = req.body.img;
  let sql = "INSERT INTO cart(username,count,price,subtitle,img) VALUES(?,?,?,?,?)";
  pool.query(sql, [username, count , price,subtitle,img], (error, results) => {
    if (error) throw error;
    if (results.affectedRows>0) {
      res.send({ message: "添加商品成功", code: 1});
    } else {
      res.send({ message: "添加商品失败", code: 0 });
    }
  });
});

//购物车删除商品接口delete
server.delete("/delete",(req,res)=>{
	let cid=req.query.cid;
	let sql="DELETE FROM cart WHERE cid=?";
	pool.query(sql,[cid],(err,results)=>{
		if(err) throw err;
    if (!results.affectedRows)
    res.send({ message: "删除失败!", code: 0});
  else res.send({ message: "删除成功!", code: 1});
	});
});

//购物车修改商品接口put
server.put("/update", (req, res) => {
  let obj=req.body;
  let sql = 'UPDATE cart SET count=? WHERE cid=?';
  pool.query(sql,[obj.count,obj.cid], (err, results) => {
    if (err) throw err;
    if (!results.affectedRows)
      res.send({ message: "修改失败!", code: 0});
    else res.send({ message: "修改成功!", code: 1 });
  });
});

//购物车查询商品接口get
server.get("/watch", (req, res) => {
  let username = req.query.username;
  let sql = 'SELECT  cid,username,count,price,subtitle,img From cart WHERE username=?';
  pool.query(sql,[username], (err, results) => {
    if (err) throw err;
    if (!results.length)
      res.send({ message: "查看失败!", code: 0, result: results });
    else res.send({ message: "查看成功!", code: 1, result: results });
  });
});

//监听5050，判断服务器是否正常运行
server.listen(port, () => {
  console.log("server is Listening:",port);
});
