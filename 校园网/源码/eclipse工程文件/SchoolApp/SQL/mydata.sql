create database mydata;									
use mydata;
drop table myadmin;
drop table myuser;
drop table monthchoose;
drop table softworddesign;
drop table myblog;
drop table mydiscuss;


create table myadmin                       			-- ����Ա��
(			
	id int primary key auto_increment,				-- ����Աid
	myusername varchar(50),							-- ����Ա�û���
	mypassword varchar(50),							-- ����Ա����
	mytype varchar(50),								-- ����Ա�ȼ�								
	grade int										-- ����Ա�ȼ�
);

create table myuser									-- �û���			
(
	id int primary key auto_increment,				-- �û�id
	myusername varchar(50),							-- �û��û���
	password varchar(50),							-- �û�����
	nickname varchar(50),							-- �û��ǳ�
	place varchar(255),								-- �û�����
	sex varchar(2),									-- �û��Ա�
	insititute varchar(20),							-- �û�ѧԺ
	class int,										-- �û��༶
	moblie varchar(20),								-- �û��ֻ���
	qq varchar(20),									-- �û�qq
	major varchar(30),								-- �û�רҵ
	bedroom int										-- �û����Һ�		
);


create table matchlist								-- ������Ϣ��
(
	id int primary key auto_increment,				-- ���
	matchtype int,									-- �������	
	person1 varchar(50),							-- ��Ա1
	person2 varchar(50),							-- ��Ա2
	person3 varchar(50),							-- ��Ա3
	person4 varchar(50),							-- ��Ա4
	person5 varchar(50),							-- ��Ա5
	tel varchar(50),								-- ��ϵ��ʽ
	insititute varchar(50),							-- ѧԺ
	title varchar(50),								-- ��Ŀ
	ourwork text,									-- �ֹ����
	teacher varchar(50),							-- ָ����ʦ
	remarks text,									-- ��ע
	garde varchar(10)								-- �񽱵ȼ�	
);

create table mymatch								-- ������
(
	id int primary key auto_increment,				-- ��� 
	insititute varchar(50),							-- ѧԺ
	matchtype varchar(50),							-- ��������
	servey varchar(50)								-- ���¼��
);

insert into mymatch value(null,'���ѧԺ','���������ƴ���1','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'���ѧԺ','���������ƴ���2','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'���ѧԺ','���������ƴ���3','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'���ѧԺ','���������ƴ���4','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'���ѧԺ','���������ƴ���5','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'���ѧԺ','���������ƴ���6','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'���ѧԺ','���������ƴ���7','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'���ѧԺ','���������ƴ���8','aaaaaaaaaaaaaaaaa');
insert into mymatch value(null,'���ѧԺ','���������ƴ���9','aaaaaaaaaaaaaaaaa');



create table myblog									-- ���ı�	
(	
	id int primary key auto_increment,				-- ���±��
	title varchar(255),								-- ���±���
	myusername varchar(50),							-- �����������ο��û��������
	mydata varchar(50),								-- ����ʱ��
	insititute varchar(20),							-- ��������ѧԺ
	article text,									-- ����
	approval int,									-- �޳���
	oppse int										-- ������
);

insert into myblog value(null,'aa','aa','2012-3-6','���ѧԺ','aaaaaa','88','11');
insert into myblog value(null,'bb','aa','2012-3-6','���ѧԺ','aaaaaa','88','11');
insert into myblog value(null,'cc','aa','2012-3-6','���ѧԺ','aaaaaa','88','11');
insert into myblog value(null,'dd','aa','2012-3-6','���ѧԺ','aaaaaa','88','11');
insert into myblog value(null,'ee','aa','2012-3-6','���ѧԺ','aaaaaa','88','11');
insert into myblog value(null,'ff','aa','2012-3-6','���ѧԺ','aaaaaa','88','11');
insert into myblog value(null,'gg','aa','2012-3-6','���ѧԺ','aaaaaa','88','11');
insert into myblog value(null,'hh','aa','2012-3-6','���ѧԺ','aaaaaa','88','11');
insert into myblog value(null,'ii','aa','2012-3-6','���ѧԺ','aaaaaa','88','11');
insert into myblog value(null,'jj','aa','2012-3-6','���ѧԺ','aaaaaa','88','11');

create table mydiscuss 								-- �������۱�	
(	
	id int,											-- ���±�ţ��ο����ı��id
	nickname varchar(50),							-- �������ǳ�
	discuss text									-- ��������
);

-- ��֯ר��
create table organization							-- ��֯��
(
	id int primary key auto_increment,				-- ��֯���
	name varchar(50),                               -- ��֯����
	insititute varchar(20),							-- ����ѧԺ
	servey varchar(255),							-- ��֯���
	image varchar(50),								-- ͼƬ
	organtime varchar(50)							-- ����ʱ��
		
);

insert into organization value(null,'ѧ����','���ѧԺ','���ѧԺѧ����','aa','2012-12-23');
insert into organization value(null,'E01�����ϢЭ��','���ѧԺ','���ѧԺѧ����','aa','2012-12-23');
insert into organization value(null,'��ί','���ѧԺ','���ѧԺѧ����','aa','2012-12-23');
insert into organization value(null,'�滮��','���ѧԺ','���ѧԺѧ����','aa','2012-12-23');
insert into organization value(null,'ѧ����','ũѧԺ','���ѧԺѧ����','aa','2012-12-23');
insert into organization value(null,'��ũЭ��','ũѧԺ','���ѧԺѧ����','aa','2012-12-23');

create table myorgan								-- ��֯��Ա��			
(											
	id int primary key auto_increment,				-- �����߱��
	organ int, 										-- ��֯���
	job	varchar(50),								-- ְλ
	myname varchar(50),								-- ����������
	mysex varchar(2),								-- �Ա�
	myinsititute varchar(20),						-- ѧԺ
	myclass int,									-- �༶
	mytel varchar(50),								-- �绰
	myqq varchar(50),								-- QQ
	mybedroom int,									-- ���Һ�
	myaccount text,									-- ��������
	myappraise text,								-- ��������
	istrue int										-- �Ƿ�ͬ���Ϊ��Ա			
);

insert into myorgan value(null,'2','�᳤','aa','��','���ѧԺ','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','���粿����','aa','��','���ѧԺ','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','aa','aa','��','���ѧԺ','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','ww','aa','��','���ѧԺ','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','rr','aa','��','���ѧԺ','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','tt','aa','��','���ѧԺ','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','yy','aa','��','���ѧԺ','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','uu','aa','��','���ѧԺ','1203','111111111','121223213','3420','aaaa','aaaaa','1');
insert into myorgan value(null,'2','ii','aa','��','���ѧԺ','1203','111111111','121223213','3420','aaaa','aaaaa','1');
 
-- רҵר��
create table major
(
	id int primary key auto_increment,				-- רҵ���
	majorname varchar(255),							-- רҵ����
	insititute varchar(20),							-- ����ѧԺ			
	synopsis text,									-- רҵ���
	image varchar(50),								-- ͼƬ
	majortime varchar(20)							-- ����ʱ��
);

create table majordis								-- רҵ����
(
	id int,											-- �ο�רҵ���
	title varchar(255),								-- ����
	author varchar(50),								-- ����
	distime varchar(50),							-- ����ʱ��
	distext text									-- ��������
);

create table newstu
(
	id int primary key auto_increment,  			-- �ļ����
	filename varchar(255)							-- �ļ�����
);

create table speak									-- ˵˵��
(
	id int primary key auto_increment,  			-- ˵˵���
	speakname varchar(50),							-- ��������
	speaktime varchar(50),							-- ����ʱ��
	mytext text										-- ��������
);


create table houseinfo							   	-- �ⷿ��Ϣ��		
(
	id int primary key auto_increment,  			-- ��Ϣ���
	housename varchar(50),							-- ����������
	houseplace text,								-- ���ݵص�
	housemoney varchar(50),							-- ���
	housephone varchar(50),							-- ��ϵ�绰
	housetime varchar(50)							-- ����ʱ�� 
);

insert into houseinfo value(null,'aa','����ũ����','123','13020320320','2012-6-29');
insert into houseinfo value(null,'aa','����ũ��ǰ��','123','13020320320','2012-6-29');
insert into houseinfo value(null,'aa','�����ƴ���','123','13020320320','2012-6-29');
insert into houseinfo value(null,'aa','�ϲ���ѧ���','123','13020320320','2012-6-29');
insert into houseinfo value(null,'aa','������ͨ��ѧ���','123','13020320320','2012-6-29');
insert into houseinfo value(null,'aa','����','123','13020320320','2012-6-29');


insert into speak value(null,'aa','2012-1-6','˭˭˭˭˭˭��������������');
insert into speak value(null,'aa','2014-1-6','˭˭˭˭˭˭��������������');
insert into speak value(null,'aa','2011-1-6','˭˭˭˭˭˭��������������');
insert into speak value(null,'aa','2012-1-6','˭˭˭˭˭˭��������������');
insert into speak value(null,'aa','2013-1-6','˭˭˭˭˭˭��������������');
insert into speak value(null,'aa','2014-1-6','˭˭˭˭˭˭��������������');
insert into speak value(null,'aa','2013-1-6','˭˭˭˭˭˭��������������');
insert into speak value(null,'aa','2012-1-6','aaaaaaaaaaaaaaaaaaaa');

insert into majordis value('1','C#����CMD1','aa1','2012-1-2','1aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('2','C#����CMD2','aa2','2012-1-2','2aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('3','C#����CMD3','aa3','2012-1-2','3aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('4','C#����CMD4','aa4','2012-1-2','4aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('5','C#����CMD5','aa5','2012-1-2','5aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('6','C#����CMD6','aa6','2012-1-2','6aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('7','C#����CMD7','aa7','2012-1-2','7aaaaaaaaaaaaaaaaaaaaa');

insert into majordis value('5','C#����CMD5','aa5','2012-1-2','5aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('6','C#����CMD6','aa6','2012-1-2','6aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('7','C#����CMD7','aa7','2012-1-2','7aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('8','C#����CMD8','aa8','2012-1-2','8aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('7','C#����CMD1','aa7','2012-1-2','7aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('8','C#����CMD8','aa8','2012-1-2','8aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('7','C#����CMD7','aa7','2012-1-2','7aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('8','C#����CMD8','aa8','2012-1-2','8aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('7','C#����CMD7','aa7','2012-1-2','7aaaaaaaaaaaaaaaaaaaaa');
insert into majordis value('8','C#����CMD8','aa8','2012-1-2','8aaaaaaaaaaaaaaaaaaaaa');

insert into majordis value('1','����ũҵ��ѧ','aa1','2012-1-2','888aaaaaaaaaaaaaaaaaaaa');


insert into major value(null,'���������','���ѧԺ','�������������Ϣʱ���е�����','aa','2012-6-12');
insert into major value(null,'��ѧӢ��','�����ѧԺ','aaa','aa','2012-6-12');
insert into major value(null,'java','���ѧԺ','�������������Ϣʱ���е�����','aa','2012-6-12');
insert into major value(null,'c++','���ѧԺ','�������������Ϣʱ���е�����','aa','2012-6-12');
insert into major value(null,'c#','���ѧԺ','�������������Ϣʱ���е�����','aa','2012-6-12');
insert into major value(null,'visio','���ѧԺ','�������������Ϣʱ���е�����','aa','2012-6-12');
insert into major value(null,'ֲ�ﱣ��','ũѧԺ','�������������Ϣʱ���е�����','aa','2012-6-12');

