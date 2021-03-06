/*
 Navicat Premium Data Transfer

 Source Server         : htz
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : douyin

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 07/06/2022 10:59:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment_info
-- ----------------------------
DROP TABLE IF EXISTS `comment_info`;
CREATE TABLE `comment_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `video_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_date` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_info
-- ----------------------------
INSERT INTO `comment_info` VALUES (14, '8', '3', '你好', '06-07');

-- ----------------------------
-- Table structure for user_follower
-- ----------------------------
DROP TABLE IF EXISTS `user_follower`;
CREATE TABLE `user_follower`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `to_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_follower
-- ----------------------------
INSERT INTO `user_follower` VALUES (20, '9', '3');
INSERT INTO `user_follower` VALUES (21, '9', '2');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `follow_count` int(0) NOT NULL,
  `follower_count` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'zhangsan', '123456', 0, 0);
INSERT INTO `user_info` VALUES (2, 'lisi', '123456', 0, 1);
INSERT INTO `user_info` VALUES (3, 'wangwu', '123456', 0, 1);
INSERT INTO `user_info` VALUES (4, 'xingyunye', '123456', 0, 0);
INSERT INTO `user_info` VALUES (5, 'yunlinyou', '123456', 0, 0);
INSERT INTO `user_info` VALUES (6, 'zhangliu', '123456', 0, 0);
INSERT INTO `user_info` VALUES (8, 'xiaoming', '123456', 0, 0);
INSERT INTO `user_info` VALUES (9, 'xiaohong', '123456', 2, 0);

-- ----------------------------
-- Table structure for video_favorite
-- ----------------------------
DROP TABLE IF EXISTS `video_favorite`;
CREATE TABLE `video_favorite`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `video_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video_info
-- ----------------------------
DROP TABLE IF EXISTS `video_info`;
CREATE TABLE `video_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `play_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cover_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `favorite_count` int(0) NOT NULL DEFAULT 0,
  `comment_count` int(0) NOT NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_info
-- ----------------------------
INSERT INTO `video_info` VALUES (1, '2', 'https://www.w3schools.com/html/movie.mp4', 'https://cdn.pixabay.com/photo/2016/03/27/18/10/bear-1283347_1280.jpg', 1, 0, '测试1', '2022-05-28 09:43:37');
INSERT INTO `video_info` VALUES (2, '1', 'https://www.w3schools.com/html/mov_bbb.mp4', 'https://www.topgoer.cn/uploads/blog/202111/attach_16b79b08788038a8.jpg', 4, 0, '测试2', '2022-06-07 10:12:19');
INSERT INTO `video_info` VALUES (3, '3', 'http://rclc6mkkn.hn-bkt.clouddn.com/mikasa.mp4', 'http://rclc6mkkn.hn-bkt.clouddn.com/%E5%B0%8F%E4%B8%89%E7%AC%A0.jpg', 4, 1, '测试3', '2022-06-07 10:36:58');

SET FOREIGN_KEY_CHECKS = 1;
