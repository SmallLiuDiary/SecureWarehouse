/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : history_warehouse

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 17/05/2024 20:30:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for backup_history
-- ----------------------------
DROP TABLE IF EXISTS `backup_history`;
CREATE TABLE `backup_history`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `warehouse_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `backup_type` enum('full','incremental') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `backup_time` datetime(0) NULL DEFAULT NULL,
  `status` enum('success','failure') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of backup_history
-- ----------------------------
INSERT INTO `backup_history` VALUES (1, 'warehouse_test', 'full', '2024-05-15 19:32:23', 'success');
INSERT INTO `backup_history` VALUES (2, 'warehouse_test', 'full', '2024-05-15 20:30:06', 'success');
INSERT INTO `backup_history` VALUES (3, 'warehouse_test', 'full', '2024-05-15 20:47:36', 'success');
INSERT INTO `backup_history` VALUES (4, 'warehouse_test', 'incremental', '2024-05-15 20:48:57', 'success');
INSERT INTO `backup_history` VALUES (5, 'warehouse_test', 'full', '2024-05-15 20:52:19', 'success');
INSERT INTO `backup_history` VALUES (6, 'warehouse_test', 'full', '2024-05-16 10:57:40', 'success');
INSERT INTO `backup_history` VALUES (7, 'warehouse_test', 'full', '2024-05-16 11:03:35', 'success');
INSERT INTO `backup_history` VALUES (8, 'warehouse_test', 'incremental', '2024-05-16 11:03:53', 'success');
INSERT INTO `backup_history` VALUES (9, 'warehouse_test2', 'full', '2024-05-16 11:04:17', 'success');
INSERT INTO `backup_history` VALUES (10, 'warehouse_test2', 'incremental', '2024-05-16 11:04:30', 'success');
INSERT INTO `backup_history` VALUES (11, 'warehouse_test2', 'incremental', '2024-05-16 11:05:56', 'success');
INSERT INTO `backup_history` VALUES (12, 'warehouse_test', 'incremental', '2024-05-16 11:07:58', 'success');
INSERT INTO `backup_history` VALUES (13, 'warehouse_test', 'full', '2024-05-16 11:11:24', 'success');
INSERT INTO `backup_history` VALUES (14, 'warehouse_test', 'incremental', '2024-05-16 11:11:37', 'success');
INSERT INTO `backup_history` VALUES (15, 'warehouse_test', 'incremental', '2024-05-16 11:11:44', 'success');
INSERT INTO `backup_history` VALUES (16, 'warehouse_test', 'incremental', '2024-05-16 11:11:49', 'success');
INSERT INTO `backup_history` VALUES (17, 'warehouse_test2', 'full', '2024-05-16 11:11:54', 'success');
INSERT INTO `backup_history` VALUES (18, 'warehouse_test2', 'incremental', '2024-05-16 11:11:57', 'success');
INSERT INTO `backup_history` VALUES (19, 'warehouse_test', 'incremental', '2024-05-16 11:27:20', 'success');
INSERT INTO `backup_history` VALUES (20, 'warehouse_test', 'incremental', '2024-05-16 11:28:31', 'success');
INSERT INTO `backup_history` VALUES (21, 'warehouse_test', 'incremental', '2024-05-16 11:35:06', 'success');
INSERT INTO `backup_history` VALUES (22, 'warehouse_test2', 'incremental', '2024-05-16 11:35:13', 'success');
INSERT INTO `backup_history` VALUES (23, 'warehouse_test2', 'full', '2024-05-16 11:40:08', 'success');
INSERT INTO `backup_history` VALUES (24, 'warehouse_test', 'full', '2024-05-16 11:46:37', 'success');
INSERT INTO `backup_history` VALUES (25, 'warehouse_test', 'incremental', '2024-05-16 11:46:54', 'success');
INSERT INTO `backup_history` VALUES (26, 'warehouse_test', 'incremental', '2024-05-16 11:46:59', 'success');
INSERT INTO `backup_history` VALUES (27, 'warehouse_test2', 'incremental', '2024-05-16 11:47:09', 'success');
INSERT INTO `backup_history` VALUES (28, 'warehouse_test', 'full', '2024-05-16 11:58:55', 'success');
INSERT INTO `backup_history` VALUES (29, 'warehouse_test', 'full', '2024-05-16 12:05:43', 'success');
INSERT INTO `backup_history` VALUES (30, 'warehouse_test', 'full', '2024-05-16 12:06:15', 'success');
INSERT INTO `backup_history` VALUES (31, 'warehouse_test', 'full', '2024-05-16 12:36:32', 'success');
INSERT INTO `backup_history` VALUES (32, 'warehouse_org1_test2', 'full', '2024-05-16 20:30:33', 'success');
INSERT INTO `backup_history` VALUES (33, 'warehouse_org1_test2', 'incremental', '2024-05-16 20:30:35', 'success');
INSERT INTO `backup_history` VALUES (34, 'warehouse_org1_test', 'full', '2024-05-16 20:30:43', 'success');
INSERT INTO `backup_history` VALUES (35, 'warehouse_org1_test', 'incremental', '2024-05-16 20:30:45', 'success');

-- ----------------------------
-- Table structure for binlog_backup_info
-- ----------------------------
DROP TABLE IF EXISTS `binlog_backup_info`;
CREATE TABLE `binlog_backup_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `binlog_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `backup_time` datetime(0) NOT NULL,
  `database_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of binlog_backup_info
-- ----------------------------
INSERT INTO `binlog_backup_info` VALUES (1, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:03:35', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (2, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:03:53', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (3, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:04:17', 'warehouse_test2');
INSERT INTO `binlog_backup_info` VALUES (4, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:04:30', 'warehouse_test2');
INSERT INTO `binlog_backup_info` VALUES (5, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:05:56', 'warehouse_test2');
INSERT INTO `binlog_backup_info` VALUES (6, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:07:58', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (7, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:11:24', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (8, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:11:37', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (9, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:11:44', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (10, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:11:49', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (11, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:11:54', 'warehouse_test2');
INSERT INTO `binlog_backup_info` VALUES (12, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:11:57', 'warehouse_test2');
INSERT INTO `binlog_backup_info` VALUES (13, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:27:20', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (14, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:28:31', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (15, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:35:06', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (16, 'LAPTOP-UGAUD3D1-bin.000210', '2024-05-16 11:35:13', 'warehouse_test2');
INSERT INTO `binlog_backup_info` VALUES (17, 'LAPTOP-UGAUD3D1-bin.000211', '2024-05-16 11:40:08', 'warehouse_test2');
INSERT INTO `binlog_backup_info` VALUES (18, 'LAPTOP-UGAUD3D1-bin.000211', '2024-05-16 11:46:37', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (19, 'LAPTOP-UGAUD3D1-bin.000211', '2024-05-16 11:46:54', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (20, 'LAPTOP-UGAUD3D1-bin.000211', '2024-05-16 11:46:59', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (21, 'LAPTOP-UGAUD3D1-bin.000211', '2024-05-16 11:47:09', 'warehouse_test2');
INSERT INTO `binlog_backup_info` VALUES (22, 'LAPTOP-UGAUD3D1-bin.000211', '2024-05-16 11:58:55', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (23, 'LAPTOP-UGAUD3D1-bin.000211', '2024-05-16 12:05:43', 'warehouse_test');
INSERT INTO `binlog_backup_info` VALUES (24, 'LAPTOP-UGAUD3D1-bin.000211', '2024-05-16 12:06:15', 'warehouse_test');

-- ----------------------------
-- Table structure for binlog_control
-- ----------------------------
DROP TABLE IF EXISTS `binlog_control`;
CREATE TABLE `binlog_control`  (
  `db_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `binlog_filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `binlog_position` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`db_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of binlog_control
-- ----------------------------
INSERT INTO `binlog_control` VALUES ('warehouse_org1_test', 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\LAPTOP-UGAUD3D1-bin.000235', 1006);
INSERT INTO `binlog_control` VALUES ('warehouse_org1_test2', 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\LAPTOP-UGAUD3D1-bin.000234', 906);
INSERT INTO `binlog_control` VALUES ('warehouse_test', 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\LAPTOP-UGAUD3D1-bin.000231', 1109);
INSERT INTO `binlog_control` VALUES ('warehouse_test2', 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\LAPTOP-UGAUD3D1-bin.000232', 2154);

SET FOREIGN_KEY_CHECKS = 1;
