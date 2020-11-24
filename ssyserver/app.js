var createError = require("http-errors");
var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");

const cors = require("cors");

var indexRouter = require("./routes/index");
var registerRouter = require("./routes/register");
var loginRouter = require("./routes/login");
var recomItemRouter = require("./routes/recomItem");
var noteGameRouter = require("./routes/noteGame");
var deskTopRouter = require("./routes/deskTop");
var peripheralsSeriesRouter = require("./routes/peripheralsSeries");
var buzzRouter = require("./routes/buzz");
var assessMentRouter = require("./routes/assessMent");
var measureFourthRouter = require("./routes/measureFourth");
var measureMentRouter = require("./routes/measureMent");
var measureRouter = require("./routes/measure");
var officeRouter = require("./routes/office");
var cameraRouter = require("./routes/camera");
var mouseRouter = require("./routes/mouse");
var keyboardRouter = require("./routes/keyboard");
var vrzoneRouter = require("./routes/vrzone");
var fuzzyRouter = require("./routes/fuzzy");
var productRouter = require("./routes/product");
var enterCartRouter = require("./routes/enterCart");
var deleteRouter = require("./routes/delete");
var watchRouter = require("./routes/watch");
var updateRouter = require("./routes/update");

var detailsRouter = require("./routes/details");

var app = express();

app.use(
  cors({
    origin: [
      //允许跨域的客户端源头有哪些
      "http://localhost:8080", //vue脚手架
      "http://127.0.0.1:5500", //live server
      "http://digital.applinzi.com", //新浪云上的vue项目
    ],
    credentials: true, //要求允许携带cookie
  })
);

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

app.use("/", indexRouter);
app.use("/register", registerRouter);
app.use("/login", loginRouter);
app.use("/recomItem", recomItemRouter);
app.use("/noteGame", noteGameRouter);
app.use("/deskTop", deskTopRouter);
app.use("/peripheralsSeries", peripheralsSeriesRouter);
app.use("/buzz", buzzRouter);
app.use("/assessMent", assessMentRouter);
app.use("/measureFourth", measureFourthRouter);
app.use("/measureMent", measureMentRouter);
app.use("/measure", measureRouter);
app.use("/office", officeRouter);
app.use("/camera", cameraRouter);
app.use("/mouse", mouseRouter);
app.use("/keyboard", keyboardRouter);
app.use("/vrzone", vrzoneRouter);
app.use("/fuzzy", fuzzyRouter);
app.use("/product", productRouter);
app.use("/enterCart", enterCartRouter);
app.use("/delete", deleteRouter);
app.use("/watch", watchRouter);
app.use("/update", updateRouter);

app.use("/details", detailsRouter);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;
