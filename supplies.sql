/*
 Navicat Premium Data Transfer

 Source Server         : Collection
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : supplies

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 14/09/2019 11:39:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'wuheng', '123', 23, '男', '吴恒');
INSERT INTO `admin` VALUES (2, 'admin', '123', 22, '女', '李丽');
INSERT INTO `admin` VALUES (4, 'wangwu', '123', 25, '男', '王五');
INSERT INTO `admin` VALUES (5, 'zhaoliu', '123', 21, '男', '赵六');
INSERT INTO `admin` VALUES (6, 'zhangsan', '123', 16, '男', '张三');
INSERT INTO `admin` VALUES (7, 'liqi', '123', 25, '男', '李七');
INSERT INTO `admin` VALUES (8, 'dengba', '123', 15, '男', '邓八');
INSERT INTO `admin` VALUES (9, 'sss', '123', 25, '男', 'sss');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '可口可乐公司');
INSERT INTO `product` VALUES (2, '长虹公司');
INSERT INTO `product` VALUES (3, '大众公司');
INSERT INTO `product` VALUES (4, '美的');

-- ----------------------------
-- Table structure for supplies
-- ----------------------------
DROP TABLE IF EXISTS `supplies`;
CREATE TABLE `supplies`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `snum` int(11) NULL DEFAULT NULL,
  `sprice` double NULL DEFAULT NULL,
  `sproduct` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `p_id`(`sproduct`) USING BTREE,
  CONSTRAINT `p_id` FOREIGN KEY (`sproduct`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
