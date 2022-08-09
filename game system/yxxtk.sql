/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : yxxtk

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 12/07/2022 15:58:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件md5',
  `contentType` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` int NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物理路径',
  `url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_info
-- ----------------------------
INSERT INTO `file_info` VALUES ('09bee9c6c182a7d7a4569ca6cc91f307', 'image/png', 51775, 'd:/files/2019/09/21/09bee9c6c182a7d7a4569ca6cc91f307.png', '/2019/09/21/09bee9c6c182a7d7a4569ca6cc91f307.png', 1, '2019-09-21 00:44:20', '2019-09-21 00:44:20');
INSERT INTO `file_info` VALUES ('13ce54fea2802612003ac674357ebea0', 'application/octet-stream', 561667, 'd:/files/2020/02/29/13ce54fea2802612003ac674357ebea0.docx', '/2020/02/29/13ce54fea2802612003ac674357ebea0.docx', 0, '2020-02-29 18:42:01', '2020-02-29 18:42:01');

-- ----------------------------
-- Table structure for sys_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_logs`;
CREATE TABLE `sys_logs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名',
  `flag` tinyint NOT NULL DEFAULT 1 COMMENT '成功失败',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `createTime`(`createTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1328 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logs
-- ----------------------------

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int NOT NULL,
  `name` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `css` varchar(30) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `href` varchar(1000) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `permission` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `sort` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 0, '用户管理', 'fa-users', '', 1, '', 9);
INSERT INTO `sys_permission` VALUES (2, 1, '用户查询', 'fa-user', 'pages/user/userList.html', 1, '', 2);
INSERT INTO `sys_permission` VALUES (3, 2, '查询', '', '', 2, 'sys:user:query', 100);
INSERT INTO `sys_permission` VALUES (4, 2, '新增', '', '', 2, 'sys:user:add', 100);
INSERT INTO `sys_permission` VALUES (6, 0, '修改密码', 'fa-pencil-square-o', 'pages/user/changePassword.html', 1, 'sys:user:password', 111);
INSERT INTO `sys_permission` VALUES (21, 0, '游戏记录表', 'fa-wrench', 'pages/yxxt/yxjlbList.html', 1, '', 105);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'ADMIN', '', '2017-05-01 13:25:39', '2020-03-29 23:08:19');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `roleId` int NOT NULL,
  `permissionId` int NOT NULL,
  PRIMARY KEY (`roleId`, `permissionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 1);
INSERT INTO `sys_role_permission` VALUES (1, 2);
INSERT INTO `sys_role_permission` VALUES (1, 3);
INSERT INTO `sys_role_permission` VALUES (1, 4);
INSERT INTO `sys_role_permission` VALUES (1, 6);
INSERT INTO `sys_role_permission` VALUES (1, 7);
INSERT INTO `sys_role_permission` VALUES (1, 8);
INSERT INTO `sys_role_permission` VALUES (1, 9);
INSERT INTO `sys_role_permission` VALUES (1, 10);
INSERT INTO `sys_role_permission` VALUES (1, 11);
INSERT INTO `sys_role_permission` VALUES (1, 12);
INSERT INTO `sys_role_permission` VALUES (1, 13);
INSERT INTO `sys_role_permission` VALUES (1, 14);
INSERT INTO `sys_role_permission` VALUES (1, 15);
INSERT INTO `sys_role_permission` VALUES (1, 21);
INSERT INTO `sys_role_permission` VALUES (1, 26);
INSERT INTO `sys_role_permission` VALUES (1, 37);
INSERT INTO `sys_role_permission` VALUES (1, 38);
INSERT INTO `sys_role_permission` VALUES (1, 39);
INSERT INTO `sys_role_permission` VALUES (1, 40);
INSERT INTO `sys_role_permission` VALUES (4, 25);
INSERT INTO `sys_role_permission` VALUES (4, 26);
INSERT INTO `sys_role_permission` VALUES (4, 28);
INSERT INTO `sys_role_permission` VALUES (4, 29);
INSERT INTO `sys_role_permission` VALUES (4, 35);
INSERT INTO `sys_role_permission` VALUES (4, 36);
INSERT INTO `sys_role_permission` VALUES (4, 38);
INSERT INTO `sys_role_permission` VALUES (4, 39);
INSERT INTO `sys_role_permission` VALUES (4, 40);
INSERT INTO `sys_role_permission` VALUES (4, 42);
INSERT INTO `sys_role_permission` VALUES (4, 43);
INSERT INTO `sys_role_permission` VALUES (4, 44);
INSERT INTO `sys_role_permission` VALUES (5, 42);
INSERT INTO `sys_role_permission` VALUES (6, 42);
INSERT INTO `sys_role_permission` VALUES (6, 43);
INSERT INTO `sys_role_permission` VALUES (6, 44);
INSERT INTO `sys_role_permission` VALUES (7, 6);
INSERT INTO `sys_role_permission` VALUES (7, 23);
INSERT INTO `sys_role_permission` VALUES (7, 42);
INSERT INTO `sys_role_permission` VALUES (7, 43);
INSERT INTO `sys_role_permission` VALUES (7, 44);
INSERT INTO `sys_role_permission` VALUES (8, 1);
INSERT INTO `sys_role_permission` VALUES (8, 6);
INSERT INTO `sys_role_permission` VALUES (8, 38);
INSERT INTO `sys_role_permission` VALUES (8, 47);
INSERT INTO `sys_role_permission` VALUES (8, 49);
INSERT INTO `sys_role_permission` VALUES (8, 50);
INSERT INTO `sys_role_permission` VALUES (8, 51);
INSERT INTO `sys_role_permission` VALUES (8, 52);
INSERT INTO `sys_role_permission` VALUES (8, 53);
INSERT INTO `sys_role_permission` VALUES (8, 54);
INSERT INTO `sys_role_permission` VALUES (8, 55);
INSERT INTO `sys_role_permission` VALUES (8, 56);
INSERT INTO `sys_role_permission` VALUES (8, 57);
INSERT INTO `sys_role_permission` VALUES (8, 58);
INSERT INTO `sys_role_permission` VALUES (8, 59);
INSERT INTO `sys_role_permission` VALUES (8, 61);
INSERT INTO `sys_role_permission` VALUES (9, 6);
INSERT INTO `sys_role_permission` VALUES (9, 42);
INSERT INTO `sys_role_permission` VALUES (9, 43);
INSERT INTO `sys_role_permission` VALUES (9, 47);
INSERT INTO `sys_role_permission` VALUES (9, 49);
INSERT INTO `sys_role_permission` VALUES (9, 50);
INSERT INTO `sys_role_permission` VALUES (9, 51);
INSERT INTO `sys_role_permission` VALUES (9, 52);
INSERT INTO `sys_role_permission` VALUES (9, 53);
INSERT INTO `sys_role_permission` VALUES (9, 54);
INSERT INTO `sys_role_permission` VALUES (9, 55);
INSERT INTO `sys_role_permission` VALUES (9, 58);
INSERT INTO `sys_role_permission` VALUES (9, 61);
INSERT INTO `sys_role_permission` VALUES (10, 6);
INSERT INTO `sys_role_permission` VALUES (10, 49);
INSERT INTO `sys_role_permission` VALUES (10, 50);
INSERT INTO `sys_role_permission` VALUES (10, 51);
INSERT INTO `sys_role_permission` VALUES (10, 52);
INSERT INTO `sys_role_permission` VALUES (10, 53);
INSERT INTO `sys_role_permission` VALUES (10, 54);
INSERT INTO `sys_role_permission` VALUES (10, 55);
INSERT INTO `sys_role_permission` VALUES (10, 56);
INSERT INTO `sys_role_permission` VALUES (10, 58);
INSERT INTO `sys_role_permission` VALUES (10, 59);
INSERT INTO `sys_role_permission` VALUES (10, 61);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `userId` int NOT NULL,
  `roleId` int NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (1, 1);
INSERT INTO `sys_role_user` VALUES (1, 4);
INSERT INTO `sys_role_user` VALUES (2, 2);
INSERT INTO `sys_role_user` VALUES (3, 5);
INSERT INTO `sys_role_user` VALUES (4, 4);
INSERT INTO `sys_role_user` VALUES (5, 4);
INSERT INTO `sys_role_user` VALUES (6, 4);
INSERT INTO `sys_role_user` VALUES (11, 1);
INSERT INTO `sys_role_user` VALUES (11, 2);
INSERT INTO `sys_role_user` VALUES (12, 1);
INSERT INTO `sys_role_user` VALUES (12, 2);
INSERT INTO `sys_role_user` VALUES (13, 1);
INSERT INTO `sys_role_user` VALUES (13, 2);
INSERT INTO `sys_role_user` VALUES (14, 2);
INSERT INTO `sys_role_user` VALUES (15, 1);
INSERT INTO `sys_role_user` VALUES (15, 2);
INSERT INTO `sys_role_user` VALUES (16, 1);
INSERT INTO `sys_role_user` VALUES (16, 2);
INSERT INTO `sys_role_user` VALUES (19, 7);
INSERT INTO `sys_role_user` VALUES (20, 7);
INSERT INTO `sys_role_user` VALUES (21, 3);
INSERT INTO `sys_role_user` VALUES (22, 7);
INSERT INTO `sys_role_user` VALUES (23, 2);
INSERT INTO `sys_role_user` VALUES (24, 7);
INSERT INTO `sys_role_user` VALUES (25, 2);
INSERT INTO `sys_role_user` VALUES (25, 3);
INSERT INTO `sys_role_user` VALUES (25, 6);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `password` varchar(60) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `headImgUrl` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `telephone` varchar(30) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `sex` tinyint(1) NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `xjbm` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `cjbm` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$ZtK5uQ3rEEK5ZSnp9JVSgOEuZeePtowHzOrf8T15xf6uEukObzwV6', '管理员', '/2019/09/25/f0f967622a0215b638f9dd953bc9bf22.png', '123', '123', '123', '1998-06-28', 0, 1, '2017-04-10 15:21:38', '2019-11-14 10:36:09', '1', NULL);
INSERT INTO `sys_user` VALUES (26, 'jiazhang', '$2a$10$NTjP1TgI/UvEqS9/T3SF1uUjMvHhwO2.S/G7qcbcJiGPAYKJg2MlK', '家长1', NULL, '', '', '', NULL, 0, 1, '2020-02-29 23:15:19', '2020-02-29 23:15:19', '2', NULL);

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(16) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `k` varchar(16) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `val` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `createTime` datetime NULL DEFAULT NULL,
  `updateTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`, `k`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES (1, 'sex', '0', '女', '2017-11-17 09:58:24', '2017-11-18 14:21:05');
INSERT INTO `t_dict` VALUES (2, 'sex', '1', '男', '2017-11-17 09:58:24', '2017-11-18 14:21:05');
INSERT INTO `t_dict` VALUES (3, 'userStatus', '0', '无效', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (4, 'userStatus', '1', '正常', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (5, 'userStatus', '2', '锁定', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (6, 'noticeStatus', '0', '草稿', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (7, 'noticeStatus', '1', '发布', '2017-11-17 16:26:06', '2017-11-17 16:26:09');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cron` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `springBeanName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'springBean名',
  `methodName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `isSysJob` tinyint(1) NOT NULL COMMENT '是否是系统job',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `jobName`(`jobName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_job
-- ----------------------------

-- ----------------------------
-- Table structure for t_mail
-- ----------------------------
DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE `t_mail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL COMMENT '发送人',
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '正文',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mail
-- ----------------------------
INSERT INTO `t_mail` VALUES (1, 1, '工作总结', '123', '2019-10-29 10:22:51', '2019-10-29 10:22:51');
INSERT INTO `t_mail` VALUES (2, 1, '12345', '12345', '2020-02-11 13:35:00', '2020-02-11 13:35:00');

-- ----------------------------
-- Table structure for t_mail_to
-- ----------------------------
DROP TABLE IF EXISTS `t_mail_to`;
CREATE TABLE `t_mail_to`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mailId` int NOT NULL,
  `toUser` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1成功，0失败',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mail_to
-- ----------------------------
INSERT INTO `t_mail_to` VALUES (1, 1, 'yanshi', 0);
INSERT INTO `t_mail_to` VALUES (2, 2, '563412018@qq.com', 0);

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_notice
-- ----------------------------

-- ----------------------------
-- Table structure for t_notice_read
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_read`;
CREATE TABLE `t_notice_read`  (
  `noticeId` int NOT NULL,
  `userId` int NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`noticeId`, `userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_notice_read
-- ----------------------------

-- ----------------------------
-- Table structure for t_token
-- ----------------------------
DROP TABLE IF EXISTS `t_token`;
CREATE TABLE `t_token`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token',
  `val` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'LoginUser的json串',
  `expireTime` datetime NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_token
-- ----------------------------

-- ----------------------------
-- Table structure for yxjlb
-- ----------------------------
DROP TABLE IF EXISTS `yxjlb`;
CREATE TABLE `yxjlb`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `yxrm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `yxrxb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `yxrnl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `swyx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sfzq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `yxsj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yxjlb
-- ----------------------------
INSERT INTO `yxjlb` VALUES (1, 'lll', '男', '12', '1', '对', NULL);
INSERT INTO `yxjlb` VALUES (2, 'lll', '男', '12', '2', '错', NULL);
INSERT INTO `yxjlb` VALUES (3, 'lll', '男', '12', '3', '对', NULL);
INSERT INTO `yxjlb` VALUES (4, 'lll', '男', '12', '4', '对', '20');
INSERT INTO `yxjlb` VALUES (5, 'lll', '男', '12', '5', '对', '30');
INSERT INTO `yxjlb` VALUES (6, 'lll', '男', '12', '6', '对', '40');
INSERT INTO `yxjlb` VALUES (7, 'www', '女', '15', '1', '对', NULL);
INSERT INTO `yxjlb` VALUES (8, 'www', '女', '15', '2', '对', NULL);
INSERT INTO `yxjlb` VALUES (9, 'www', '女', '15', '3', '对', NULL);
INSERT INTO `yxjlb` VALUES (10, 'www', '女', '15', '4', '错', '10');
INSERT INTO `yxjlb` VALUES (11, 'www', '女', '15', '5', '对', '20');
INSERT INTO `yxjlb` VALUES (12, 'www', '女', '15', '6', '错', '30');
INSERT INTO `yxjlb` VALUES (13, 'nnn', '女', '16', '1', '错', NULL);
INSERT INTO `yxjlb` VALUES (14, 'nnn', '女', '16', '2', '错', NULL);
INSERT INTO `yxjlb` VALUES (15, 'nnn', '女', '16', '3', '错', NULL);
INSERT INTO `yxjlb` VALUES (16, 'nnn', '女', '16', '4', '错', '20');
INSERT INTO `yxjlb` VALUES (17, 'nnn', '女', '16', '5', '对', '30');
INSERT INTO `yxjlb` VALUES (37, 'ding', '女', '26', '1', '错', NULL);
INSERT INTO `yxjlb` VALUES (38, 'ding', '女', '26', '2', '对', NULL);
INSERT INTO `yxjlb` VALUES (39, 'ding', '女', '26', '5', '错', '10');
INSERT INTO `yxjlb` VALUES (40, 'ding', '女', '26', '6', '错', '30');
INSERT INTO `yxjlb` VALUES (41, 'ding', '女', '26', '4', '错', '20');
INSERT INTO `yxjlb` VALUES (42, 'ding', '女', '26', '3', '错', NULL);
INSERT INTO `yxjlb` VALUES (43, 'cwshi', '男', '22', '2', '错', NULL);
INSERT INTO `yxjlb` VALUES (44, 'cwshi', '男', '22', '3', '错', NULL);
INSERT INTO `yxjlb` VALUES (45, 'cwshi', '男', '22', '1', '错', NULL);
INSERT INTO `yxjlb` VALUES (46, 'cwshi', '男', '22', '5', '错', '30');
INSERT INTO `yxjlb` VALUES (47, 'cwshi', '男', '22', '4', '错', '20');
INSERT INTO `yxjlb` VALUES (48, 'cwshi', '男', '22', '6', '错', '40');
INSERT INTO `yxjlb` VALUES (92, '张三', '男', '22', '4', '对', '21');
INSERT INTO `yxjlb` VALUES (93, '张三', '男', '22', '3', '错', NULL);
INSERT INTO `yxjlb` VALUES (94, '张三', '男', '22', '5', '对', '8');
INSERT INTO `yxjlb` VALUES (95, '张三', '男', '22', '6', '对', '6');
INSERT INTO `yxjlb` VALUES (96, '张三', '男', '22', '2', '对', NULL);
INSERT INTO `yxjlb` VALUES (97, '张三', '男', '22', '1', '对', NULL);
INSERT INTO `yxjlb` VALUES (98, '张三', '男', '22', '2', '对', NULL);
INSERT INTO `yxjlb` VALUES (99, '张三', '男', '22', '5', '对', '13');
INSERT INTO `yxjlb` VALUES (100, '张三', '男', '22', '3', '错', NULL);
INSERT INTO `yxjlb` VALUES (101, '张三', '男', '22', '4', '对', '12');
INSERT INTO `yxjlb` VALUES (102, '张三', '男', '22', '1', '对', NULL);
INSERT INTO `yxjlb` VALUES (103, '张三', '男', '22', '6', '错', '5');
INSERT INTO `yxjlb` VALUES (104, '张三', '男', '22', '4', '对', '18');
INSERT INTO `yxjlb` VALUES (105, '张三', '男', '22', '2', '对', NULL);
INSERT INTO `yxjlb` VALUES (106, '张三', '男', '22', '5', '对', '13');
INSERT INTO `yxjlb` VALUES (107, '张三', '男', '22', '6', '对', '5');
INSERT INTO `yxjlb` VALUES (108, '张三', '男', '22', '1', '对', NULL);
INSERT INTO `yxjlb` VALUES (109, '张三', '男', '22', '3', '错', NULL);
INSERT INTO `yxjlb` VALUES (110, '张三', '男', '22', '4', '错', '6');
INSERT INTO `yxjlb` VALUES (111, '张三', '男', '22', '5', '错', '2');
INSERT INTO `yxjlb` VALUES (112, '张三', '男', '22', '2', '对', NULL);
INSERT INTO `yxjlb` VALUES (113, '张三', '男', '22', '1', '对', NULL);
INSERT INTO `yxjlb` VALUES (114, '张三', '男', '22', '6', '错', '5');
INSERT INTO `yxjlb` VALUES (115, '张三', '男', '22', '3', '对', NULL);
INSERT INTO `yxjlb` VALUES (116, '李四', '男', '33', '6', '错', '5');
INSERT INTO `yxjlb` VALUES (117, '李四', '男', '33', '3', '对', NULL);
INSERT INTO `yxjlb` VALUES (118, '李四', '男', '33', '4', '错', '7');
INSERT INTO `yxjlb` VALUES (119, '李四', '男', '33', '2', '对', NULL);
INSERT INTO `yxjlb` VALUES (120, '李四', '男', '33', '1', '对', NULL);
INSERT INTO `yxjlb` VALUES (121, '李四', '男', '33', '5', '错', '11');
INSERT INTO `yxjlb` VALUES (122, 'zhao', '女', '18', '6', '错', '5');
INSERT INTO `yxjlb` VALUES (123, 'zhao', '女', '18', '4', '错', '7');
INSERT INTO `yxjlb` VALUES (124, 'zhao', '女', '18', '1', '对', NULL);
INSERT INTO `yxjlb` VALUES (125, 'zhao', '女', '18', '3', '对', NULL);
INSERT INTO `yxjlb` VALUES (126, 'zhao', '女', '18', '2', '错', NULL);
INSERT INTO `yxjlb` VALUES (127, 'zhao', '女', '18', '5', '错', '10');

SET FOREIGN_KEY_CHECKS = 1;
