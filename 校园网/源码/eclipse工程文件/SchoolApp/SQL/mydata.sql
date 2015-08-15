create database mydata;									
use mydata;
drop table myadmin;
drop table myuser;
drop table monthchoose;
drop table softworddesign;
drop table myblog;
drop table mydiscuss;


create table myadmin                       			-- 管理员表
(			
	id int primary key auto_increment,				-- 管理员id
	myusername varchar(50),							-- 管理员用户名
	mypassword varchar(50),							-- 管理员密码
	mytype varchar(50),								-- 管理员等级								
	grade int										-- 管理员等级
);

create table myuser									-- 用户表			
(
	id int primary key auto_increment,				-- 用户id
	myusername varchar(50),							-- 用户用户名
	password varchar(50),							-- 用户密码
	nickname varchar(50),							-- 用户昵称
	place varchar(255),								-- 用户籍贯
	sex varchar(2),									-- 用户性别
	insititute varchar(20),							-- 用户学院
	class int,										-- 用户班级
	moblie varchar(20),								-- 用户手机号
	qq varchar(20),									-- 用户qq
	major varchar(30),								-- 用户专业
	bedroom int										-- 用户寝室号		
);


create table matchlist								-- 赛事信息表
(
	id int primary key auto_increment,				-- 序号
	matchtype int,									-- 赛事序号	
	person1 varchar(50),							-- 队员1
	person2 varchar(50),							-- 队员2
	person3 varchar(50),							-- 队员3
	person4 varchar(50),							-- 队员4
	person5 varchar(50),							-- 队员5
	tel varchar(50),								-- 联系方式
	insititute varchar(50),							-- 学院
	title varchar(50),								-- 题目
	ourwork text,									-- 分工情况
	teacher varchar(50),							-- 指导老师
	remarks text,									-- 备注
	garde varchar(10)								-- 获奖等级	
);

create table mymatch								-- 比赛表
(
	id int primary key auto_increment,				-- 序号 
	insititute varchar(50),							-- 学院
	matchtype varchar(50),							-- 赛事名称
	servey varchar(50)								-- 赛事简介
);

insert into mymatch value(null,'软件学院','软件创新设计大赛1','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'软件学院','软件创新设计大赛2','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'软件学院','软件创新设计大赛3','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'软件学院','软件创新设计大赛4','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'软件学院','软件创新设计大赛5','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'软件学院','软件创新设计大赛6','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'软件学院','软件创新设计大赛7','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'软件学院','软件创新设计大赛8','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'软件学院','软件创新设计大赛9','aaaaaaaaaaaaaaaaa');



create table myblog									-- 博文表	
(	
	id int primary key auto_increment,				-- 文章编号
	title varchar(255),								-- 文章标题
	myusername varchar(50),							-- 作者姓名，参考用户表的名字
	mydata varchar(50),								-- 发表时间
	insititute varchar(20),							-- 作者所在学院
	article text,									-- 正文
	approval int,									-- 赞成数
	oppse int										-- 反对数
);

insert into myblog value(null,'aa','aa','2012-3-6','软件学院','aaaaaa','88','11');
insert into myblog value(null,'bb','aa','2012-3-6','软件学院','aaaaaa','88','11');
insert into myblog value(null,'cc','aa','2012-3-6','软件学院','aaaaaa','88','11');
insert into myblog value(null,'dd','aa','2012-3-6','软件学院','aaaaaa','88','11');
insert into myblog value(null,'ee','aa','2012-3-6','软件学院','aaaaaa','88','11');
insert into myblog value(null,'ff','aa','2012-3-6','软件学院','aaaaaa','88','11');
insert into myblog value(null,'gg','aa','2012-3-6','软件学院','aaaaaa','88','11');
insert into myblog value(null,'hh','aa','2012-3-6','软件学院','aaaaaa','88','11');
insert into myblog value(null,'ii','aa','2012-3-6','软件学院','aaaaaa','88','11');
insert into myblog value(null,'jj','aa','2012-3-6','软件学院','aaaaaa','88','11');

create table mydiscuss 								-- 博文评论表	
(	
	id int,											-- 文章编号，参考博文表的id
	nickname varchar(50),							-- 评论者昵称
	discuss text									-- 评论内容
);

-- 组织专区
create table organization							-- 组织表
(
	id int primary key auto_increment,				-- 组织编号
	name varchar(50),                               -- 组织名称
	insititute varchar(20),							-- 所属学院
	servey varchar(255),							-- 组织简介
	image varchar(50),								-- 图片
	organtime varchar(50)							-- 创建时间
		
);

insert into organization value(null,'学生会','软件学院','软件学院学生会','aa','2012-12-23');
insert into organization value(null,'E01软件信息协会','软件学院','软件学院学生会','aa','2012-12-23');
insert into organization value(null,'团委','软件学院','软件学院学生会','aa','2012-12-23');
insert into organization value(null,'规划团','软件学院','软件学院学生会','aa','2012-12-23');
insert into organization value(null,'学生会','农学院','软件学院学生会','aa','2012-12-23');
insert into organization value(null,'三农协会','农学院','软件学院学生会','aa','2012-12-23');

create table myorgan								-- 组织成员表			
(											
	id int primary key auto_increment,				-- 申请者编号
	organ int, 										-- 组织编号
	job	varchar(50),								-- 职位
	myname varchar(50),								-- 申请者姓名
	mysex varchar(2),								-- 性别
	myinsititute varchar(20),						-- 学院
	myclass int,									-- 班级
	mytel varchar(50),								-- 电话
	myqq varchar(50),								-- QQ
	mybedroom int,									-- 寝室号
	myaccount text,									-- 申请理由
	myappraise text,								-- 自我评价
	istrue int										-- 是否同意成为组员			
);

insert into myorgan value(null,'2','会长','aa','男','软件学院','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','网络部部长','aa','男','软件学院','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','aa','aa','男','软件学院','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','ww','aa','男','软件学院','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','rr','aa','男','软件学院','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','tt','aa','男','软件学院','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','yy','aa','男','软件学院','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','uu','aa','男','软件学院','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','ii','aa','男','软件学院','1203','111111111','121223213','3420','aaaa','aaaaa','1');
 
-- 专业专区
create table major
(
	id int primary key auto_increment,				-- 专业编号
	majorname varchar(255),							-- 专业名称
	insititute varchar(20),							-- 所属学院			
	synopsis text,									-- 专业简介
	image varchar(50),								-- 图片
	majortime varchar(20)							-- 创建时间
);

create table majordis								-- 专业帖表
(
	id int,											-- 参考专业编号
	title varchar(255),								-- 标题
	author varchar(50),								-- 作者
	distime varchar(50),							-- 发帖时间
	distext text									-- 帖子内容
);

create table newstu
(
	id int primary key auto_increment,  			-- 文件编号
	filename varchar(255)							-- 文件名称
);

create table speak									-- 说说表
(
	id int primary key auto_increment,  			-- 说说编号
	speakname varchar(50),							-- 发表作者
	speaktime varchar(50),							-- 发表时间
	mytext text										-- 发表内容
);


create table houseinfo							   	-- 租房信息表		
(
	id int primary key auto_increment,  			-- 信息编号
	housename varchar(50),							-- 房屋所有人
	houseplace text,								-- 房屋地点
	housemoney varchar(50),							-- 租金
	housephone varchar(50),							-- 联系电话
	housetime varchar(50)							-- 发表时间 
);

insert into houseinfo value(null,'aa','江西农大后街','123','13020320320','2012-6-29');
insert into houseinfo value(null,'aa','江西农大前街','123','13020320320','2012-6-29');
insert into houseinfo value(null,'aa','江西财大后街','123','13020320320','2012-6-29');
insert into houseinfo value(null,'aa','南昌大学后街','123','13020320320','2012-6-29');
insert into houseinfo value(null,'aa','华东交通大学后街','123','13020320320','2012-6-29');
insert into houseinfo value(null,'aa','下罗','123','13020320320','2012-6-29');


insert into speak value(null,'aa','2012-1-6','谁谁谁谁谁谁的三大打算打算大的');
insert into speak value(null,'aa','2014-1-6','谁谁谁谁谁谁的三大打算打算大的');
insert into speak value(null,'aa','2011-1-6','谁谁谁谁谁谁的三大打算打算大的');
insert into speak value(null,'aa','2012-1-6','谁谁谁谁谁谁的三大打算打算大的');
insert into speak value(null,'aa','2013-1-6','谁谁谁谁谁谁的三大打算打算大的');
insert into speak value(null,'aa','2014-1-6','谁谁谁谁谁谁的三大打算打算大的');
insert into speak value(null,'aa','2013-1-6','谁谁谁谁谁谁的三大打算打算大的');
insert into speak value(null,'aa','2012-1-6','aaaaaaaaaaaaaaaaaaaa');

insert into majordis value('1','C#调用CMD1','aa1','2012-1-2','1aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('2','C#调用CMD2','aa2','2012-1-2','2aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('3','C#调用CMD3','aa3','2012-1-2','3aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('4','C#调用CMD4','aa4','2012-1-2','4aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('5','C#调用CMD5','aa5','2012-1-2','5aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('6','C#调用CMD6','aa6','2012-1-2','6aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('7','C#调用CMD7','aa7','2012-1-2','7aaaaaaaaaaaaaaaaaaaaa');

insert into majordis value('5','C#调用CMD5','aa5','2012-1-2','5aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('6','C#调用CMD6','aa6','2012-1-2','6aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('7','C#调用CMD7','aa7','2012-1-2','7aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('8','C#调用CMD8','aa8','2012-1-2','8aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('7','C#调用CMD1','aa7','2012-1-2','7aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('8','C#调用CMD8','aa8','2012-1-2','8aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('7','C#调用CMD7','aa7','2012-1-2','7aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('8','C#调用CMD8','aa8','2012-1-2','8aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('7','C#调用CMD7','aa7','2012-1-2','7aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('8','C#调用CMD8','aa8','2012-1-2','8aaaaaaaaaaaaaaaaaaaaa');

insert into majordis value('1','江西农业大学','aa1','2012-1-2','888aaaaaaaaaaaaaaaaaaaa');


insert into major value(null,'计算机网络','软件学院','计算机网络在信息时代中的作用','aa','2012-6-12');
insert into major value(null,'大学英语','外国语学院','aaa','aa','2012-6-12');
insert into major value(null,'java','软件学院','计算机网络在信息时代中的作用','aa','2012-6-12');
insert into major value(null,'c++','软件学院','计算机网络在信息时代中的作用','aa','2012-6-12');
insert into major value(null,'c#','软件学院','计算机网络在信息时代中的作用','aa','2012-6-12');
insert into major value(null,'visio','软件学院','计算机网络在信息时代中的作用','aa','2012-6-12');
insert into major value(null,'植物保护','农学院','计算机网络在信息时代中的作用','aa','2012-6-12');

