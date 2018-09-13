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

Date: 2018-09-13 16:28:47
*/


-- ----------------------------
-- Table structure for WEB
-- ----------------------------
DROP TABLE "SCOTT"."WEB";
CREATE TABLE "SCOTT"."WEB" (
"WEB_ID" NUMBER(4) NOT NULL ,
"WEB_TYPE" VARCHAR2(255 BYTE) NULL ,
"WEB_TITLE" VARCHAR2(255 BYTE) NULL ,
"WRITE_TIME" VARCHAR2(255 BYTE) NULL ,
"WEB_PICTURE" VARCHAR2(255 BYTE) NULL ,
"WEB_CHARACTER" VARCHAR2(1000 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of WEB
-- ----------------------------
INSERT INTO "SCOTT"."WEB" VALUES ('26', '中心活动', '心理倾诉', '2018-09-03', 'images/xinli0.png', '心理倾诉严格筛选倾听师，为用户提供专业、及时、保密的付费倾诉服务，给用户带来温暖陪伴和情绪安抚，以及解决困扰的新视角和思路。目前，心理倾诉已在心理官方网站和官方APP上线，累计帮助达20万人次。');
INSERT INTO "SCOTT"."WEB" VALUES ('33', '轮播图片', null, '2018-09-10', 'images/xinli7.png', '作为一块点心，这么萌让人怎么下口？');
INSERT INTO "SCOTT"."WEB" VALUES ('23', '关于我们', '蓝色心理做什么', '2018-09-10', 'images/xinli1.PNG', '蓝色心理（公司主体：广州市人心网络科技有限公司）成立于2011年7月，是一个专业的全生态心理服务平台。

蓝色心理秉持着“世界和我爱着你”的品牌主张，通过有趣的心理内容、多维的心理诊断工具、及时的心理疏导、专业的心理学教育，和庞大的心理专家资源，为需要心理帮助的人提供在线解决方案，输出健康、科学的心理学价值。');
INSERT INTO "SCOTT"."WEB" VALUES ('24', '关于我们', '业务体系', '2018-09-05', 'images/xinli0.png', '蓝色心理现有服务包括移动端和PC端，提供：预约咨询、及时倾诉、壹心理学院、心理测评、心理FM等六大产品，目前已拥有2000万注册用户，有600多名心理专家入驻平台，与全国252家心理机构建立紧密的合作。

');
INSERT INTO "SCOTT"."WEB" VALUES ('30', '咨询师介绍', '朱志慧 (北京大学精神病与精神卫生学博士) ', '2018-09-10', 'images/xinli2.png', '爱是通向问题解决的必经道路，让我陪伴你，学会如何爱！');
INSERT INTO "SCOTT"."WEB" VALUES ('25', '中心活动', '心理咨询', '2018-09-25', 'images/xinli0.png', '心理咨询为全球用户提供高质量心理咨询服务，已覆盖14个国家，帮助全球超过6万位用户解决情绪、情感、婚姻家庭及个人成长等心理问题。为保证咨询质量，壹心理专业评审团队从全国数万名持证咨询师以及海外优质咨询师中，挑选出了600多个优质咨询师为用户进行服务，通过率不超过2%。');
INSERT INTO "SCOTT"."WEB" VALUES ('27', '中心活动', '心理测评', '2018-09-12', 'images/xinli0.png', '心理测评，国内最专业的心理测评服务平台，专注于个人心理成长、职场发展、婚恋关系、亲子关系等领域，以心理学严谨的专研态度，结合自媒体灵活的测评方式，打造面向大众，助其自主成长的平台。');
INSERT INTO "SCOTT"."WEB" VALUES ('19', '心理阅读', '舒服的人际关系，需要适当的敏感力', '2018-09-25', 'images/shuji3.jpg', '日本作家渡边淳一写的《钝感力》里认为，现代人不要对日常生活太过敏感，必要的钝感力是赢得美好生活的手段和智慧。');
INSERT INTO "SCOTT"."WEB" VALUES ('28', '中心活动', '心理FM', '2018-09-04', 'images/xinli0.png', '心理FM是一个专注心理成长、心情故事、情感陪伴的心理电台，其中精选播单、心理学专题、晚安时刻等特色功能，满足各类音频需求，陪伴用户走出心情的低谷。平台入驻超300位心理主播，深耕心理治愈内容和专业咨询师有声内容。APP累计用户400W+，在壹心理全平台累计节目播放次数超4亿，在喜马拉雅FM、网易云音乐、蜻蜓FM等大型外部平台拥有百万粉丝和数亿次的节目播放。心理FM曾被南方都市报、36氪等多家媒体报道，获2012年腾讯开放平台公益奖、2015年中国数字医疗网最具投资价值项目。');
INSERT INTO "SCOTT"."WEB" VALUES ('29', '咨询师介绍', '黎燕(一级婚姻二级心理师 中科院心理所研究生)', '2018-09-10', 'images/xinli3.png', '我愿意和你一起面对所有，相信爱具有疗愈一切的力量');
INSERT INTO "SCOTT"."WEB" VALUES ('31', '轮播图片', null, '2018-09-10', 'images/xinli5.png', '我们说这世界冷酷，然后又冷酷地对待遇见的人；

我们说这世界现实，然后又现实地去对待遇见的人；

我们说这世界让我们受伤，然后我们又肆无忌惮去伤害别人。


有没有想过，为这个世界做点什么？');
INSERT INTO "SCOTT"."WEB" VALUES ('32', '轮播图片', null, '2018-09-10', 'images/xinli6.png', '你的男友是不是来自另外的星星，你的男友是不是这个世上另外的物种。');
INSERT INTO "SCOTT"."WEB" VALUES ('34', '轮播图片', null, '2018-09-13', 'images/xinli8.png', '只要有PS高手，随时都能活在大片中');
INSERT INTO "SCOTT"."WEB" VALUES ('35', '轮播图片', null, '2018-09-10', 'images/xinli9.png', '所有的喵星人都是完美的！随便一个pose都是艺术');
INSERT INTO "SCOTT"."WEB" VALUES ('36', '心理阅读', '无处不在的羞耻感', '2016-09-11', 'images/xinli10.png', '接触美好的事物时，不会心生喜悦，相反会产生：这世界上为何有如此美好的东西，而我却如此丑陋？');
INSERT INTO "SCOTT"."WEB" VALUES ('37', '心理阅读', '在现实与理想的距离之间，是改变生命的力量', '2018-09-11', 'images/xinli11.png', '现实与理想之间总有距离，除了死扛和逃避，我们还有什么选择？');
INSERT INTO "SCOTT"."WEB" VALUES ('38', '心理阅读', '孩子问到性，父母该如何回答呢？', '2018-09-11', 'images/xinli12.png', '关于性，在中国的传统文化中，一直以来，性就是一个神秘，隐秽的代名词，正是因为这种传统观念的束缚，让人们谈性色变。很多的父母因为没有正确的性观念，不能及时正确的对孩子进行引导和适时的干预，从而使孩子们心里埋下了“性羞耻”，“性神秘”，“性焦虑”等阴影。');
INSERT INTO "SCOTT"."WEB" VALUES ('39', '心理阅读', '改变线性思维，才是认知升级第一步', '2018-09-11', 'images/xinli13.png', '“数十年的认知心理学研究表明，人脑很难理解非线性关系。我们的大脑倾向于简单的直线，也就是线性关系。”');

-- ----------------------------
-- Indexes structure for table WEB
-- ----------------------------

-- ----------------------------
-- Triggers structure for table WEB
-- ----------------------------
CREATE OR REPLACE TRIGGER "SCOTT"."GUIDE_TR4" BEFORE INSERT ON "SCOTT"."WEB" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE
BEGIN
select guide_seq.nextval into:new.WEB_ID from dual;
end;
-- ----------------------------
-- Checks structure for table WEB
-- ----------------------------
ALTER TABLE "SCOTT"."WEB" ADD CHECK ("WEB_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table WEB
-- ----------------------------
ALTER TABLE "SCOTT"."WEB" ADD PRIMARY KEY ("WEB_ID");
