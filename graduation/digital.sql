/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 10.1.19-MariaDB : Database - digital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`digital` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `digital`;

/*Table structure for table `allinfo` */

DROP TABLE IF EXISTS `allinfo`;

CREATE TABLE `allinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `title` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品标题',
  `config` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品详情',
  `img` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商品图片',
  `sale` int(11) NOT NULL COMMENT '商品价格',
  `number` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `classify` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品分类',
  `label` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标签',
  `office` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否办公',
  `route` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '路由',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `allinfo` */

insert  into `allinfo`(`id`,`title`,`config`,`img`,`sale`,`number`,`classify`,`label`,`office`,`route`) values (1,'14英寸四核独显轻薄商务便携笔记本电脑','金属游戏本，芯八代六核I7-8750H处理器，GTX1050/4G独显，8G内存，128G固态+1T机械，IPS高清屏','sw.webp',5999,'82FW0209CD','笔记本','游戏笔记本',0,'/notebook'),(2,'15.6英寸游戏笔记本 黑色 80WW000TCD','金属游戏本，芯八代六核I7-8750H处理器，GTX1050/4G独显，8G内存，128G固态+1T机械，IPS高清屏','jsyxb.webp',5999,'82FW0209CD','笔记本','游戏笔记本',0,'/notebook'),(3,'E580 笔记本电脑 20KSA001CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色','E580.webp',10899,'82FW0009CD','笔记本','游戏笔记本',1,'/notebook'),(4,'15.6英寸游戏笔记本 黑色 81HC0007CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色','yxh.webp',5899,'82FW0009CD','笔记本','游戏笔记本',1,'/notebook'),(5,'13.3英寸触控笔记本 天蝎灰 81CT0001CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色','cktx.webp',7599,'82FW0009CD','笔记本','游戏笔记本',1,'/notebook'),(6,'X280 笔记本电脑 20KFA002CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色','X280.webp',6599,'81FW0009CD','笔记本','游戏笔记本',1,'/notebook'),(7,'拯救者 Y7000 15.6英寸游戏笔记本 黑色','81FW0009CD	i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色','zjz.webp',7599,'81FW0009CD','笔记本','游戏笔记本',1,'/notebook'),(8,'ThinkPad T480 笔记本电脑','i5-8250U/Windows 10 家庭版/8GB/1TB+128GB SSD/独显','ThinkPad_T480.webp',8999,'004007','笔记本','轻薄笔记本',1,'/notebook'),(9,'黑武士A56游戏笔记本','吃鸡游戏台式电脑主机（i5-8400 8G B360M GTX1060 6G 1T+128G Win10）搭配购买27英寸曲面窄边框显示器。','hwsa56.webp',5999,'004007','笔记本','游戏台式机',0,'/notebook'),(10,'惠普（HP）暗影精灵23代 游戏台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','hpyx23.webp',4999,NULL,'台式机/一体机',NULL,0,'/desktop'),(11,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i7-8700 16G高频 1T+256GSSD GTX1060 6G独显 三年上门）','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','hp3.jpg',5999,'i5-8400 8G 双硬盘 2','台式机/一体机',NULL,0,'/desktop'),(12,'宏碁（Acer）商祺SQX4270 140N 商用办公台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','Acer140N.jpg',5999,'i5-8400 8G 双硬盘 2','台式机/一体机',NULL,0,'/desktop'),(13,'联想（Lenovo）天逸510S 第八代英特尔酷睿i3 个人商务台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','Lenovo510s.jpg',2999,'i5-8400 8G 双硬盘 2','台式机/一体机',NULL,0,'/desktop'),(14,'戴尔(DELL)灵越3670台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼','DELL3670.jpg',5999,'i5-8400 8G 双硬盘 2','台式机/一体机',NULL,0,'/desktop'),(15,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i5-8400 16G高频 1T+128GSSD GTX1060 6G独显 三年上门）','GTX1060-6G\"十\"力尽显，固态机械双硬盘速容兼顾，绿刃LED锋芒毕露！','hpay3.jpg',6999,'i5-8400 8G 双硬盘 2','台式机/一体机',NULL,0,'/desktop'),(16,'索尼（SONY）WH-1000XM3 高解析度无线蓝牙降噪耳机（触控面板 智能降噪 长久续航）黑色','新款黑科技，超强降噪，佩戴更舒适，快充更方便！','SONYWH_1000XM3.jpg',2899,'SONY225145','游戏耳机',NULL,0,'/peripherals'),(17,'小米米家（MIJIA）智能摄像机 云台版 白色 1080P','1080P高清／ 360度云台全景视角 ／ 微光全彩 ／ 双向语音 / AI 增强移动侦测 / H.265 编码 / 倒置安装 / 红外夜视	199','MIJIA.jpg',199,'MIJIA001257','摄像头',NULL,0,'/camera'),(18,'Pico G2小怪兽2 VR一体机 4K高清视频 体感游戏 VR眼镜 3D头盔','【爆款直降】小怪兽2VR一体机限时直降100元，到手价仅需1899元','Pico_G2.jpg',1899,'VR2658844','VR设备',NULL,0,'/vr'),(19,'联想大红点M120Pro有线鼠标 台式机鼠标 笔记本鼠标','经典大红点系列，按键灵敏，精选耐磨防滑滚轮。','M120Proyxsb.jpg',99,'SB2541001','鼠标',NULL,0,'/peripherals'),(20,'M330 无线静音鼠标 舒适曲线 黑色','M275升级版	舒适曲线 黑色 M275升级版','M330wxsb.jpg',109,'SB2541001','鼠标',NULL,0,'/peripherals'),(21,'全尺寸背光机械游戏键盘 机械键盘 红轴 吃鸡键盘 绝地求生','无线光学鼠标，始于简约，磨砂手感，智能芯片','bgjxyxjp.webp',99,'00SB002','键盘',NULL,0,'/peripherals');

/*Table structure for table `assessment` */

DROP TABLE IF EXISTS `assessment`;

CREATE TABLE `assessment` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评测ID',
  `atitle` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '评测题目',
  `acontent` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '评测内容',
  `aimg` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '评测图片',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `assessment` */

insert  into `assessment`(`aid`,`atitle`,`acontent`,`aimg`) values (1,'大屏轻薄笔记本？17英寸LG gram开箱体验','RTX 20系显卡登陆移动平台可谓是近期笔记本市场最大的事件，虽然第八代酷睿处理器的登场为移动平台带来了六核心的强悍规格...','jxshylz2.webp'),(2,'八千元RTX游戏本真香 惠普暗影精灵4 Pro','RTX独显游戏本的到来是今年初PC领域最受关注的事件之一，而在众多首发产品中，惠普暗影精灵4 Pro可以说是最受追捧的型...','RTX4.webp'),(3,' 一眼即世界 92%屏占比华硕灵耀U 2代体验','华硕顽石热血版YX570U相信很多人都有了解，这款产品采用酷睿低压处理器+GTX1050显卡的配置组合，相比游戏本拥有更...','hslyu2.webp'),(4,' 实测：数据佐证RTX Max-Q版与标准版差多少','与10系显卡先推标准版再推Max-Q版不同，20系RTX显卡登陆游戏本之时，同时推出了标准版和Max-Q版。近期收到多名...','GEFORCEMAC.webp');

/*Table structure for table `buzz` */

DROP TABLE IF EXISTS `buzz`;

CREATE TABLE `buzz` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `btitle` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品标题',
  `bconfig` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品内容',
  `bsale` int(11) NOT NULL COMMENT '商品价格',
  `bnumber` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `bclassify` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品分类',
  `blabel` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标签',
  `bimg` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `buzz` */

insert  into `buzz`(`bid`,`btitle`,`bconfig`,`bsale`,`bnumber`,`bclassify`,`blabel`,`bimg`) values (1,'ThinkPad T480 笔记本电脑','i5-8250U/Windows 10 家庭版/8GB/1TB+128GB SSD/独显',8999,'004107','笔记本','轻薄笔记本','ThinkPad_T480.webp'),(2,'X280 笔记本电脑 20KFA002CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',6599,'81FW0009CD ','笔记本 ','游戏笔记本, 轻薄笔记本 ','X280.webp'),(3,'E580 笔记本电脑 20KSA001CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',10899,' 82FW0009CD','笔记本','游戏笔记本 ','E580.webp'),(4,'惠普（HP）暗影精灵23代 游戏台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼',4999,NULL,'台式机/一体机 ',NULL,'hpyx23.webp'),(5,'戴尔(DELL)灵越3670台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼',5999,'i5-8400 8G 双硬盘 2','台式机/一体机 ',NULL,'hpay3.jpg'),(6,'小米米家（MIJIA）智能摄像机 云台版 白色 1080P','1080P高清／ 360度云台全景视角 ／ 微光全彩 ／ 双向语音 / AI 增强移动侦测 / H.265 编码 / 倒置安装 / 红外夜视',199,'MIJIA001257 ','摄像头',NULL,'MIJIA.jpg'),(7,'M330 无线静音鼠标 舒适曲线 黑色 M275升级版','舒适曲线 黑色 M275升级版',109,'SB2541001','鼠标',NULL,'M330wxsb.jpg'),(8,'全尺寸背光机械游戏键盘 机械键盘 红轴 吃鸡键盘 绝地求生','无线光学鼠标，始于简约，磨砂手感，智能芯片',99,'00SB002','键盘',NULL,'bgjxyxjp.webp');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `username` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户姓名',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `price` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商品价格',
  `subtitle` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品描述',
  `img` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `cart` */

/*Table structure for table `desk_top` */

DROP TABLE IF EXISTS `desk_top`;

CREATE TABLE `desk_top` (
  `did` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `dtitle` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品标题',
  `dconfig` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品内容',
  `dsale` int(11) NOT NULL COMMENT '商品价格',
  `dnumber` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `dclassify` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品分类',
  `dimg` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `desk_top` */

insert  into `desk_top`(`did`,`dtitle`,`dconfig`,`dsale`,`dnumber`,`dclassify`,`dimg`) values (1,'惠普（HP）暗影精灵23代 游戏台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼',4999,'','台式机/一体机','hpyx23.webp'),(2,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i7-8700 16G高频 1T+256GSSD GTX1060 6G独显 三年上门）','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼',5999,'i5-8400 8G 双硬盘 2','台式机/一体机 ','hp3.jpg'),(3,'宏碁（Acer）商祺SQX4270 140N 商用办公台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼',5999,'i5-8400 8G 双硬盘 2','台式机/一体机 ','Acer140N.jpg'),(4,'联想（Lenovo）天逸510S 第八代英特尔酷睿i3 个人商务台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼',2999,'i5-8400 8G 双硬盘 2','台式机/一体机 ','Lenovo510s.jpg'),(5,'戴尔(DELL)灵越3670台式电脑主机','全新戴尔灵越酷睿8代超窄边框一体机京东首发，IPS高清大屏，隐藏式摄像头，首发3重好礼',5999,'i5-8400 8G 双硬盘 2','台式机/一体机 ','DELL3670.jpg'),(6,'惠普（HP）暗影精灵3代 游戏台式电脑主机（i5-8400 16G高频 1T+128GSSD GTX1060 6G独显 三年上门）','GTX1060-6G\"十\"力尽显，固态机械双硬盘速容兼顾，绿刃LED锋芒毕露！',6999,'i5-8400 8G 双硬盘 2','台式机/一体机 ','hpay3.jpg');

/*Table structure for table `leave_measurement` */

DROP TABLE IF EXISTS `leave_measurement`;

CREATE TABLE `leave_measurement` (
  `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评测ID',
  `ltitle` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '评测标题',
  `lcontent` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '评测内容',
  `limg` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '评测图片',
  `ltime` datetime NOT NULL COMMENT '评测时间',
  `lclassify` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '测评分类',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `leave_measurement` */

insert  into `leave_measurement`(`lid`,`ltitle`,`lcontent`,`limg`,`ltime`,`lclassify`) values (1,'	大屏轻薄笔记本？17英寸LG gram开箱体验','RTX 20系显卡登陆移动平台可谓是近期笔记本市场最大的事件，虽然第八代酷睿处理器的登场为移动平台带来了六核心的强悍规格，但颇为“长寿”的10系显卡始终是一些消费者换机的...','jxshylz2.webp','2019-03-05 00:00:00','技术分析'),(2,'八千元RTX游戏本真香 惠普暗影精灵4 Pro','RTX独显游戏本的到来是今年初PC领域最受关注的事件之一，而在众多首发产品中，惠普暗影精灵4 Pro可以说是最受追捧的型号之一，这是因为惠普暗影精灵4 Pro在拥有RTX...','RTX4.webp','2019-03-05 00:00:00','行业新闻'),(3,'一眼即世界 92%屏占比华硕灵耀U 2代体验','华硕顽石热血版YX570U相信很多人都有了解，这款产品采用酷睿低压处理器+GTX1050显卡的配置组合，相比游戏本拥有更加时尚内敛的外观设计，只不过堪比游戏本的售价让人有...','hslyu2.webp','2019-03-05 00:00:00','行业新闻'),(4,'实测：数据佐证RTX Max-Q版与标准版差多少','与10系显卡先推标准版再推Max-Q版不同，20系RTX显卡登陆游戏本之时，同时推出了标准版和Max-Q版。近期收到多名网友咨询同一型号下两者性能相差多少的问题，相信很多...','GEFORCEMAC.webp','2019-03-05 00:00:00','行业新闻'),(5,'锐不可当！华硕顽石YX570锐龙版游戏测试','华硕顽石热血版YX570U相信很多人都有了解，这款产品采用酷睿低压处理器+GTX1050显卡的配置组合，相比游戏本拥有更加时尚内敛的外观设计，只不过堪比游戏本的售价让人有...','hsws570.webp','2019-01-07 00:00:00','技术分析'),(6,'极致体验性能爆表 惠普暗影精灵4 Pro游戏测试','RTX独显游戏本的到来是今年初PC领域最受关注的事件之一，而在众多首发产品中，惠普暗影精灵4 Pro可以说是最受追捧的型号之一，这是因为惠普暗影精灵4 Pro在拥有RT...','RTX4.webp','2017-05-16 00:00:00','技术分析'),(7,'APEX英雄玩家必看 光影精灵4的实测表现强劲','最近，《APEX英雄》火到已经被作弊器团队盯上了，网传腾讯也在与EA洽谈国服代理事宜。那么目前主流游戏本运行《APEX英雄》会有怎样表现呢，此次我们使用惠普光影精灵4绿刃...','APEX4.webp','2017-05-16 00:00:00','技术分析'),(8,'RTX时代来临 机械革命深海幽灵Z2评测','华硕顽石热血版YX570U相信很多人都有了解，这款产品采用酷睿低压处理器+GTX1050显卡的配置组合，相比游戏本拥有更加时尚内敛的外观设计，只不过堪比游戏本的售价让人有...','jxshylz2.webp','2017-05-16 00:00:00','行业新闻');

/*Table structure for table `note_game` */

DROP TABLE IF EXISTS `note_game`;

CREATE TABLE `note_game` (
  `nid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `ntitle` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品标题',
  `nconfig` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品内容',
  `nsale` int(11) NOT NULL COMMENT '商品价格',
  `nnumber` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '商品编号',
  `nclassify` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品分类',
  `nlabel` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标签',
  `nimg` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商品图片',
  `noffice` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否办公',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `note_game` */

insert  into `note_game`(`nid`,`ntitle`,`nconfig`,`nsale`,`nnumber`,`nclassify`,`nlabel`,`nimg`,`noffice`) values (1,'14英寸四核独显轻薄商务便携笔记本电脑','金属游戏本，芯八代六核I7-8750H处理器，GTX1050/4G独显，8G内存，128G固态+1T机械，IPS高清屏',5999,'82FW0209CD','笔记本','游戏笔记本','sw.webp',0),(2,'15.6英寸游戏笔记本 黑色 80WW000TCD','金属游戏本，芯八代六核I7-8750H处理器，GTX1050/4G独显，8G内存，128G固态+1T机械，IPS高清屏',5999,'82FW0209CD ','笔记本','游戏笔记本','jsyxb.webp',0),(3,'E580 笔记本电脑 20KSA001CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',10899,'82FW0009CD ','笔记本','游戏笔记本','E580.webp',1),(4,'15.6英寸游戏笔记本 黑色 81HC0007CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',5899,'82FW0009CD ','笔记本','游戏笔记本','yxh.webp',1),(5,'13.3英寸触控笔记本 天蝎灰 81CT0001CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',7599,'82FW0009CD','笔记本','游戏笔记本','cktx.webp',1),(6,'X280 笔记本电脑 20KFA002CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',6599,'81FW0009CD','笔记本','游戏笔记本','X280.webp',1),(7,'拯救者 Y7000 15.6英寸游戏笔记本 黑色 81FW0009CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',7599,'81FW0009CD ','笔记本','游戏笔记本','zjz.webp',1),(8,'ThinkPad T480 笔记本电脑','i5-8250U/Windows 10 家庭版/8GB/1TB+128GB SSD/独显',8999,'004107','笔记本','轻薄笔记本','ThinkPad_T480.webp',1),(9,'黑武士A56游戏笔记本','吃鸡游戏台式电脑主机（i5-8400 8G B360M GTX1060 6G 1T+128G Win10）搭配购买27英寸曲面窄边框显示器。',5999,'004007','笔记本','游戏台式机','hwsa56.webp',0);

/*Table structure for table `peripherals` */

DROP TABLE IF EXISTS `peripherals`;

CREATE TABLE `peripherals` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `ptitle` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品标题',
  `pconfig` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品内容',
  `psale` int(11) NOT NULL COMMENT '商品价格',
  `pnumber` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `pclassify` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品分类',
  `pimg` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `peripherals` */

insert  into `peripherals`(`pid`,`ptitle`,`pconfig`,`psale`,`pnumber`,`pclassify`,`pimg`) values (1,'索尼（SONY）WH-1000XM3 高解析度无线蓝牙降噪耳机（触控面板 智能降噪 长久续航）黑色','新款黑科技，超强降噪，佩戴更舒适，快充更方便！',2899,'SONY225145','游戏耳机','SONYWH_1000XM3.jpg'),(2,'小米米家（MIJIA）智能摄像机 云台版 白色 1080P','1080P高清／ 360度云台全景视角 ／ 微光全彩 ／ 双向语音 / AI 增强移动侦测 / H.265 编码 / 倒置安装 / 红外夜视',199,'MIJIA001257 ','摄像头','MIJIA.jpg'),(3,'Pico G2小怪兽2 VR一体机 4K高清视频 体感游戏 VR眼镜 3D头盔','【爆款直降】小怪兽2VR一体机限时直降100元，到手价仅需1899元',1899,'VR2658844 ','VR设备 ','Pico_G2.jpg'),(4,'联想大红点M120Pro有线鼠标 台式机鼠标 笔记本鼠标','经典大红点系列，按键灵敏，精选耐磨防滑滚轮。',99,'SB2541001 ','鼠标 ','M120Proyxsb.jpg'),(5,'M330 无线静音鼠标 舒适曲线 黑色 M275升级版','舒适曲线 黑色 M275升级版',109,'SB2541001 ','鼠标 ','M330wxsb.jpg'),(6,'全尺寸背光机械游戏键盘 机械键盘 红轴 吃鸡键盘 绝地求生','无线光学鼠标，始于简约，磨砂手感，智能芯片',99,'00SB002 ','键盘 ','bgjxyxjp.webp');

/*Table structure for table `recom_item` */

DROP TABLE IF EXISTS `recom_item`;

CREATE TABLE `recom_item` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `rtitle` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品标题',
  `rconfig` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品内容',
  `rsale` int(11) NOT NULL COMMENT '商品价格',
  `rnumber` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '商品编号',
  `rclassify` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品分类',
  `rlabel` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标签',
  `rimg` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `recom_item` */

insert  into `recom_item`(`rid`,`rtitle`,`rconfig`,`rsale`,`rnumber`,`rclassify`,`rlabel`,`rimg`) values (1,'拯救者 Y7000 15.6英寸游戏笔记本 黑色 81FW0009CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',7599,'81FW0009CD','笔记本','游戏笔记本','zjz.webp'),(2,'14英寸四核独显轻薄商务便携笔记本电脑','金属游戏本，芯八代六核I7-8750H处理器，GTX1050/4G独显，8G内存，128G固态+1T机械，IPS高清屏',5999,'82FW0209CD','笔记本','游戏笔记本','sw.webp'),(3,'15.6英寸游戏笔记本 黑色 81HC0007CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',5899,'82FW0009CD ','笔记本','游戏笔记本','yxh.webp'),(4,'13.3英寸触控笔记本 天蝎灰 81CT0001CD','i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色',7599,'82FW0009CD ','笔记本','游戏笔记本','cktx.webp'),(5,'ThinkPad T480 笔记本电脑','i5-8250U/Windows 10 家庭版/8GB/1TB+128GB SSD/独显',8999,'004107 ','笔记本','游戏笔记本','ThinkPad_T480.webp');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `uname` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `upwd` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户密码',
  `uphone` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '用户电话',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user` */

insert  into `user`(`uid`,`uname`,`upwd`,`uphone`) values (1,'十三幺','5cc97f791bface645725c00bfd08345b','18875005120'),(2,'小叶子','25f9e794323b453885f5181f1b624d0b','18875005121'),(3,'shisan','e10adc3949ba59abbe56e057f20f883e','15826039018');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
