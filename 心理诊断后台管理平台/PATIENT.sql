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

Date: 2018-09-13 16:27:05
*/


-- ----------------------------
-- Table structure for PATIENT
-- ----------------------------
DROP TABLE "SCOTT"."PATIENT";
CREATE TABLE "SCOTT"."PATIENT" (
"PATIENT_ID" NUMBER(4) NOT NULL ,
"PATIENT_SEX" VARCHAR2(255 BYTE) DEFAULT NULL  NULL ,
"PATIENT_HOME" VARCHAR2(255 BYTE) DEFAULT NULL  NULL ,
"PATIENT_BELIEVE" VARCHAR2(255 BYTE) DEFAULT NULL  NULL ,
"PATIENT_PHONE" VARCHAR2(255 BYTE) DEFAULT NULL  NULL ,
"PATIENT_BORN" VARCHAR2(255 BYTE) DEFAULT NULL  NULL ,
"PATIENT_AGE" VARCHAR2(4 BYTE) DEFAULT NULL  NULL ,
"PATIENT_NAME" VARCHAR2(255 BYTE) NULL ,
"PATIENT_EDUCATION" VARCHAR2(255 BYTE) NULL ,
"PATIENT_BORNADDRESS" VARCHAR2(255 BYTE) NULL ,
"PATIENT_ADDRESS" VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PATIENT
-- ----------------------------
INSERT INTO "SCOTT"."PATIENT" VALUES ('16', '男', '天上人间', '天主教', '12345678', 'null', '23', '张杰', '小学', 'null', 'null');
INSERT INTO "SCOTT"."PATIENT" VALUES ('90', '男', '宁夏', '佛教', '12345678', '2018-09-11', '12', '王莉', '小学', '陕西', '河北省');
INSERT INTO "SCOTT"."PATIENT" VALUES ('50', '男', '河北省', '佛教', '12345678', null, '12', '小明', '小学', '河北省', '河北省');
INSERT INTO "SCOTT"."PATIENT" VALUES ('60', '女', '河北', '佛教', '122334256', '2018-09-26', '12', '张迪', '初中', '河北省', '河北省');
INSERT INTO "SCOTT"."PATIENT" VALUES ('71', '男', '陕西', '佛教', '12345678', '2018-09-12', '12', '小腾', '小学', '陕西', '陕西');
INSERT INTO "SCOTT"."PATIENT" VALUES ('84', '男', '陕西', '佛教', '12345678', '2018-09-21', '12', '小明', '大学', '陕西', '陕西');
INSERT INTO "SCOTT"."PATIENT" VALUES ('13', '1', '1324', '1234', '3421', '12231', '134', 'ee', '1', '321', '1324');
INSERT INTO "SCOTT"."PATIENT" VALUES ('91', '女', '河北省', '佛教', '12345678', '2018-09-13', '12', '张迪', '小学', '河北省', '河北省');
INSERT INTO "SCOTT"."PATIENT" VALUES ('66', '女', '河北省', '佛教', '123456789', '2018-09-14', '12', '腾哥·', '小学', '陕西', '陕西');
INSERT INTO "SCOTT"."PATIENT" VALUES ('52', '男', '河北省', '佛教', '12345678', '2018-09-13', '12', '张迪', '小学', '河北省', '河北省');

-- ----------------------------
-- Indexes structure for table PATIENT
-- ----------------------------

-- ----------------------------
-- Triggers structure for table PATIENT
-- ----------------------------
CREATE OR REPLACE TRIGGER "SCOTT"."GUIDE_TR1" BEFORE INSERT ON "SCOTT"."PATIENT" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE
BEGIN
select guide_seq.nextval into:new.PATIENT_ID from dual;
end;
-- ----------------------------
-- Checks structure for table PATIENT
-- ----------------------------
ALTER TABLE "SCOTT"."PATIENT" ADD CHECK ("PATIENT_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table PATIENT
-- ----------------------------
ALTER TABLE "SCOTT"."PATIENT" ADD PRIMARY KEY ("PATIENT_ID");
