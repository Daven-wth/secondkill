-- 数据库初始化脚本

-- 创建数据库

CREATE database seckill;

--使用数据库

use seckill;

--创建秒杀库存表
CREATE table seckill(
  seckill_id bigint NOT NULL AUTO_INCREMENT COMMENT '库存id',
  name varchar(120) NOT NULL COMMENT '商品名称',
  number int NOT NULL COMMENT '库存数量',
  start_time timestamp NOT NULL COMMENT '秒杀开启时间',
  end_time timestamp NOT NULL COMMENT '秒杀结束时间',
  create_time datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (seckill_id),
  key idx_start_time(start_time),
  key idx_end_time(end_time),
  key idx_create_time(create_time)
)ENGINE=InnoDB AUTO_INCREMENT = 1000 DEFAULT  CHARSET=utf8 COMMENT='秒杀库存表'

--初始化数据
insert into
  seckill(name,number,start_time,end_time,create_time)
value
  ('1000元秒杀iphone11',100,'2019-09-24 00:00:00','2019-09-25 00:00:00','2019-09-24 16:33:10'),
  ('1000元秒杀iphone11 pro',200,'2019-09-24 00:00:00','2019-09-25 00:00:00','2019-09-24 16:33:10'),
  ('1000元秒杀iphone11 pro max',100,'2019-09-24 00:00:00','2019-09-25 00:00:00','2019-09-24 16:33:10'),
  ('1000元秒杀airpods',10,'2019-09-24 00:00:00','2019-09-25 00:00:00','2019-09-24 16:33:10');


--秒杀成功明细表
-- 用户登陆认证相关信息
create table success_killed(
  seckill_id bigint NOT NULL COMMENT '秒杀商品id',
  user_phone bigint NOT NULL COMMENT '用户手机号',
  state tinyint NOT NULL DEFAULT -1 COMMENT '状态标示：-1：无效 0：有效 1：已付款',
	create_time datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY(`seckill_id`,`user_phone`),/*联合主键*/
  key idex_create_time(create_time)
)ENGINE=InnoDB DEFAULT  CHARSET=utf8 COMMENT = '秒杀成功明细表';





