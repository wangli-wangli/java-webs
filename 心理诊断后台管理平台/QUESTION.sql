/*
Navicat Oracle Data Transfer
Oracle Client Version : 12.2.0.1.0

Source Server         : SCOTT
Source Server Version : 110200
Source Host           : 127.0.0.1:1521
Source Schema         : SCOTT

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2018-09-13 16:27:35
*/


-- ----------------------------
-- Table structure for QUESTION
-- ----------------------------
DROP TABLE "SCOTT"."QUESTION";
CREATE TABLE "SCOTT"."QUESTION" (
"QUESTION_ID" NUMBER(4) NOT NULL ,
"QUESTION_TYPE" VARCHAR2(255 BYTE) NULL ,
"QUESTION_NAME" VARCHAR2(1000 BYTE) NULL ,
"ANSWER1" VARCHAR2(500 BYTE) NULL ,
"ANSWER2" VARCHAR2(500 BYTE) NULL ,
"ANSWER3" VARCHAR2(500 BYTE) NULL ,
"ANSWER4" VARCHAR2(500 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of QUESTION
-- ----------------------------
INSERT INTO "SCOTT"."QUESTION" VALUES ('40', '反应力和判断力', '真是个难得的假日清晨，你竟然五点就起床了！原来是和情人约了去晨跑！当你们在河边瞥见一位戴太阳镜、一身新潮打扮的美女站在树荫下，正好你经过她身旁，看见她打开手袋，东翻西找的，你猜她在找什么？', '面纸', '化妆品', '钱包', '小镜子');
INSERT INTO "SCOTT"."QUESTION" VALUES ('41', '洞察力', '小时候看过童话故事，就其内容你可曾质疑过？在《卖火柴的小女孩》的童话里，你对下列哪一项最感到不解？', '小女孩卖火柴', '小女孩不从父亲那里逃出来', '没有一个人帮助那小女孩', '没有一个人向她买一盒火柴');
INSERT INTO "SCOTT"."QUESTION" VALUES ('42', '具备领导的才能', '有一天在路上，你遇到失去联络的旧情人，你们相约到附近的咖啡厅去坐坐，除了聊聊目前的生活之外，难免谈起以前的时光，这时候，你最怕旧情人提起什么?', '两人刚认识时的甜蜜回忆', '分手时的感觉', '当初介入你们的第三者', '有一次出国旅行的经验');
INSERT INTO "SCOTT"."QUESTION" VALUES ('43', '理财观念', '家里要进行大扫除，你首先会丢掉哪类物品', '旧衣服', '体积过大的老电器', '零零碎碎的小东西', '过期的旧书杂志');
INSERT INTO "SCOTT"."QUESTION" VALUES ('76', '创业能力', '偶然在路边捡到一千元钱，你想去买一件很需要的大衣，但是钱不够；如果去买一只不急用的运动鞋，则又多了数百元，你会怎么做？', '自己添些钱把大衣买回来', '买运动鞋再去买些其他小东西', '什么都不买先存起来', '             ');

-- ----------------------------
-- Indexes structure for table QUESTION
-- ----------------------------

-- ----------------------------
-- Triggers structure for table QUESTION
-- ----------------------------
CREATE OR REPLACE TRIGGER "SCOTT"."GUIDE_TR6" BEFORE INSERT ON "SCOTT"."QUESTION" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE
BEGIN
select guide_seq.nextval into:new.QUESTION_ID from dual;
end;
-- ----------------------------
-- Checks structure for table QUESTION
-- ----------------------------
ALTER TABLE "SCOTT"."QUESTION" ADD CHECK ("QUESTION_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table QUESTION
-- ----------------------------
ALTER TABLE "SCOTT"."QUESTION" ADD PRIMARY KEY ("QUESTION_ID");
