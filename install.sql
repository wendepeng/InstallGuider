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
INSERT INTO hs_user (`userid`, `username`, `password`, `niname`, `gender`, `birthday`, `email`, `location`, `visible`, `regdateline`, `regip`, `groupid`) VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '����ˮ', 1, '1984-12-24', 'jianxieshui@gmail.com', 'http://www.ccvita.com/', 1, 1161696254, '127.0.0.1', 1);

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
INSERT INTO hs_uservita (`id`, `userid`, `skinpath`, `name`, `gender`, `birthday`, `years`, `nation`, `visage`, `school`, `specialty`, `address`, `postalcode`, `relation`, `email`, `location`, `intro`, `education`, `ability`, `experience`, `superfluity`, `description`, `edittime`, `visible`) VALUES (1, 1, 'sky', '�³�', 1, '1984-12-24', 21, '��', '��Ա', '�Ϸʹ�ҵ��ѧ', '�Զ���רҵ', '����ʡ�Ϸ��кϷʹ�ҵ��ѧ����628����', 230601, '�ֻ���13955140525  ���ҵ绰��0551-2920335', 'jianxieshui@gmai.com', 'http://www.ccvita.com', '���˼����Ȱ���������Զ�����ҵ������˼ά��Ծ��ϲ��ר�С����ڷ�������һ���Ĵ��������������õ��ŶӺ����������������渺�𡢾����󾫡������ܸɡ�����ְ�ء����˴��½�Ϊ���ƣ������������Ѻõ����ߡ��ڵ�Ƭ����Matlabϵͳ���桢PLC����վ������ҳ����������ά��������ά���ȼ���������һ����ʵ�����顣', '[B]2003.09 �� 2007.06[/B]  ��ѧѧʿ                 �Ϸʹ�ҵ��ѧ����ѧԺ', '[B]2006��2007[/B] ѧ��ȣ����δ�ѧ����չ����������ļ���������\r\n[B]2005��2006[/B] ѧ��ȣ�У��ί��������\r\n[B]2004��2005[/B] ѧ��ȣ�Ժѧ����Ƽ���������\r\n[B]2003��2004[/B] ѧ��ȣ���У����������ְ��Э���������Ľ��и�����Ŀ�����������\r\n[B]2003��2004[/B] ѧ��� �Ϸʹ�ҵ��ѧ������ѧ��ѧ��һ�Ƚ���\r\n[B]2003��2004[/B] ѧ��� �Ϸʹ�ҵ��ѧ���ѧ��----�����ѧ��\r\n[B]2004��2005[/B] ѧ��� �Ϸʹ�ҵ��ѧ���ѧ��----���ʵ����ѧ��\r\n[B]2004��2005[/B] ѧ��� ��ѧ���Ƽ��봴��Э����������У���У��ί���衰�Ƽ�������֡��ƺ�\r\n', '2006.10  [URL=http://www1.hfut.edu.cn/department/cailiao/]�Ϸʹ�ҵ��ѧ���Ͽ�ѧ�빤��ѧԺ��ҳ[/URL]\r\n2006.09  [URL=http://www1.hfut.edu.cn/studentlife/xueshenghui/]�Ϸʹ�ҵ��ѧ��ѧ�����ϻ���ҳ[/URL]\r\n2006.07  [URL=http://www1.hfut.edu.cn/organ/tuanwei/xskj/]�Ϸʹ�ҵ��ѧ���Ϲ���Ӱ����Ӱ��[/URL]\r\n2006.03  [URL=http://www1.hfut.edu.cn/organ/tuanwei/xskj/]����������ѧ���Ƽ���Ʒ������ҳ[/URL]\r\n2006.01  [URL=http://www1.hfut.edu.cn/department/cailiao/zzxh/]��������ѧ����ҳ[/URL]\r\n2005.08  [URL=http://www1.hfut.edu.cn/organ/tuanwei/]�����źϷʹ�ҵ��ѧίԱ����ҳ[/URL]\r\n2005.06  [URL=http://www1.hfut.edu.cn/organ/xgb/]�Ϸʹ�ҵ��ѧѧ����[/URL]\r\n2005.06  [URL=http://www1.hfut.edu.cn/organ/xgyd/]�Ϸʹ�ҵ��ѧѧ�������ɲ�֮��[/URL]\r\n2005.05  [URL=http://www1.hfut.edu.cn/organ/kexie/]��ѧ���Ƽ��봴��Э����ҳ[/URL] \r\n2004.08  [URL=http://www1.hfut.edu.cn/fch/]�Ϸʹ�ҵ��ѧ����У����ҳ[/URL]\r\n\r\n[B]��У��ְ[/B]\r\n2006��2007 ѧ��ȣ����δ�ѧ����չ����������ļ�����������\r\n��سɼ�����������Ʒ���Ż���վ��������ѧ�ӡ���ѧ���Ż���������������Է�������ʽ����Ż�����2006��5�¡�����Է�����й���ѧ��������Ϊ��ȫ����Уʮ��˼������վ����\r\n2005��2006 ѧ��ȣ�����ԺУѧ�������粿������У��ί��������\r\n��سɼ�����õ����졢���Ľ�Ϸʹ�ҵ��ѧ������Ʒ��ƴ����ֱ��õڶ��������Ƚ���\r\n���봴ҵ����־������ҵ�Ŷӡ�������У��ί��վ��\r\n2004��2005 ѧ��ȣ�����Ժѧ�������粿������\r\n��سɼ���Э��ѧ����ٰ�������Ʒ��ƴ����������������Ʒ��ƴ������Ƚ���\r\n2003��2004 ѧ��ȣ���У����������ְ\r\n��سɼ���Э���������Ľ��и�����Ŀ��������Ҳ����PHP����ʼ��ʱ��\r\n\r\n[B]�������[/B]\r\n2003��2004 ѧ��� �Ϸʹ�ҵ��ѧ������ѧ��ѧ��һ�Ƚ���\r\n2003��2004 ѧ��� �Ϸʹ�ҵ��ѧ���ѧ��----�����ѧ��\r\n2004��2005 ѧ��� �Ϸʹ�ҵ��ѧ���ѧ��----���ʵ����ѧ��\r\n2004��2005 ѧ��� ��ѧ���Ƽ��봴��Э����������У���У��ί���衰�Ƽ���������ӡ��ƺ�\r\n', '[B]�س�[/B]�� �����ŶӾ�����˶�����������������\r\n[B]��Ȥ����[/B]�� ��������磬��վ���裬������ԡ�    \r\n[B]רҵ�γ�[/B]�� ��·��ģ����Ӽ��������ֵ��Ӽ������������Ӽ�����������϶����Զ��������ۡ��ִ��������ۡ������ת��������������������������΢��ԭ���ӿڼ�������Ƭ��ԭ��Ӧ�á�����������PLC������ϵͳ������CAD����  ��Matlabϵͳ����\r\nЧ��', '�ٲ���', 1161892559, 1);

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
INSERT INTO hs_vitaskin (`skinid`, `skinname`, `skinpath`, `author`, `addtime`, `description`, `visible`) VALUES (1, 'CcVitaĬ�ϼ���', 'default', '����ˮ', 1141829214, '�������', 1),
(2, 'С����ˮ', 'sky', '����ˮ', 1151829214, 'С����ˮ�Ƕ�ô���ð�', 1);