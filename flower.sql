#设置客户端服务器端的连接编码
set names utf8;

#丢弃数据库如果存在
drop database if exists flower;

#创建数据库，设置连接编码为utf8
create database flower charset=utf8;

#进入数据库
use flower;


#####################################
#lijiajun

#创建数据表UserInfo
create table UserInfo(
  uid int primary key auto_increment,
  uname varchar(20) not null unique,
  upwd varchar(20) not null,
  phone varchar(11) not null
);

#插入数据
#####################################
insert into UserInfo values(null,"root","root123","13455567890");

#######################################
#wangyi

#创建数据表TypeName
create table TypeName(
  TypeId tinyint unsigned primary key auto_increment,
  Type varchar(10) not null unique
);

#插入数据
insert into TypeName values(null,"康乃馨");
insert into TypeName values(null,"玫瑰");
insert into TypeName values(null,"百合");
######################################