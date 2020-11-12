/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : localhost:3306
 Source Schema         : mydb

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 12/11/2020 23:03:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for outcome
-- ----------------------------
DROP TABLE IF EXISTS `outcome`;
CREATE TABLE `outcome`  (
  `term` int(255) NULL DEFAULT NULL,
  `goldpoint` double(255, 8) NULL DEFAULT NULL,
  `winner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of outcome
-- ----------------------------
INSERT INTO `outcome` VALUES (1, 1.08150000, '玩家1');
INSERT INTO `outcome` VALUES (2, 19.31250000, '玩家1');
INSERT INTO `outcome` VALUES (3, 20.85750000, '玩家0');
INSERT INTO `outcome` VALUES (4, 3.16725000, '玩家1');
INSERT INTO `outcome` VALUES (5, 3.24450000, '玩家1');
INSERT INTO `outcome` VALUES (6, 2.12978250, '玩家1');
INSERT INTO `outcome` VALUES (7, 16.36155000, '玩家0');

SET FOREIGN_KEY_CHECKS = 1;
