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

Date: 2018-09-13 16:28:26
*/


-- ----------------------------
-- Table structure for T_USER
-- ----------------------------
DROP TABLE "SCOTT"."T_USER";
CREATE TABLE "SCOTT"."T_USER" (
"USER_ID" NUMBER(4) NOT NULL ,
"USER_NAME" VARCHAR2(255 BYTE) NULL ,
"USER_TYPE" VARCHAR2(255 BYTE) NULL ,
"SEX" VARCHAR2(255 BYTE) NULL ,
"WRITE_TIME" DATE DEFAULT sysdate  NOT NULL ,
"STATUS" NUMBER(1) NULL ,
"PASSWORD" VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_USER
-- ----------------------------
INSERT INTO "SCOTT"."T_USER" VALUES ('57', 'wangli', '超级管理员', '女', TO_DATE('2018-09-11 00:33:23', 'YYYY-MM-DD HH24:MI:SS'), '1', '123');
INSERT INTO "SCOTT"."T_USER" VALUES ('82', 'xiaosi', '超级管理员', '男', TO_DATE('2018-09-13 15:17:25', 'YYYY-MM-DD HH24:MI:SS'), '1', '123456');
INSERT INTO "SCOTT"."T_USER" VALUES ('79', 'xiaoyi', '管理员', '男', TO_DATE('2018-09-13 10:27:31', 'YYYY-MM-DD HH24:MI:SS'), '1', '123456');
INSERT INTO "SCOTT"."T_USER" VALUES ('81', 'xiaosan', '管理员', '男', TO_DATE('2018-09-13 10:28:34', 'YYYY-MM-DD HH24:MI:SS'), '1', '123456');
INSERT INTO "SCOTT"."T_USER" VALUES ('2', '123', '管理员', '男', TO_DATE('2018-09-11 15:22:40', 'YYYY-MM-DD HH24:MI:SS'), '1', '1234');
INSERT INTO "SCOTT"."T_USER" VALUES ('83', 'xiaowu', '超级管理员', '男', TO_DATE('2018-09-13 15:17:51', 'YYYY-MM-DD HH24:MI:SS'), '1', '12345');
INSERT INTO "SCOTT"."T_USER" VALUES ('78', 'xiaoyao', '管理员', '女', TO_DATE('2018-09-13 09:53:57', 'YYYY-MM-DD HH24:MI:SS'), '1', '123456');
INSERT INTO "SCOTT"."T_USER" VALUES ('80', 'xiaoer', '管理员', '男', TO_DATE('2018-09-13 10:28:07', 'YYYY-MM-DD HH24:MI:SS'), '1', '123456');

-- ----------------------------
-- Indexes structure for table T_USER
-- ----------------------------

-- ----------------------------
-- Triggers structure for table T_USER
-- ----------------------------
CREATE OR REPLACE TRIGGER "SCOTT"."GUIDE_TR3" BEFORE INSERT ON "SCOTT"."T_USER" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE
BEGIN
select guide_seq.nextval into:new.USER_ID from dual;
end;
-- ----------------------------
-- Checks structure for table T_USER
-- ----------------------------
ALTER TABLE "SCOTT"."T_USER" ADD CHECK ("USER_ID" IS NOT NULL);
ALTER TABLE "SCOTT"."T_USER" ADD CHECK ("WRITE_TIME" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_USER
-- ----------------------------
ALTER TABLE "SCOTT"."T_USER" ADD PRIMARY KEY ("USER_ID");
