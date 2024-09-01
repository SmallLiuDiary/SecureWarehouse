/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : warehouse_org1_test

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 17/05/2024 20:31:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for data
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data`  (
  `da` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data
-- ----------------------------
INSERT INTO `data` VALUES ('VqqP2iaRERrmfpwu6X74dxJIh2JZCKQKF7JoyCn0yKI=', 'oNqLqAfvFfBbPjYIvJ4F1f8K+D7tuRZ5A+8PnpJAiY8=');
INSERT INTO `data` VALUES ('2uElhDY7TFLGQpe4nb4siD5OsKiwvVbfoNizjaRw6Kc=', 'yblYBMlM5ad/Ymf3r9LgHjuY0yOESIK5V9k/y7gk0CI=');
INSERT INTO `data` VALUES ('PYJLM0fDQpJS+d30qCU2oA==', 'akOdhaCXGiC+yqcELYunEjGIRS/CJ+3SgHbSzc/FyW8=');
INSERT INTO `data` VALUES ('akOdhaCXGiC+yqcELYunEjGIRS/CJ+3SgHbSzc/FyW8=', 'akOdhaCXGiC+yqcELYunEjGIRS/CJ+3SgHbSzc/FyW8=');
INSERT INTO `data` VALUES ('akOdhaCXGiC+yqcELYunEjGIRS/CJ+3SgHbSzc/FyW8=', 'akOdhaCXGiC+yqcELYunEjGIRS/CJ+3SgHbSzc/FyW8=');
INSERT INTO `data` VALUES ('PYJLM0fDQpJS+d30qCU2oA==', 'PYJLM0fDQpJS+d30qCU2oA==');
INSERT INTO `data` VALUES ('ZrodrysN18yckir8+cSSbg==', 'ePvcfDLf+/nEi2gS+vtKUw==');

-- ----------------------------
-- Table structure for test1
-- ----------------------------
DROP TABLE IF EXISTS `test1`;
CREATE TABLE `test1`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test1
-- ----------------------------
INSERT INTO `test1` VALUES ('3vxRG5fDu00qZNZZwl1j8R7IMl49j2jNjwYOMnyw4Wk=', '9g2DJHwQH/Eus12tIVBloVTbY6xRZmRIQHG6aMC3NO4=');
INSERT INTO `test1` VALUES ('ZrodrysN18yckir8+cSSbg==', '1SL0aHVlxqCD6mhJB9v+tQ==');

SET FOREIGN_KEY_CHECKS = 1;
