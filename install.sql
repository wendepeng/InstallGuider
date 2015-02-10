DROP TABLE IF EXISTS hs_user;
CREATE TABLE hs_user (
  `userid` int(11) NOT NULL auto_increment,
  `username` varchar(16) NOT NULL,
  `password` varchar(50) NOT NULL,
  `niname` varchar(15) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthday` date NOT NULL,
  `email` char(50) NOT NULL,
  `location` varchar(30) NOT NULL,
  `visible` tinyint(4) NOT NULL,
  `regdateline` int(10) NOT NULL,
  `regip` varchar(16) NOT NULL,
  `groupid` tinyint(1) NOT NULL,
  PRIMARY KEY  (`userid`)
) TYPE=MyISAM;
INSERT INTO hs_user (`userid`, `username`, `password`, `niname`, `gender`, `birthday`, `email`, `location`, `visible`, `regdateline`, `regip`, `groupid`) VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '僭燮水', 1, '1984-12-24', 'jianxieshui@gmail.com', 'http://www.ccvita.com/', 1, 1161696254, '127.0.0.1', 1);

DROP TABLE IF EXISTS hs_uservita;
CREATE TABLE hs_uservita (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `userid` int(11) NOT NULL,
  `skinpath` varchar(8) NOT NULL,
  `name` varchar(15) NOT NULL,
  `gender` tinyint(1) unsigned NOT NULL,
  `birthday` date NOT NULL,
  `years` int(6) unsigned NOT NULL,
  `nation` varchar(6) NOT NULL,
  `visage` varchar(6) NOT NULL,
  `school` varchar(15) NOT NULL,
  `specialty` varchar(6) NOT NULL,
  `address` varchar(100) NOT NULL,
  `postalcode` int(6) unsigned NOT NULL,
  `relation` varchar(100) NOT NULL,
  `email` char(50) NOT NULL,
  `location` varchar(30) NOT NULL,
  `intro` mediumtext NOT NULL,
  `education` mediumtext NOT NULL,
  `ability` mediumtext NOT NULL,
  `experience` mediumtext NOT NULL,
  `superfluity` mediumtext NOT NULL,
  `description` varchar(10) NOT NULL,
  `edittime` int(10) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;
INSERT INTO hs_uservita (`id`, `userid`, `skinpath`, `name`, `gender`, `birthday`, `years`, `nation`, `visage`, `school`, `specialty`, `address`, `postalcode`, `relation`, `email`, `location`, `intro`, `education`, `ability`, `experience`, `superfluity`, `description`, `edittime`, `visible`) VALUES (1, 1, 'sky', '陈陈', 1, '1984-12-24', 21, '汉', '团员', '合肥工业大学', '自动化专业', '安徽省合肥市合肥工业大学南区628信箱', 230601, '手机：13955140525  寝室电话：0551-2920335', 'jianxieshui@gmai.com', 'http://www.ccvita.com', '本人极其热爱计算机与自动化工业技术，思维活跃、喜好专研、善于分析、有一定的创造力，具有良好的团队合作能力，工作认真负责、精益求精、勤劳能干、忠于职守、待人处事较为完善，乐意作他人友好的听者。在单片机、Matlab系统仿真、PLC、网站管理及网页制作、电脑维护、网络维护等技术方面有一定的实践经验。', '[B]2003.09 — 2007.06[/B]  工学学士                 合肥工业大学电气学院', '[B]2006—2007[/B] 学年度，担任大学生发展网络教育中心技术部主任\r\n[B]2005—2006[/B] 学年度，校团委网络助理\r\n[B]2004—2005[/B] 学年度，院学生会科技部副部长\r\n[B]2003—2004[/B] 学年度，在校网络中心任职，协助网络中心进行各项项目开发获得荣誉\r\n[B]2003—2004[/B] 学年度 合肥工业大学新生入学奖学金一等奖。\r\n[B]2003—2004[/B] 学年度 合肥工业大学单项奖学金----社会活动奖学金\r\n[B]2004—2005[/B] 学年度 合肥工业大学单项奖学金----社会实践奖学金\r\n[B]2004—2005[/B] 学年度 大学生科技与创新协会评议表彰中，被校团委授予“科技活动积极分”称号\r\n', '2006.10  [URL=http://www1.hfut.edu.cn/department/cailiao/]合肥工业大学材料科学与工程学院网页[/URL]\r\n2006.09  [URL=http://www1.hfut.edu.cn/studentlife/xueshenghui/]合肥工业大学大学生联合会网页[/URL]\r\n2006.07  [URL=http://www1.hfut.edu.cn/organ/tuanwei/xskj/]合肥工业大学“合工大影像”摄影网[/URL]\r\n2006.03  [URL=http://www1.hfut.edu.cn/organ/tuanwei/xskj/]“斛兵杯”学术科技作品竞赛网页[/URL]\r\n2006.01  [URL=http://www1.hfut.edu.cn/department/cailiao/zzxh/]安徽铸造学会网页[/URL]\r\n2005.08  [URL=http://www1.hfut.edu.cn/organ/tuanwei/]共青团合肥工业大学委员会网页[/URL]\r\n2005.06  [URL=http://www1.hfut.edu.cn/organ/xgb/]合肥工业大学学工部[/URL]\r\n2005.06  [URL=http://www1.hfut.edu.cn/organ/xgyd/]合肥工业大学学生政工干部之家[/URL]\r\n2005.05  [URL=http://www1.hfut.edu.cn/organ/kexie/]大学生科技与创新协会网页[/URL] \r\n2004.08  [URL=http://www1.hfut.edu.cn/fch/]合肥工业大学翡翠湖校区网页[/URL]\r\n\r\n[B]在校任职[/B]\r\n2006—2007 学年度，担任大学生发展网络教育中心技术部门主任\r\n相关成绩：建设两大品牌门户网站：“工大学子”（学生门户社区）、“明理苑”（素质教育门户）；2006年5月“明理苑”被中国大学生在线评为“全国高校十佳思政类网站”；\r\n2005—2006 学年度，担任院校学生会网络部部长、校团委网络助理\r\n相关成绩：获得第三届、第四届合肥工业大学网络作品设计大赛分别获得第二名、二等奖；\r\n加入创业中心志信网创业团队、并建立校团委网站。\r\n2004—2005 学年度，担任院学生会网络部副部长\r\n相关成绩：协助学生会举办网络作品设计大赛，并获得网络作品设计大赛二等奖。\r\n2003—2004 学年度，在校网络中心任职\r\n相关成绩：协助网络中心进行各项项目开发，这也是我PHP程序开始的时候\r\n\r\n[B]获得荣誉[/B]\r\n2003—2004 学年度 合肥工业大学新生入学奖学金一等奖。\r\n2003—2004 学年度 合肥工业大学单项奖学金----社会活动奖学金\r\n2004—2005 学年度 合肥工业大学单项奖学金----社会实践奖学金\r\n2004—2005 学年度 大学生科技与创新协会评议表彰中，被校团委授予“科技活动积极分子”称号\r\n', '[B]特长[/B]： 体现团队精神的运动，如足球、篮球、排球。\r\n[B]兴趣爱好[/B]： 计算机网络，网站建设，软件测试。    \r\n[B]专业课程[/B]： 电路、模拟电子技术、数字电子技术、电力电子技术、电机与拖动、自动控制理论、现代控制理论、检测与转换技术、计算机软件技术基础、微机原理及接口技术、单片机原理及应用、电气控制与PLC、控制系统仿真与CAD技术  、Matlab系统仿真\r\n效果', '再测试', 1161892559, 1);

DROP TABLE IF EXISTS hs_vitaskin;
CREATE TABLE hs_vitaskin (
  `skinid` mediumint(8) unsigned NOT NULL auto_increment,
  `skinname` varchar(15) NOT NULL,
  `skinpath` varchar(30) NOT NULL,
  `author` varchar(10) NOT NULL,
  `addtime` int(10) NOT NULL,
  `description` varchar(30) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY  (`skinid`)
) TYPE=MyISAM;
INSERT INTO hs_vitaskin (`skinid`, `skinname`, `skinpath`, `author`, `addtime`, `description`, `visible`) VALUES (1, 'CcVita默认简历', 'default', '僭燮水', 1141829214, '简洁明快', 1),
(2, '小桥流水', 'sky', '僭燮水', 1151829214, '小桥流水是多么美好啊', 1);