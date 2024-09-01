/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : user_warehouse

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 17/05/2024 20:30:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `organization` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$udsudrDnjIyJQXuXTUJnsOO2hMyjRhafm2LXcJJgW14zzcHs5XzU2', 1, 1, 'organization1');
INSERT INTO `user` VALUES (2, 'user1', '$2a$10$udsudrDnjIyJQXuXTUJnsOO2hMyjRhafm2LXcJJgW14zzcHs5XzU2', 0, 1, 'warehouse_org2');
INSERT INTO `user` VALUES (4, 'test', '$2a$10$MkdHiHYwSmErryHBHkmg6OrTm.PdrxEQeC7Zvmgy5K02kKUy.biO.', 0, 1, 'warehouse_org1');

SET FOREIGN_KEY_CHECKS = 1;
