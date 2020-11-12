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

 Date: 12/11/2020 23:02:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game`  (
  `term` int(255) NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` double(255, 8) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES (1, '玩家0', 3.00000000);
INSERT INTO `game` VALUES (1, '玩家1', 4.00000000);
INSERT INTO `game` VALUES (2, '玩家0', 66.00000000);
INSERT INTO `game` VALUES (2, '玩家1', 59.00000000);
INSERT INTO `game` VALUES (3, '玩家0', 56.00000000);
INSERT INTO `game` VALUES (3, '玩家1', 79.00000000);
INSERT INTO `game` VALUES (4, '玩家0', 17.00000000);
INSERT INTO `game` VALUES (4, '玩家1', 3.50000000);
INSERT INTO `game` VALUES (5, '玩家0', 12.00000000);
INSERT INTO `game` VALUES (5, '玩家1', 9.00000000);
INSERT INTO `game` VALUES (6, '玩家0', 9.99900000);
INSERT INTO `game` VALUES (6, '玩家1', 3.78600000);
INSERT INTO `game` VALUES (7, '玩家0', 6.00000000);
INSERT INTO `game` VALUES (7, '玩家1', 99.90000000);

SET FOREIGN_KEY_CHECKS = 1;
