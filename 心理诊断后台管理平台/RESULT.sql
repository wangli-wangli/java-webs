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

Date: 2018-09-13 16:27:59
*/


-- ----------------------------
-- Table structure for RESULT
-- ----------------------------
DROP TABLE "SCOTT"."RESULT";
CREATE TABLE "SCOTT"."RESULT" (
"RESULT_ID" NUMBER(4) NOT NULL ,
"PATIENT_ID" NUMBER(4) NULL ,
"PATIENT_NAME" VARCHAR2(255 BYTE) NULL ,
"QUESTION" VARCHAR2(255 BYTE) NULL ,
"WRITE_TIME" DATE DEFAULT sysdate  NOT NULL ,
"ANSWER" VARCHAR2(255 BYTE) NULL ,
"STATUS" VARCHAR2(255 BYTE) NULL ,
"QUESTION_TYPE" VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of RESULT
-- ----------------------------
INSERT INTO "SCOTT"."RESULT" VALUES ('86', null, '小明', '小时候看过童话故事，就其内容你可曾质疑过？在《卖火柴的小女孩》的童话里，你对下列哪一项最感到不解？', TO_DATE('2018-09-13 15:23:41', 'YYYY-MM-DD HH24:MI:SS'), '小女孩卖火柴', '1', '洞察力');
INSERT INTO "SCOTT"."RESULT" VALUES ('88', null, '小明', '家里要进行大扫除，你首先会丢掉哪类物品', TO_DATE('2018-09-13 15:23:41', 'YYYY-MM-DD HH24:MI:SS'), '过期的旧书杂志', '1', '理财观念');
INSERT INTO "SCOTT"."RESULT" VALUES ('93', null, '张迪', '小时候看过童话故事，就其内容你可曾质疑过？在《卖火柴的小女孩》的童话里，你对下列哪一项最感到不解？', TO_DATE('2018-09-13 16:17:47', 'YYYY-MM-DD HH24:MI:SS'), '小女孩不从父亲那里逃出来', '1', '洞察力');
INSERT INTO "SCOTT"."RESULT" VALUES ('95', null, '张迪', '家里要进行大扫除，你首先会丢掉哪类物品', TO_DATE('2018-09-13 16:17:47', 'YYYY-MM-DD HH24:MI:SS'), '体积过大的老电器', '1', '理财观念');
INSERT INTO "SCOTT"."RESULT" VALUES ('21', '16', '张杰', '你决定到远方自助旅行约一个月的时间，请问让你有这个想法的主因是什么? ', TO_DATE('2018-09-10 10:51:50', 'YYYY-MM-DD HH24:MI:SS'), '太久没有履行了', '1', '具备的才能');
INSERT INTO "SCOTT"."RESULT" VALUES ('61', null, '张迪', '真是个难得的假日清晨，你竟然五点就起床了！原来是和情人约了去晨跑！当你们在河边瞥见一位戴太阳镜、一身新潮打扮的美女站在树荫下，正好你经过她身旁，看见她打开手袋，东翻西找的，你猜她在找什么？', TO_DATE('2018-09-13 01:36:06', 'YYYY-MM-DD HH24:MI:SS'), '面纸', '1', '反应力和判断力');
INSERT INTO "SCOTT"."RESULT" VALUES ('63', null, '张迪', '有一天在路上，你遇到失去联络的旧情人，你们相约到附近的咖啡厅去坐坐，除了聊聊目前的生活之外，难免谈起以前的时光，这时候，你最怕旧情人提起什么?', TO_DATE('2018-09-13 01:36:06', 'YYYY-MM-DD HH24:MI:SS'), '当初介入你们的第三者', '1', '具备领导的才能');
INSERT INTO "SCOTT"."RESULT" VALUES ('62', null, '张迪', '小时候看过童话故事，就其内容你可曾质疑过？在《卖火柴的小女孩》的童话里，你对下列哪一项最感到不解？', TO_DATE('2018-09-13 01:36:06', 'YYYY-MM-DD HH24:MI:SS'), '小女孩不从父亲那里逃出来', '1', '洞察力');
INSERT INTO "SCOTT"."RESULT" VALUES ('64', null, '张迪', '家里要进行大扫除，你首先会丢掉哪类物品', TO_DATE('2018-09-13 01:36:07', 'YYYY-MM-DD HH24:MI:SS'), '过期的旧书杂志', '1', '理财观念');
INSERT INTO "SCOTT"."RESULT" VALUES ('65', null, '张迪', '偶然在路边捡到一千元钱，你想去买一件很需要的大衣，但是钱不够；如果去买一只不急用的运动鞋，则又多了数百元，你会怎么做？', TO_DATE('2018-09-13 01:36:07', 'YYYY-MM-DD HH24:MI:SS'), '什么都不买先存起来', '1', '创业能力');
INSERT INTO "SCOTT"."RESULT" VALUES ('68', null, '腾哥·', '小时候看过童话故事，就其内容你可曾质疑过？在《卖火柴的小女孩》的童话里，你对下列哪一项最感到不解？', TO_DATE('2018-09-13 08:32:14', 'YYYY-MM-DD HH24:MI:SS'), '没有一个人帮助那小女孩', '1', '洞察力');
INSERT INTO "SCOTT"."RESULT" VALUES ('70', null, '腾哥·', '家里要进行大扫除，你首先会丢掉哪类物品', TO_DATE('2018-09-13 08:32:15', 'YYYY-MM-DD HH24:MI:SS'), '零零碎碎的小东西', '1', '理财观念');
INSERT INTO "SCOTT"."RESULT" VALUES ('72', null, '小腾', '真是个难得的假日清晨，你竟然五点就起床了！原来是和情人约了去晨跑！当你们在河边瞥见一位戴太阳镜、一身新潮打扮的美女站在树荫下，正好你经过她身旁，看见她打开手袋，东翻西找的，你猜她在找什么？', TO_DATE('2018-09-13 08:36:54', 'YYYY-MM-DD HH24:MI:SS'), '面纸', '1', '反应力和判断力');
INSERT INTO "SCOTT"."RESULT" VALUES ('74', null, '小腾', '有一天在路上，你遇到失去联络的旧情人，你们相约到附近的咖啡厅去坐坐，除了聊聊目前的生活之外，难免谈起以前的时光，这时候，你最怕旧情人提起什么?', TO_DATE('2018-09-13 08:36:54', 'YYYY-MM-DD HH24:MI:SS'), '分手时的感觉', '1', '具备领导的才能');
INSERT INTO "SCOTT"."RESULT" VALUES ('85', null, '小明', '真是个难得的假日清晨，你竟然五点就起床了！原来是和情人约了去晨跑！当你们在河边瞥见一位戴太阳镜、一身新潮打扮的美女站在树荫下，正好你经过她身旁，看见她打开手袋，东翻西找的，你猜她在找什么？', TO_DATE('2018-09-13 15:23:40', 'YYYY-MM-DD HH24:MI:SS'), '化妆品', '1', '反应力和判断力');
INSERT INTO "SCOTT"."RESULT" VALUES ('87', null, '小明', '有一天在路上，你遇到失去联络的旧情人，你们相约到附近的咖啡厅去坐坐，除了聊聊目前的生活之外，难免谈起以前的时光，这时候，你最怕旧情人提起什么?', TO_DATE('2018-09-13 15:23:41', 'YYYY-MM-DD HH24:MI:SS'), '当初介入你们的第三者', '1', '具备领导的才能');
INSERT INTO "SCOTT"."RESULT" VALUES ('89', null, '小明', '偶然在路边捡到一千元钱，你想去买一件很需要的大衣，但是钱不够；如果去买一只不急用的运动鞋，则又多了数百元，你会怎么做？', TO_DATE('2018-09-13 15:23:41', 'YYYY-MM-DD HH24:MI:SS'), '买运动鞋再去买些其他小东西', '1', '创业能力');
INSERT INTO "SCOTT"."RESULT" VALUES ('92', null, '张迪', '真是个难得的假日清晨，你竟然五点就起床了！原来是和情人约了去晨跑！当你们在河边瞥见一位戴太阳镜、一身新潮打扮的美女站在树荫下，正好你经过她身旁，看见她打开手袋，东翻西找的，你猜她在找什么？', TO_DATE('2018-09-13 16:17:47', 'YYYY-MM-DD HH24:MI:SS'), '化妆品', '1', '反应力和判断力');
INSERT INTO "SCOTT"."RESULT" VALUES ('94', null, '张迪', '有一天在路上，你遇到失去联络的旧情人，你们相约到附近的咖啡厅去坐坐，除了聊聊目前的生活之外，难免谈起以前的时光，这时候，你最怕旧情人提起什么?', TO_DATE('2018-09-13 16:17:47', 'YYYY-MM-DD HH24:MI:SS'), '分手时的感觉', '1', '具备领导的才能');
INSERT INTO "SCOTT"."RESULT" VALUES ('96', null, '张迪', '偶然在路边捡到一千元钱，你想去买一件很需要的大衣，但是钱不够；如果去买一只不急用的运动鞋，则又多了数百元，你会怎么做？', TO_DATE('2018-09-13 16:17:47', 'YYYY-MM-DD HH24:MI:SS'), '买运动鞋再去买些其他小东西', '1', '创业能力');
INSERT INTO "SCOTT"."RESULT" VALUES ('67', null, '腾哥·', '真是个难得的假日清晨，你竟然五点就起床了！原来是和情人约了去晨跑！当你们在河边瞥见一位戴太阳镜、一身新潮打扮的美女站在树荫下，正好你经过她身旁，看见她打开手袋，东翻西找的，你猜她在找什么？', TO_DATE('2018-09-13 08:32:14', 'YYYY-MM-DD HH24:MI:SS'), '化妆品', '1', '反应力和判断力');
INSERT INTO "SCOTT"."RESULT" VALUES ('69', null, '腾哥·', '有一天在路上，你遇到失去联络的旧情人，你们相约到附近的咖啡厅去坐坐，除了聊聊目前的生活之外，难免谈起以前的时光，这时候，你最怕旧情人提起什么?', TO_DATE('2018-09-13 08:32:15', 'YYYY-MM-DD HH24:MI:SS'), '两人刚认识时的甜蜜回忆', '1', '具备领导的才能');
INSERT INTO "SCOTT"."RESULT" VALUES ('73', null, '小腾', '小时候看过童话故事，就其内容你可曾质疑过？在《卖火柴的小女孩》的童话里，你对下列哪一项最感到不解？', TO_DATE('2018-09-13 08:36:54', 'YYYY-MM-DD HH24:MI:SS'), '小女孩卖火柴', '1', '洞察力');
INSERT INTO "SCOTT"."RESULT" VALUES ('75', null, '小腾', '家里要进行大扫除，你首先会丢掉哪类物品', TO_DATE('2018-09-13 08:36:54', 'YYYY-MM-DD HH24:MI:SS'), '零零碎碎的小东西', '1', '理财观念');

-- ----------------------------
-- Indexes structure for table RESULT
-- ----------------------------

-- ----------------------------
-- Triggers structure for table RESULT
-- ----------------------------
CREATE OR REPLACE TRIGGER "SCOTT"."GUIDE_TR5" BEFORE INSERT ON "SCOTT"."RESULT" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE
BEGIN
select guide_seq.nextval into:new.RESULT_ID from dual;
end;
-- ----------------------------
-- Checks structure for table RESULT
-- ----------------------------
ALTER TABLE "SCOTT"."RESULT" ADD CHECK ("RESULT_ID" IS NOT NULL);
ALTER TABLE "SCOTT"."RESULT" ADD CHECK ("WRITE_TIME" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table RESULT
-- ----------------------------
ALTER TABLE "SCOTT"."RESULT" ADD PRIMARY KEY ("RESULT_ID");
