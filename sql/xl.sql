/*
 Navicat Premium Data Transfer

 Source Server         : mysql8.0
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : xl

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 08/12/2024 20:57:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 't_user_points', '用户积分表', '', '', 'UserPoints', 'crud', 'element-ui', 'com.hndy.xl', 'laboratory', 'points', '用户积分', 'ruoyi', '0', '/', '{\"treeCode\":\"user_id\",\"parentMenuId\":0}', 'admin', '2024-10-29 16:26:18', '', '2024-10-29 20:49:28', NULL);
INSERT INTO `gen_table` VALUES (6, 't_proofs', '用来完成证明材料的提交', NULL, NULL, 'Proofs', 'crud', 'element-ui', 'com.hndy.xl', 'laboratory', 'proofs', '积分证明材料', 'lxy', '0', '/', '{\"parentMenuId\":0}', 'admin', '2024-11-04 14:33:38', '', '2024-11-04 15:19:20', '用来完成证明材料的提交');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (21, 3, 'id', '序号', 'bigint', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-29 16:26:18', '', '2024-10-29 20:49:28');
INSERT INTO `gen_table_column` VALUES (22, 3, 'user_id', '昵称', 'bigint', 'String', 'userId', '0', '0', '1', '0', '0', '1', '0', 'LIKE', 'input', '', 2, 'admin', '2024-10-29 16:26:18', '', '2024-10-29 20:49:28');
INSERT INTO `gen_table_column` VALUES (23, 3, 'points', '积分', 'int', 'Long', 'points', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-10-29 16:26:18', '', '2024-10-29 20:49:28');
INSERT INTO `gen_table_column` VALUES (24, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2024-10-29 16:26:18', '', '2024-10-29 20:49:28');
INSERT INTO `gen_table_column` VALUES (25, 3, 'dept_id', '方向', 'bigint', 'String', 'deptId', '0', '0', '1', '0', '0', '1', '1', 'LIKE', 'input', '', 3, '', '2024-10-29 19:59:01', '', '2024-10-29 20:49:28');
INSERT INTO `gen_table_column` VALUES (55, 6, 'material_id', '序号', 'bigint', 'Long', 'materialId', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-11-04 14:33:38', '', '2024-11-04 15:19:20');
INSERT INTO `gen_table_column` VALUES (56, 6, 'user_id', '用户名称', 'bigint', 'Long', 'userId', '0', '0', '0', '0', '0', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-11-04 14:33:38', '', '2024-11-04 15:19:20');
INSERT INTO `gen_table_column` VALUES (57, 6, 'material_content', '材料', 'longblob', 'String', 'materialContent', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'editor', '', 3, 'admin', '2024-11-04 14:33:38', '', '2024-11-04 15:19:20');
INSERT INTO `gen_table_column` VALUES (58, 6, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2024-11-04 14:33:38', '', '2024-11-04 15:19:20');
INSERT INTO `gen_table_column` VALUES (59, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, '1', NULL, 'EQ', 'datetime', '', 4, 'admin', '2024-11-04 14:33:38', '', '2024-11-04 15:19:20');
INSERT INTO `gen_table_column` VALUES (60, 6, 'update_by', '更新人', 'varchar(10)', 'String', 'updateBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-11-04 14:33:38', '', '2024-11-04 15:19:20');
INSERT INTO `gen_table_column` VALUES (61, 6, 'points', '积分值', 'varchar(255)', 'String', 'points', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-11-04 14:33:38', '', '2024-11-04 15:19:20');
INSERT INTO `gen_table_column` VALUES (62, 6, 'update_time', '认定时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '0', '1', NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-11-04 14:33:38', '', '2024-11-04 15:19:20');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-10-29 12:56:12', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-10-29 12:56:12', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-10-29 12:56:12', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-10-29 12:56:12', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-10-29 12:56:12', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-10-29 12:56:12', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'hndy', 0, '', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-29 12:56:12', 'admin', '2024-10-29 18:55:53');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '湘岚', 1, '', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-29 12:56:12', 'admin', '2024-10-29 13:06:17');
INSERT INTO `sys_dept` VALUES (200, 101, '0,100,101', 'WEB', 4, '徐鹏', '17807343064', '2176302180@qq.com', '0', '0', 'admin', '2024-10-29 13:06:39', 'admin', '2024-12-07 16:50:03');
INSERT INTO `sys_dept` VALUES (201, 101, '0,100,101', 'Pwn', 3, '刘坤浩', '17363344914', '2770133542@qq.com', '0', '0', 'admin', '2024-10-29 18:58:25', 'admin', '2024-12-07 16:49:53');
INSERT INTO `sys_dept` VALUES (202, 101, '0,100,101', 'MISC', 2, '徐鹏', '17807343064', '2176302180@qq.com', '0', '0', 'admin', '2024-10-29 19:01:53', 'admin', '2024-12-07 16:49:40');
INSERT INTO `sys_dept` VALUES (203, 101, '0,100,101', 'Reverse', 5, '许强', '15367090472', '2790231925@qq.com', '0', '0', 'admin', '2024-10-29 19:02:03', 'admin', '2024-12-07 16:50:12');
INSERT INTO `sys_dept` VALUES (204, 101, '0,100,101', 'Crypto', 6, '周文杰', '15673415158', '2256475223@qq.com', '0', '0', 'admin', '2024-10-29 19:02:27', 'admin', '2024-12-07 16:50:24');
INSERT INTO `sys_dept` VALUES (205, 101, '0,100,101', 'ACM', 7, '张以琳', '15369958967', '2908453829@qq.com', '0', '0', 'admin', '2024-12-06 00:48:05', '', NULL);
INSERT INTO `sys_dept` VALUES (206, 101, '0,100,101', 'notAssigned', 8, NULL, NULL, NULL, '0', '0', 'admin', '2024-12-07 15:39:32', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-10-29 12:56:13', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-10-29 12:56:13', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-10-29 12:56:13', '', NULL, '');
INSERT INTO `sys_job` VALUES (100, '积分每天减少一分', 'DEFAULT', 'MyTask.decrease()', '0 0 0 1/1 * ?', '1', '1', '0', 'admin', '2024-11-05 11:08:31', 'admin', '2024-12-07 16:56:19', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '积分每天减少一分', 'DEFAULT', 'MyTask.decrease()', '积分每天减少一分 总共耗时：73毫秒', '0', '', '2024-12-07 16:57:21');
INSERT INTO `sys_job_log` VALUES (11, '积分每天减少一分', 'DEFAULT', 'MyTask.decrease()', '积分每天减少一分 总共耗时：172毫秒', '0', '', '2024-12-08 00:00:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 384 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-12-07 17:22:25');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2024-12-07 17:28:57');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-07 17:29:02');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-12-07 17:40:22');
INSERT INTO `sys_logininfor` VALUES (5, '24405090123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-07 17:40:52');
INSERT INTO `sys_logininfor` VALUES (6, '24405090123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-12-07 17:45:12');
INSERT INTO `sys_logininfor` VALUES (7, '23405080244', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-07 17:45:29');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '192.168.1.104', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-12-07 18:00:59');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '192.168.1.104', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-07 18:01:03');
INSERT INTO `sys_logininfor` VALUES (379, '23405080244', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-12-07 18:10:10');
INSERT INTO `sys_logininfor` VALUES (380, 'root', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2024-12-07 18:10:28');
INSERT INTO `sys_logininfor` VALUES (381, 'root', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-07 18:10:52');
INSERT INTO `sys_logininfor` VALUES (382, 'root', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-12-07 18:17:51');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-07 18:17:55');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2044 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-10-29 12:56:12', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-10-29 12:56:12', 'admin', '2024-11-11 12:05:21', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-10-29 12:56:12', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-10-29 12:56:12', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-10-29 12:56:12', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-10-29 12:56:12', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-10-29 12:56:12', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-10-29 12:56:12', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-10-29 12:56:12', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-10-29 12:56:12', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-10-29 12:56:12', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-10-29 12:56:12', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-10-29 12:56:12', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-10-29 12:56:12', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-10-29 12:56:12', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-10-29 12:56:12', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-10-29 12:56:12', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-10-29 12:56:12', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-10-29 12:56:12', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-10-29 12:56:12', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-10-29 12:56:12', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-10-29 12:56:12', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-10-29 12:56:12', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-10-29 12:56:12', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-10-29 12:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '用户积分', 0, 1, 'points', 'laboratory/points/index', NULL, '', 1, 0, 'C', '0', '0', 'laboratory:points:list', 'chart', 'admin', '2024-10-29 16:45:37', 'admin', '2024-10-31 11:05:26', '用户积分菜单');
INSERT INTO `sys_menu` VALUES (2008, '用户积分查询', 2007, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'laboratory:points:query', '#', 'admin', '2024-10-29 16:45:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '用户积分新增', 2007, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'laboratory:points:add', '#', 'admin', '2024-10-29 16:45:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '用户积分修改', 2007, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'laboratory:points:edit', '#', 'admin', '2024-10-29 16:45:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '用户积分删除', 2007, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'laboratory:points:remove', '#', 'admin', '2024-10-29 16:45:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '用户积分导出', 2007, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'laboratory:points:export', '#', 'admin', '2024-10-29 16:45:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '编辑介绍', 0, 2, 'introduce', '', NULL, '', 1, 0, 'M', '0', '0', '', 'edit', 'admin', '2024-10-31 11:07:21', 'admin', '2024-11-11 12:05:10', '');
INSERT INTO `sys_menu` VALUES (2014, '编辑首页', 2013, 1, 'introduce', 'laboratory/introduce/index', NULL, '', 1, 0, 'C', '0', '0', 'laboratory:introduce:upload', 'clipboard', 'admin', '2024-10-31 11:09:37', 'root', '2024-11-26 19:58:34', '');
INSERT INTO `sys_menu` VALUES (2020, '方向介绍', 2013, 1, 'direction', 'laboratory/introduce/direction/index', NULL, '', 1, 0, 'C', '0', '0', 'laboratory:introduce:upload', 'clipboard', 'admin', '2024-11-02 22:57:29', 'root', '2024-11-26 19:58:39', '');
INSERT INTO `sys_menu` VALUES (2021, '方向介绍', 0, 2, 'show', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'education', 'admin', '2024-11-02 23:06:01', 'admin', '2024-11-11 12:05:13', '');
INSERT INTO `sys_menu` VALUES (2022, 'misc', 2021, 1, 'misc', 'laboratory/introduce/show/misc/index', NULL, '', 1, 0, 'C', '0', '0', '', 'education', 'admin', '2024-11-02 23:09:20', 'admin', '2024-11-02 23:25:34', '');
INSERT INTO `sys_menu` VALUES (2023, 'pwn', 2021, 1, 'pwn', 'laboratory/introduce/show/pwn/index', NULL, '', 1, 0, 'C', '0', '0', '', 'education', 'admin', '2024-11-02 23:09:47', 'admin', '2024-11-02 23:26:39', '');
INSERT INTO `sys_menu` VALUES (2024, 'web', 2021, 1, 'web', 'laboratory/introduce/show/web/index', NULL, '', 1, 0, 'C', '0', '0', '', 'education', 'admin', '2024-11-02 23:10:06', 'admin', '2024-11-02 23:26:31', '');
INSERT INTO `sys_menu` VALUES (2025, 're', 2021, 1, 're', 'laboratory/introduce/show/re/index', '', '', 1, 0, 'C', '0', '0', '', 'education', 'admin', '2024-11-02 23:27:01', 'admin', '2024-11-02 23:27:25', '');
INSERT INTO `sys_menu` VALUES (2026, 'crypto', 2021, 1, 'crypto', 'laboratory/introduce/show/crypto/index', NULL, '', 1, 0, 'C', '0', '0', NULL, 'education', 'admin', '2024-11-02 23:27:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '上传材料', 0, 1, 'proofs', 'laboratory/proofs/index', NULL, '', 1, 0, 'C', '0', '0', 'laboratory:proofs:list', 'checkbox', 'admin', '2024-11-04 14:44:10', 'admin', '2024-11-04 16:48:10', '积分证明材料菜单');
INSERT INTO `sys_menu` VALUES (2031, '积分证明材料查询', 2030, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'laboratory:proofs:query', '#', 'admin', '2024-11-04 14:44:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '积分证明材料新增', 2030, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'laboratory:proofs:add', '#', 'admin', '2024-11-04 14:44:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '积分证明材料修改', 2030, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'laboratory:proofs:edit', '#', 'admin', '2024-11-04 14:44:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '积分证明材料删除', 2030, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'laboratory:proofs:remove', '#', 'admin', '2024-11-04 14:44:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '积分证明材料导出', 2030, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'laboratory:proofs:export', '#', 'admin', '2024-11-04 14:44:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '积分认定', 0, 1, 'editImage', 'laboratory/proofs/edit/index', NULL, '', 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2024-11-04 16:14:32', 'admin', '2024-11-04 16:19:51', '');
INSERT INTO `sys_menu` VALUES (2043, 'ACM', 2021, 1, 'ACM', 'laboratory/introduce/show/acm/index', NULL, '', 1, 0, 'C', '0', '0', NULL, 'education', 'admin', '2024-12-06 00:36:35', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-10-29 12:56:13', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-10-29 12:56:13', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (10, 'gg', '1', 0x3C703E3C696D67207372633D222F6465762D6170692F70726F66696C652F75706C6F61642F323032342F31312F30332FE5B18FE5B995E688AAE59BBE20323032342D31302D3239203231333630345F3230323431313033313331383233413030312E706E67223E3C2F703E3C703E3C62723E3C2F703E3C703EE5B09DE8AF953C2F703E, '0', 'root', '2024-11-03 13:18:46', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 598 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.hndy.xl.web.controller.monitor.SysOperlogController.clean()', 'DELETE', 1, 'admin', NULL, '/monitor/operlog/clean', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:42:12', 277);
INSERT INTO `sys_oper_log` VALUES (2, '登录日志', 9, 'com.hndy.xl.web.controller.monitor.SysLogininforController.clean()', 'DELETE', 1, 'admin', NULL, '/monitor/logininfor/clean', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:42:17', 226);
INSERT INTO `sys_oper_log` VALUES (3, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:48\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":205,\"email\":\"2908453829@qq.com\",\"loginIp\":\"\",\"nickName\":\"张以琳\",\"params\":{},\"phonenumber\":\"15369958967\",\"postIds\":[2,4],\"roleIds\":[101,102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":356,\"userName\":\"22406020136\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:44:52', 75);
INSERT INTO `sys_oper_log` VALUES (4, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":205,\"email\":\"350033951@qq.com\",\"loginIp\":\"\",\"nickName\":\"潘越\",\"params\":{},\"phonenumber\":\"18932389060\",\"postIds\":[2,4],\"roleIds\":[101,102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":357,\"userName\":\"22407010327\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:45:02', 39);
INSERT INTO `sys_oper_log` VALUES (5, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":204,\"email\":\"1878204957@qq.com\",\"loginIp\":\"\",\"nickName\":\"王淼\",\"params\":{},\"phonenumber\":\"13940938578\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":358,\"userName\":\"24405090123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:45:20', 30);
INSERT INTO `sys_oper_log` VALUES (6, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":204,\"email\":\"2401907227@qq.com\",\"loginIp\":\"\",\"nickName\":\"唐旖\",\"params\":{},\"phonenumber\":\"19719897882\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":359,\"userName\":\"23405010117\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:45:30', 56);
INSERT INTO `sys_oper_log` VALUES (7, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":204,\"email\":\"450807057@qq.com\",\"loginIp\":\"\",\"nickName\":\"熊颖希\",\"params\":{},\"phonenumber\":\"18827858273\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":360,\"userName\":\"22407010627\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:45:40', 48);
INSERT INTO `sys_oper_log` VALUES (8, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":204,\"email\":\"3189276328@qq.com\",\"loginIp\":\"\",\"nickName\":\"张智涵\",\"params\":{},\"phonenumber\":\"13287397899\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":361,\"userName\":\"24405090234\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:45:50', 55);
INSERT INTO `sys_oper_log` VALUES (9, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":204,\"email\":\"2310283597@qq.com\",\"loginIp\":\"\",\"nickName\":\"王晨宇\",\"params\":{},\"phonenumber\":\"13107217205\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":362,\"userName\":\"24405090240\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:46:04', 30);
INSERT INTO `sys_oper_log` VALUES (10, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":204,\"email\":\"2256475223@qq.com\",\"loginIp\":\"\",\"nickName\":\"周文杰\",\"params\":{},\"phonenumber\":\"15673415158\",\"postIds\":[2],\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":363,\"userName\":\"23405080244\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:46:14', 87);
INSERT INTO `sys_oper_log` VALUES (11, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":201,\"email\":\"2832876089@qq.com\",\"loginIp\":\"\",\"nickName\":\"易度宇\",\"params\":{},\"phonenumber\":\"15211780849\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":364,\"userName\":\"24405090350\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:46:44', 78);
INSERT INTO `sys_oper_log` VALUES (12, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":201,\"email\":\"1051297919@qq.com\",\"loginIp\":\"\",\"nickName\":\"陈志豪\",\"params\":{},\"phonenumber\":\"15371791573\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":365,\"userName\":\"24405090141\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:47:05', 41);
INSERT INTO `sys_oper_log` VALUES (13, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":201,\"email\":\"3493729266@qq.com\",\"loginIp\":\"\",\"nickName\":\"艾凡琦\",\"params\":{},\"phonenumber\":\"19923910403\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":366,\"userName\":\"24405080149\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:47:21', 102);
INSERT INTO `sys_oper_log` VALUES (14, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":201,\"email\":\"1484115644@qq.com\",\"loginIp\":\"\",\"nickName\":\"徐展坤\",\"params\":{},\"phonenumber\":\"15835657864\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":367,\"userName\":\"24405090230\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:47:33', 31);
INSERT INTO `sys_oper_log` VALUES (15, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":201,\"email\":\"2770133542@qq.com\",\"loginIp\":\"\",\"nickName\":\"刘坤浩\",\"params\":{},\"phonenumber\":\"17363344914\",\"postIds\":[2],\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":368,\"userName\":\"23405010132\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:47:43', 16);
INSERT INTO `sys_oper_log` VALUES (16, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":201,\"email\":\"1692812799@qq.com\",\"loginIp\":\"\",\"nickName\":\"徐民城\",\"params\":{},\"phonenumber\":\"19313178169\",\"postIds\":[2,4],\"roleIds\":[101,102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":369,\"userName\":\"23405010122\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:47:53', 58);
INSERT INTO `sys_oper_log` VALUES (17, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":203,\"email\":\"1538342331@qq.com\",\"loginIp\":\"\",\"nickName\":\"曾嘉文\",\"params\":{},\"phonenumber\":\"13367482782\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":370,\"userName\":\"23405080114\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:48:40', 80);
INSERT INTO `sys_oper_log` VALUES (18, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":203,\"email\":\"3044570478@qq.com\",\"loginIp\":\"\",\"nickName\":\"罗嘉月\",\"params\":{},\"phonenumber\":\"15200332533\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":371,\"userName\":\"24405090303\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:48:50', 17);
INSERT INTO `sys_oper_log` VALUES (19, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":203,\"email\":\"2790231925@qq.com\",\"loginIp\":\"\",\"nickName\":\"许强\",\"params\":{},\"phonenumber\":\"15367090472\",\"postIds\":[2],\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":372,\"userName\":\"23405010336\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:48:58', 55);
INSERT INTO `sys_oper_log` VALUES (20, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":203,\"email\":\"1271408196@qq.com\",\"loginIp\":\"\",\"nickName\":\"柏佳仪\",\"params\":{},\"phonenumber\":\"15399849916\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":373,\"userName\":\"24405090313\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:49:06', 60);
INSERT INTO `sys_oper_log` VALUES (21, '部门管理', 2, 'com.hndy.xl.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":202,\"deptName\":\"MISC\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"湘岚\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:49:40', 77);
INSERT INTO `sys_oper_log` VALUES (22, '部门管理', 2, 'com.hndy.xl.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":201,\"deptName\":\"Pwn\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"湘岚\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:49:53', 68);
INSERT INTO `sys_oper_log` VALUES (23, '部门管理', 2, 'com.hndy.xl.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":200,\"deptName\":\"WEB\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"parentName\":\"湘岚\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:50:03', 32);
INSERT INTO `sys_oper_log` VALUES (24, '部门管理', 2, 'com.hndy.xl.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":203,\"deptName\":\"Reverse\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"parentName\":\"湘岚\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:50:12', 23);
INSERT INTO `sys_oper_log` VALUES (25, '部门管理', 2, 'com.hndy.xl.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":204,\"deptName\":\"Crypto\",\"orderNum\":6,\"params\":{},\"parentId\":101,\"parentName\":\"湘岚\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:50:24', 37);
INSERT INTO `sys_oper_log` VALUES (26, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"1123118707@qq.com\",\"loginIp\":\"\",\"nickName\":\"高佳旭\",\"params\":{},\"phonenumber\":\"13081088561\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":374,\"userName\":\"24405090135\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:51:01', 88);
INSERT INTO `sys_oper_log` VALUES (27, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"1052033783@qq.com\",\"loginIp\":\"\",\"nickName\":\"杨家辉\",\"params\":{},\"phonenumber\":\"19198071689\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":375,\"userName\":\"24405090148\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:51:19', 72);
INSERT INTO `sys_oper_log` VALUES (28, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"3162667857@qq.com\",\"loginIp\":\"\",\"nickName\":\"李梦晗\",\"params\":{},\"phonenumber\":\"18912176089\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":376,\"userName\":\"24405010102\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:51:30', 29);
INSERT INTO `sys_oper_log` VALUES (29, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"2176302180@qq.com\",\"loginIp\":\"\",\"nickName\":\"徐鹏\",\"params\":{},\"phonenumber\":\"17807343064\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":377,\"userName\":\"23405010330\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:51:43', 42);
INSERT INTO `sys_oper_log` VALUES (30, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"1245317602@qq.com\",\"loginIp\":\"\",\"nickName\":\"张佑铭\",\"params\":{},\"phonenumber\":\"19189658925\",\"postIds\":[2,4],\"roleIds\":[101,102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":378,\"userName\":\"23405010347\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:51:54', 22);
INSERT INTO `sys_oper_log` VALUES (31, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"3067710031@qq.com\",\"loginIp\":\"\",\"nickName\":\"曾鸣\",\"params\":{},\"phonenumber\":\"18397730519\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":379,\"userName\":\"22407010624\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:52:05', 36);
INSERT INTO `sys_oper_log` VALUES (32, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"313418616@qq.com\",\"loginIp\":\"\",\"nickName\":\"黄棋\",\"params\":{},\"phonenumber\":\"19186993176\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":380,\"userName\":\"24405090305\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:52:12', 14);
INSERT INTO `sys_oper_log` VALUES (33, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":200,\"deptName\":\"WEB\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"2176302180@qq.com\",\"loginIp\":\"\",\"nickName\":\"徐鹏\",\"params\":{},\"phonenumber\":\"17807343064\",\"postIds\":[2],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"crew\",\"roleName\":\"组员\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":377,\"userName\":\"23405010330\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:52:22', 57);
INSERT INTO `sys_oper_log` VALUES (34, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"2078474483@qq.com\",\"loginIp\":\"\",\"nickName\":\"向宸皓\",\"params\":{},\"phonenumber\":\"19174375120\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":381,\"userName\":\"24405090320\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:52:58', 74);
INSERT INTO `sys_oper_log` VALUES (35, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"3280406626@qq.com\",\"loginIp\":\"\",\"nickName\":\"戴林翰\",\"params\":{},\"phonenumber\":\"15576614589\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":382,\"userName\":\"22407010139\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:53:07', 40);
INSERT INTO `sys_oper_log` VALUES (36, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"2240021710@qq.com\",\"loginIp\":\"\",\"nickName\":\"戚建稳\",\"params\":{},\"phonenumber\":\"18565128476\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":383,\"userName\":\"24405090335\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:53:19', 72);
INSERT INTO `sys_oper_log` VALUES (37, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"3504630173@qq.com\",\"loginIp\":\"\",\"nickName\":\"龙伟豪\",\"params\":{},\"phonenumber\":\"15116594722\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":384,\"userName\":\"24405090324\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:53:33', 67);
INSERT INTO `sys_oper_log` VALUES (38, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"2819406307@qq.com\",\"loginIp\":\"\",\"nickName\":\"向欣\",\"params\":{},\"phonenumber\":\"19310106375\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":385,\"userName\":\"24405090311\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:53:41', 40);
INSERT INTO `sys_oper_log` VALUES (39, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"2078337946@qq.com\",\"loginIp\":\"\",\"nickName\":\"付小荣\",\"params\":{},\"phonenumber\":\"13638444482\",\"postIds\":[2,4],\"roleIds\":[101,102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":386,\"userName\":\"23405010221\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:53:50', 41);
INSERT INTO `sys_oper_log` VALUES (40, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"1490852806@qq.com\",\"loginIp\":\"\",\"nickName\":\"舒婉男\",\"params\":{},\"phonenumber\":\"15600773200\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":387,\"userName\":\"24405090317\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:53:59', 40);
INSERT INTO `sys_oper_log` VALUES (41, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"1956132796@qq.com\",\"loginIp\":\"\",\"nickName\":\"辛雅静\",\"params\":{},\"phonenumber\":\"16551771151\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":388,\"userName\":\"23405010102\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:54:07', 40);
INSERT INTO `sys_oper_log` VALUES (42, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":206,\"deptName\":\"notAssigned\",\"orderNum\":8,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"2753428883@qq.com\",\"loginIp\":\"\",\"nickName\":\"刘思宇\",\"params\":{},\"phonenumber\":\"17872313057\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":389,\"userName\":\"24405090344\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:54:15', 40);
INSERT INTO `sys_oper_log` VALUES (43, '定时任务', 2, 'com.hndy.xl.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2024-11-05 11:08:31\",\"cronExpression\":\"0 0 0 1/1 * ?\",\"invokeTarget\":\"MyTask.decrease()\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"积分每天减少一分\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-12-08 00:00:00\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:55:40', 56);
INSERT INTO `sys_oper_log` VALUES (44, '定时任务', 2, 'com.hndy.xl.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2024-11-05 11:08:31\",\"cronExpression\":\"0 0 0 1/1 * ?\",\"invokeTarget\":\"MyTask.decrease()\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"积分每天减少一分\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-12-08 00:00:00\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:56:19', 30);
INSERT INTO `sys_oper_log` VALUES (45, '定时任务', 2, 'com.hndy.xl.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 16:57:21', 6);
INSERT INTO `sys_oper_log` VALUES (46, '积分证明材料', 3, 'com.hndy.xl.controller.ProofsController.remove()', 'DELETE', 1, 'admin', NULL, '/laboratory/proofs/15', '127.0.0.1', '内网IP', '[15]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 17:34:33', 25);
INSERT INTO `sys_oper_log` VALUES (47, '积分证明材料', 3, 'com.hndy.xl.controller.ProofsController.remove()', 'DELETE', 1, 'admin', NULL, '/laboratory/proofs/14', '127.0.0.1', '内网IP', '[14]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 17:34:36', 18);
INSERT INTO `sys_oper_log` VALUES (48, '积分证明材料', 3, 'com.hndy.xl.controller.ProofsController.remove()', 'DELETE', 1, 'admin', NULL, '/laboratory/proofs/16', '127.0.0.1', '内网IP', '[16]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 17:34:41', 28);
INSERT INTO `sys_oper_log` VALUES (49, '积分证明材料', 1, 'com.hndy.xl.controller.ProofsController.add()', 'POST', 1, '24405090123', 'Crypto', '/laboratory/proofs', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-12-07 17:42:53\",\"materialContent\":\"<p>zxc</p>\",\"params\":{},\"userId\":358}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 17:42:53', 51);
INSERT INTO `sys_oper_log` VALUES (50, '积分认定', 2, 'com.hndy.xl.controller.ProofsController.editCognizance()', 'PUT', 1, '23405080244', 'Crypto', '/laboratory/proofs/cognizance', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-12-07 17:42:53\",\"materialContent\":\"<p>zxc</p>\",\"materialId\":19,\"params\":{},\"points\":\"2\",\"status\":\"1\",\"updateBy\":\"363\",\"updateTime\":\"2024-12-07 17:46:03\",\"userId\":358,\"userName\":\"王淼\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 17:46:03', 135);
INSERT INTO `sys_oper_log` VALUES (51, '积分认定', 2, 'com.hndy.xl.controller.ProofsController.editCognizance()', 'PUT', 1, '23405080244', 'Crypto', '/laboratory/proofs/cognizance', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-12-07 17:42:53\",\"materialContent\":\"<p>zxc</p>\",\"materialId\":19,\"params\":{},\"points\":\"3\",\"status\":\"1\",\"updateBy\":\"363\",\"updateTime\":\"2024-12-07 17:46:27\",\"updaterName\":\"周文杰\",\"userId\":358,\"userName\":\"王淼\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 17:46:28', 84);
INSERT INTO `sys_oper_log` VALUES (52, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, '23405080244', 'Crypto', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"23405080244\",\"userId\":358}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 18:00:06', 24);
INSERT INTO `sys_oper_log` VALUES (53, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, '23405080244', 'Crypto', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"23405080244\",\"userId\":358}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 18:00:08', 26);
INSERT INTO `sys_oper_log` VALUES (54, '用户管理', 2, 'com.hndy.xl.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '192.168.1.104', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-12-07 15:41:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":204,\"deptName\":\"Crypto\",\"leader\":\"周文杰\",\"orderNum\":6,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":204,\"email\":\"2256475223@qq.com\",\"loginDate\":\"2024-12-07 17:45:29\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"周文杰\",\"params\":{},\"phonenumber\":\"15673415158\",\"postIds\":[2],\"roleIds\":[101,102],\"roles\":[{\"admin\":false,\"dataScope\":\"3\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"leader\",\"roleName\":\"组长\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":363,\"userName\":\"23405080244\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 18:01:55', 88);
INSERT INTO `sys_oper_log` VALUES (596, '积分认定', 2, 'com.hndy.xl.controller.ProofsController.editCognizance()', 'PUT', 1, 'root', '湘岚', '/laboratory/proofs/cognizance', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-12-07 17:42:53\",\"materialContent\":\"<p>zxc</p>\",\"materialId\":19,\"params\":{},\"points\":\"2\",\"status\":\"1\",\"updateBy\":\"100\",\"updateTime\":\"2024-12-07 18:11:07\",\"updaterName\":\"周文杰\",\"userId\":358,\"userName\":\"王淼\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 18:11:07', 63);
INSERT INTO `sys_oper_log` VALUES (597, '积分证明材料', 3, 'com.hndy.xl.controller.ProofsController.remove()', 'DELETE', 1, 'root', '湘岚', '/laboratory/proofs/19', '127.0.0.1', '内网IP', '[19]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-07 18:17:45', 24);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'teacher', '老师', 1, '0', 'admin', '2024-10-29 12:56:12', 'admin', '2024-10-29 17:19:21', '');
INSERT INTO `sys_post` VALUES (2, 'leader', '组长', 2, '0', 'admin', '2024-10-29 12:56:12', 'admin', '2024-10-29 17:19:03', '');
INSERT INTO `sys_post` VALUES (4, 'crew', '组员', 3, '0', 'admin', '2024-10-29 12:56:12', 'admin', '2024-10-29 17:18:33', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-10-29 12:56:12', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 0, 0, '1', '0', 'admin', '2024-10-29 12:56:12', 'admin', '2024-10-29 20:41:21', '普通角色');
INSERT INTO `sys_role` VALUES (100, '老师', 'teacher', 0, '1', 1, 1, '0', '0', 'admin', '2024-10-29 13:38:26', 'admin', '2024-12-06 00:54:48', NULL);
INSERT INTO `sys_role` VALUES (101, '组长', 'leader', 0, '3', 0, 0, '0', '0', 'admin', '2024-10-29 13:39:32', 'admin', '2024-12-06 00:55:05', NULL);
INSERT INTO `sys_role` VALUES (102, '组员', 'crew', 0, '1', 1, 1, '0', '0', 'admin', '2024-10-29 13:39:56', 'admin', '2024-12-06 00:54:23', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2042);
INSERT INTO `sys_role_menu` VALUES (100, 2043);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 100);
INSERT INTO `sys_role_menu` VALUES (101, 1001);
INSERT INTO `sys_role_menu` VALUES (101, 1002);
INSERT INTO `sys_role_menu` VALUES (101, 1006);
INSERT INTO `sys_role_menu` VALUES (101, 1035);
INSERT INTO `sys_role_menu` VALUES (101, 1036);
INSERT INTO `sys_role_menu` VALUES (101, 1037);
INSERT INTO `sys_role_menu` VALUES (101, 1038);
INSERT INTO `sys_role_menu` VALUES (101, 2007);
INSERT INTO `sys_role_menu` VALUES (101, 2008);
INSERT INTO `sys_role_menu` VALUES (101, 2012);
INSERT INTO `sys_role_menu` VALUES (101, 2013);
INSERT INTO `sys_role_menu` VALUES (101, 2020);
INSERT INTO `sys_role_menu` VALUES (101, 2021);
INSERT INTO `sys_role_menu` VALUES (101, 2022);
INSERT INTO `sys_role_menu` VALUES (101, 2023);
INSERT INTO `sys_role_menu` VALUES (101, 2024);
INSERT INTO `sys_role_menu` VALUES (101, 2025);
INSERT INTO `sys_role_menu` VALUES (101, 2026);
INSERT INTO `sys_role_menu` VALUES (101, 2030);
INSERT INTO `sys_role_menu` VALUES (101, 2031);
INSERT INTO `sys_role_menu` VALUES (101, 2032);
INSERT INTO `sys_role_menu` VALUES (101, 2033);
INSERT INTO `sys_role_menu` VALUES (101, 2042);
INSERT INTO `sys_role_menu` VALUES (101, 2043);
INSERT INTO `sys_role_menu` VALUES (102, 2007);
INSERT INTO `sys_role_menu` VALUES (102, 2008);
INSERT INTO `sys_role_menu` VALUES (102, 2012);
INSERT INTO `sys_role_menu` VALUES (102, 2021);
INSERT INTO `sys_role_menu` VALUES (102, 2022);
INSERT INTO `sys_role_menu` VALUES (102, 2023);
INSERT INTO `sys_role_menu` VALUES (102, 2024);
INSERT INTO `sys_role_menu` VALUES (102, 2025);
INSERT INTO `sys_role_menu` VALUES (102, 2026);
INSERT INTO `sys_role_menu` VALUES (102, 2030);
INSERT INTO `sys_role_menu` VALUES (102, 2031);
INSERT INTO `sys_role_menu` VALUES (102, 2032);
INSERT INTO `sys_role_menu` VALUES (102, 2033);
INSERT INTO `sys_role_menu` VALUES (102, 2043);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '方向ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `dept_id`(`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 390 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '开发人员', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-12-07 18:17:56', 'admin', '2024-10-29 12:56:12', '', '2024-12-07 18:17:55', '管理员');
INSERT INTO `sys_user` VALUES (2, 200, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '1', '2', '127.0.0.1', '2024-10-29 12:56:12', 'admin', '2024-10-29 12:56:12', 'admin', '2024-11-11 10:30:42', '测试员');
INSERT INTO `sys_user` VALUES (100, 101, 'root', '周聪老师', '00', '', '', '0', '', '$2a$10$6yjTF44g.zMMcnXegsx67OU7aLAHOTSN0vx45uQFP1xCEpKchKrUW', '0', '0', '127.0.0.1', '2024-12-07 18:10:53', 'admin', '2024-10-29 13:40:37', 'admin', '2024-12-07 18:10:52', NULL);
INSERT INTO `sys_user` VALUES (114, 200, '123451', '测试组长1', '00', '', '', '0', '', '$2a$10$oC6bouRnUEds/ETXmUeU1u31SXiaJOKzgnAA4F.oNBK1GLMiWaDya', '0', '2', '127.0.0.1', '2024-12-06 00:52:55', 'admin', '2024-11-11 12:11:46', '', '2024-12-06 00:52:54', NULL);
INSERT INTO `sys_user` VALUES (115, 201, '123452', '测试组长2', '00', '', '', '0', '', '$2a$10$wB8wheOVaZ7/LqRp0kotLut1FAwBMfLyVl5k.s4nKkqrkPbFhyTI2', '0', '2', '10.199.80.111', '2024-11-11 12:18:22', 'admin', '2024-11-11 12:12:09', '', '2024-11-11 12:18:22', NULL);
INSERT INTO `sys_user` VALUES (116, 201, '1234561', '测试组员1', '00', '', '', '0', '', '$2a$10$ziYdWYXW2s10Gg6d4CrTzusDfODn1/d81uiHJgWiDZwq1Js4MEQsW', '0', '2', '127.0.0.1', '2024-12-06 00:53:25', 'admin', '2024-11-11 12:12:36', 'admin', '2024-12-06 00:53:25', NULL);
INSERT INTO `sys_user` VALUES (117, 200, '1234562', '测试组员2', '00', '', '', '0', '', '$2a$10$5wHk7.NE2ozBmMJFI55druRjgXULdFeIxas9pdOQQDUzM.LEthHO.', '0', '2', '', NULL, 'admin', '2024-11-11 12:13:31', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (356, 205, '22406020136', '张以琳', '00', '2908453829@qq.com', '15369958967', '0', '', '$2a$10$6yjTF44g.zMMcnXegsx67OU7aLAHOTSN0vx45uQFP1xCEpKchKrUW', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:48', 'admin', '2024-12-07 16:44:52', NULL);
INSERT INTO `sys_user` VALUES (357, 205, '22407010327', '潘越', '00', '350033951@qq.com', '18932389060', '1', '', '$2a$10$ADB/oZTySV2M54nhx/rcKux/i2vO084mgwb0iqeHSQYAURddULCra', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:49', 'admin', '2024-12-07 16:45:02', NULL);
INSERT INTO `sys_user` VALUES (358, 204, '24405090123', '王淼', '00', '1878204957@qq.com', '13940938578', '1', '', '$2a$10$zEucaxeM0vQ8PGF4nEf02OEFc5kph0USxGrKdYxhxh5GoaS3Yd9WO', '0', '0', '127.0.0.1', '2024-12-07 17:40:52', 'admin', '2024-12-07 15:41:49', '23405080244', '2024-12-07 18:00:08', NULL);
INSERT INTO `sys_user` VALUES (359, 204, '23405010117', '唐旖', '00', '2401907227@qq.com', '19719897882', '1', '', '$2a$10$Ge7kqQ4jecbbOEvaBDaDzOWqUDdK9DljyKDRMVcqiyp0tSvJmSoFy', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:49', 'admin', '2024-12-07 16:45:30', NULL);
INSERT INTO `sys_user` VALUES (360, 204, '22407010627', '熊颖希', '00', '450807057@qq.com', '18827858273', '1', '', '$2a$10$sfCgIVCHX0k3zLyiV8w67uOha6DRw8YPrKzafNlAu.v5.qAauPEdi', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:49', 'admin', '2024-12-07 16:45:40', NULL);
INSERT INTO `sys_user` VALUES (361, 204, '24405090234', '张智涵', '00', '3189276328@qq.com', '13287397899', '0', '', '$2a$10$eFiC2QNIBZxjRuw6PtvshuKvh82Fl.WES9mob5TUjGvdwJ9gVJgc2', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:49', 'admin', '2024-12-07 16:45:50', NULL);
INSERT INTO `sys_user` VALUES (362, 204, '24405090240', '王晨宇', '00', '2310283597@qq.com', '13107217205', '0', '', '$2a$10$AmVxNGYxvN.fWaz5WdQEmuEHsD2cUQAEuS/ocFH773oRab9x4KCmO', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:49', 'admin', '2024-12-07 16:46:04', NULL);
INSERT INTO `sys_user` VALUES (363, 204, '23405080244', '周文杰', '00', '2256475223@qq.com', '15673415158', '0', '', '$2a$10$4h3rqTgNpFq/3.xodU41uuGsCGaIrHkftqUNn8ihq4mGonCRgfrvO', '0', '0', '127.0.0.1', '2024-12-07 17:45:29', 'admin', '2024-12-07 15:41:49', 'admin', '2024-12-07 18:01:55', NULL);
INSERT INTO `sys_user` VALUES (364, 201, '24405090350', '易度宇', '00', '2832876089@qq.com', '15211780849', '0', '', '$2a$10$KfkjWcqzUMpwGJxOjhZGhe28mVgvbauGtcN0zsmziOrmw/OhC6Cha', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:50', 'admin', '2024-12-07 16:46:44', NULL);
INSERT INTO `sys_user` VALUES (365, 201, '24405090141', '陈志豪', '00', '1051297919@qq.com', '15371791573', '0', '', '$2a$10$mT0ewpXazGpRo8UsRM6Iq.6I6WfUhWfS1XAiOv3nfZselcomws1Iu', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:50', 'admin', '2024-12-07 16:47:05', NULL);
INSERT INTO `sys_user` VALUES (366, 201, '24405080149', '艾凡琦', '00', '3493729266@qq.com', '19923910403', '0', '', '$2a$10$Mb5bd/2bLJIKQuQFoJnaU.MI2rHS.YWG0X8GdEr2Y5jRBIbLEHZ5.', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:50', 'admin', '2024-12-07 16:47:21', NULL);
INSERT INTO `sys_user` VALUES (367, 201, '24405090230', '徐展坤', '00', '1484115644@qq.com', '15835657864', '0', '', '$2a$10$yTLT6rmyFkqk8IMZqy4xW.3yFpDW0nqoNvkH88YFwOtpCvRpq9/l6', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:50', 'admin', '2024-12-07 16:47:33', NULL);
INSERT INTO `sys_user` VALUES (368, 201, '23405010132', '刘坤浩', '00', '2770133542@qq.com', '17363344914', '0', '', '$2a$10$AY3WAsxhDEucHMzuKOOzNeSAA0FLL/wHFKNBkDg5HH6ij9TIW2yt6', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:50', 'admin', '2024-12-07 16:47:43', NULL);
INSERT INTO `sys_user` VALUES (369, 201, '23405010122', '徐民城', '00', '1692812799@qq.com', '19313178169', '0', '', '$2a$10$JiX0qitQFICp.iDX74mrJ.V5kyS5IM/4eUYon92j0wK0IPnzyHjBG', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:50', 'admin', '2024-12-07 16:47:53', NULL);
INSERT INTO `sys_user` VALUES (370, 203, '23405080114', '曾嘉文', '00', '1538342331@qq.com', '13367482782', '1', '', '$2a$10$iamXjxVSjRA5GEAHqq.fJuOIE2EczuQt7rkCMIs2AaylWkdHJQ/2.', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:50', 'admin', '2024-12-07 16:48:40', NULL);
INSERT INTO `sys_user` VALUES (371, 203, '24405090303', '罗嘉月', '00', '3044570478@qq.com', '15200332533', '1', '', '$2a$10$yTQ.0no/eVBhdKCl9Ar2tO7DXpmCwSt7jckfcrIGR6nU1pJqhzCDW', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:51', 'admin', '2024-12-07 16:48:50', NULL);
INSERT INTO `sys_user` VALUES (372, 203, '23405010336', '许强', '00', '2790231925@qq.com', '15367090472', '0', '', '$2a$10$XZP1cWiiOqw5fu/IRd0a3OQMbgJms9NLmkCEORvxq95IoIOvTAJOm', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:51', 'admin', '2024-12-07 16:48:58', NULL);
INSERT INTO `sys_user` VALUES (373, 203, '24405090313', '柏佳仪', '00', '1271408196@qq.com', '15399849916', '1', '', '$2a$10$BJiy3Go196ZzSpXTUNDmWupATDa6azz6NfY0/piEodG0oeqWft1Qu', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:51', 'admin', '2024-12-07 16:49:06', NULL);
INSERT INTO `sys_user` VALUES (374, 200, '24405090135', '高佳旭', '00', '1123118707@qq.com', '13081088561', '0', '', '$2a$10$s8QMZyGvyc2ZtJoVTvHSOuIRcHDIkNOh4wNHrUXh8RU.9fSUMV8FK', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:51', 'admin', '2024-12-07 16:51:01', NULL);
INSERT INTO `sys_user` VALUES (375, 200, '24405090148', '杨家辉', '00', '1052033783@qq.com', '19198071689', '0', '', '$2a$10$IjxZZWrbgK5lsEZDgLvzTetdXBcIg/t3X49mJyCF/txYlsGrCQauK', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:51', 'admin', '2024-12-07 16:51:19', NULL);
INSERT INTO `sys_user` VALUES (376, 200, '24405010102', '李梦晗', '00', '3162667857@qq.com', '18912176089', '1', '', '$2a$10$LdDlai/2ZaFnvG93X/M3u.H8z06xzwuiQGXKqbgjYtPGLYSvl2xXC', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:51', 'admin', '2024-12-07 16:51:30', NULL);
INSERT INTO `sys_user` VALUES (377, 200, '23405010330', '徐鹏', '00', '2176302180@qq.com', '17807343064', '0', '', '$2a$10$E7PNz.qjXDwbawl8/WbI9eQY1qnC/6H2G4TQyeiciBQplx8vDSxyC', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:51', 'admin', '2024-12-07 16:52:22', NULL);
INSERT INTO `sys_user` VALUES (378, 200, '23405010347', '张佑铭', '00', '1245317602@qq.com', '19189658925', '0', '', '$2a$10$Olkl0hoGGVrTuUWw/TRA9uCdhTp8N1rBVlUepYWGNiREEJbweVjZO', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:52', 'admin', '2024-12-07 16:51:54', NULL);
INSERT INTO `sys_user` VALUES (379, 200, '22407010624', '曾鸣', '00', '3067710031@qq.com', '18397730519', '1', '', '$2a$10$IuWG6eE2kiA3qWoLSx65DO3c8itBBB6XyZy8tH4lHuUbzhs4r1mvy', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:52', 'admin', '2024-12-07 16:52:05', NULL);
INSERT INTO `sys_user` VALUES (380, 200, '24405090305', '黄棋', '00', '313418616@qq.com', '19186993176', '1', '', '$2a$10$FgcEWQeItyvVqtzDWynZuerou7DUf87/RqSTD5cUMLIpGloERcn4.', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:52', 'admin', '2024-12-07 16:52:12', NULL);
INSERT INTO `sys_user` VALUES (381, 200, '24405090320', '向宸皓', '00', '2078474483@qq.com', '19174375120', '0', '', '$2a$10$4HeYtg/ieZ2OegWW0/X2zelwd1diuaCWHRKdnj49nA3u0Eno5dGUu', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:52', 'admin', '2024-12-07 16:52:58', NULL);
INSERT INTO `sys_user` VALUES (382, 200, '22407010139', '戴林翰', '00', '3280406626@qq.com', '15576614589', '0', '', '$2a$10$svOhr/OUogCKtGDxU.V7ZebjAqje2K6GENGuUD.ctSw2jQhrRe3cq', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:52', 'admin', '2024-12-07 16:53:07', NULL);
INSERT INTO `sys_user` VALUES (383, 200, '24405090335', '戚建稳', '00', '2240021710@qq.com', '18565128476', '0', '', '$2a$10$lIq2fPOS4Iw2HdmjD25R9eUYMjn5JW4hsva80OhtFSd6MnqaXqLqS', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:52', 'admin', '2024-12-07 16:53:19', NULL);
INSERT INTO `sys_user` VALUES (384, 200, '24405090324', '龙伟豪', '00', '3504630173@qq.com', '15116594722', '0', '', '$2a$10$iCmUZjCZmiAnF7fLhFrn1OPawrsMo.zgpXmyrfawMocaA6wh1B7iW', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:52', 'admin', '2024-12-07 16:53:33', NULL);
INSERT INTO `sys_user` VALUES (385, 200, '24405090311', '向欣', '00', '2819406307@qq.com', '19310106375', '1', '', '$2a$10$ER9Sc9MKfg43HYk3f4SjIuRydmlW1HwNSESKkdzyLIMSyTwAq2oe.', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:52', 'admin', '2024-12-07 16:53:41', NULL);
INSERT INTO `sys_user` VALUES (386, 200, '23405010221', '付小荣', '00', '2078337946@qq.com', '13638444482', '1', '', '$2a$10$G72mXSEYH8K40u7QSmqy1uwGpBfg2EBV0MZTl2vXiQy3TZVb.8PDa', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:53', 'admin', '2024-12-07 16:53:50', NULL);
INSERT INTO `sys_user` VALUES (387, 200, '24405090317', '舒婉男', '00', '1490852806@qq.com', '15600773200', '1', '', '$2a$10$Sl1MvBaAcblZYcrMhTNPsOwjPuoXmEYeIaHVYfw8YF2T/T3zReAni', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:53', 'admin', '2024-12-07 16:53:59', NULL);
INSERT INTO `sys_user` VALUES (388, 200, '23405010102', '辛雅静', '00', '1956132796@qq.com', '16551771151', '1', '', '$2a$10$MlXD.VguWlPuR4pn0cPjzezIYKTESemmmLSgpQ3i58ndjaMzHhGLq', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:53', 'admin', '2024-12-07 16:54:07', NULL);
INSERT INTO `sys_user` VALUES (389, 200, '24405090344', '刘思宇', '00', '2753428883@qq.com', '17872313057', '0', '', '$2a$10$pCFN1kR.MLE74fiYXWxnre0SREHFUhEAN9KepD8JxeMw3jAIHaIIu', '0', '0', '', NULL, 'admin', '2024-12-07 15:41:53', 'admin', '2024-12-07 16:54:15', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (100, 1);
INSERT INTO `sys_user_post` VALUES (356, 2);
INSERT INTO `sys_user_post` VALUES (356, 4);
INSERT INTO `sys_user_post` VALUES (357, 2);
INSERT INTO `sys_user_post` VALUES (357, 4);
INSERT INTO `sys_user_post` VALUES (358, 4);
INSERT INTO `sys_user_post` VALUES (359, 4);
INSERT INTO `sys_user_post` VALUES (360, 4);
INSERT INTO `sys_user_post` VALUES (361, 4);
INSERT INTO `sys_user_post` VALUES (362, 4);
INSERT INTO `sys_user_post` VALUES (363, 2);
INSERT INTO `sys_user_post` VALUES (364, 4);
INSERT INTO `sys_user_post` VALUES (365, 4);
INSERT INTO `sys_user_post` VALUES (366, 4);
INSERT INTO `sys_user_post` VALUES (367, 4);
INSERT INTO `sys_user_post` VALUES (368, 2);
INSERT INTO `sys_user_post` VALUES (369, 2);
INSERT INTO `sys_user_post` VALUES (369, 4);
INSERT INTO `sys_user_post` VALUES (370, 4);
INSERT INTO `sys_user_post` VALUES (371, 4);
INSERT INTO `sys_user_post` VALUES (372, 2);
INSERT INTO `sys_user_post` VALUES (373, 4);
INSERT INTO `sys_user_post` VALUES (374, 4);
INSERT INTO `sys_user_post` VALUES (375, 4);
INSERT INTO `sys_user_post` VALUES (376, 4);
INSERT INTO `sys_user_post` VALUES (377, 2);
INSERT INTO `sys_user_post` VALUES (378, 2);
INSERT INTO `sys_user_post` VALUES (378, 4);
INSERT INTO `sys_user_post` VALUES (379, 4);
INSERT INTO `sys_user_post` VALUES (380, 4);
INSERT INTO `sys_user_post` VALUES (381, 4);
INSERT INTO `sys_user_post` VALUES (382, 4);
INSERT INTO `sys_user_post` VALUES (383, 4);
INSERT INTO `sys_user_post` VALUES (384, 4);
INSERT INTO `sys_user_post` VALUES (385, 4);
INSERT INTO `sys_user_post` VALUES (386, 2);
INSERT INTO `sys_user_post` VALUES (386, 4);
INSERT INTO `sys_user_post` VALUES (387, 4);
INSERT INTO `sys_user_post` VALUES (388, 4);
INSERT INTO `sys_user_post` VALUES (389, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (356, 101);
INSERT INTO `sys_user_role` VALUES (356, 102);
INSERT INTO `sys_user_role` VALUES (357, 101);
INSERT INTO `sys_user_role` VALUES (357, 102);
INSERT INTO `sys_user_role` VALUES (358, 102);
INSERT INTO `sys_user_role` VALUES (359, 102);
INSERT INTO `sys_user_role` VALUES (360, 102);
INSERT INTO `sys_user_role` VALUES (361, 102);
INSERT INTO `sys_user_role` VALUES (362, 102);
INSERT INTO `sys_user_role` VALUES (363, 101);
INSERT INTO `sys_user_role` VALUES (363, 102);
INSERT INTO `sys_user_role` VALUES (364, 102);
INSERT INTO `sys_user_role` VALUES (365, 102);
INSERT INTO `sys_user_role` VALUES (366, 102);
INSERT INTO `sys_user_role` VALUES (367, 102);
INSERT INTO `sys_user_role` VALUES (368, 101);
INSERT INTO `sys_user_role` VALUES (369, 101);
INSERT INTO `sys_user_role` VALUES (369, 102);
INSERT INTO `sys_user_role` VALUES (370, 102);
INSERT INTO `sys_user_role` VALUES (371, 102);
INSERT INTO `sys_user_role` VALUES (372, 101);
INSERT INTO `sys_user_role` VALUES (373, 102);
INSERT INTO `sys_user_role` VALUES (374, 102);
INSERT INTO `sys_user_role` VALUES (375, 102);
INSERT INTO `sys_user_role` VALUES (376, 102);
INSERT INTO `sys_user_role` VALUES (377, 101);
INSERT INTO `sys_user_role` VALUES (378, 101);
INSERT INTO `sys_user_role` VALUES (378, 102);
INSERT INTO `sys_user_role` VALUES (379, 102);
INSERT INTO `sys_user_role` VALUES (380, 102);
INSERT INTO `sys_user_role` VALUES (381, 102);
INSERT INTO `sys_user_role` VALUES (382, 102);
INSERT INTO `sys_user_role` VALUES (383, 102);
INSERT INTO `sys_user_role` VALUES (384, 102);
INSERT INTO `sys_user_role` VALUES (385, 102);
INSERT INTO `sys_user_role` VALUES (386, 101);
INSERT INTO `sys_user_role` VALUES (386, 102);
INSERT INTO `sys_user_role` VALUES (387, 102);
INSERT INTO `sys_user_role` VALUES (388, 102);
INSERT INTO `sys_user_role` VALUES (389, 102);

-- ----------------------------
-- Table structure for t_proofs
-- ----------------------------
DROP TABLE IF EXISTS `t_proofs`;
CREATE TABLE `t_proofs`  (
  `material_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '证明材料的id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '提交材料的用户id,作为外键获取用户信息',
  `material_content` longblob NULL COMMENT '材料的内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '材料创建的时间',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '材料当前的状态（0为提交状态，1为加分完成状态）',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '积分认定的负责人id',
  `points` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当前材料可加的分',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '积分认定的时间',
  PRIMARY KEY (`material_id`) USING BTREE,
  INDEX `user_id_wj`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_points
-- ----------------------------
DROP TABLE IF EXISTS `t_user_points`;
CREATE TABLE `t_user_points`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(20) NOT NULL COMMENT '用户的方向',
  `points` int(11) NULL DEFAULT 100 COMMENT '用户积分',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dept`(`dept_id`) USING BTREE,
  INDEX `userid`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户积分表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_points
-- ----------------------------
INSERT INTO `t_user_points` VALUES (117, 356, 205, 100, '2024-12-07 15:41:48');
INSERT INTO `t_user_points` VALUES (118, 357, 205, 100, '2024-12-07 15:41:49');
INSERT INTO `t_user_points` VALUES (119, 358, 204, 100, '2024-12-07 15:41:49');
INSERT INTO `t_user_points` VALUES (120, 359, 204, 100, '2024-12-07 15:41:49');
INSERT INTO `t_user_points` VALUES (121, 360, 204, 100, '2024-12-07 15:41:49');
INSERT INTO `t_user_points` VALUES (122, 361, 204, 100, '2024-12-07 15:41:49');
INSERT INTO `t_user_points` VALUES (123, 362, 204, 100, '2024-12-07 15:41:49');
INSERT INTO `t_user_points` VALUES (124, 363, 204, 100, '2024-12-07 15:41:49');
INSERT INTO `t_user_points` VALUES (125, 364, 201, 100, '2024-12-07 15:41:50');
INSERT INTO `t_user_points` VALUES (126, 365, 201, 100, '2024-12-07 15:41:50');
INSERT INTO `t_user_points` VALUES (127, 366, 201, 100, '2024-12-07 15:41:50');
INSERT INTO `t_user_points` VALUES (128, 367, 201, 100, '2024-12-07 15:41:50');
INSERT INTO `t_user_points` VALUES (129, 368, 201, 100, '2024-12-07 15:41:50');
INSERT INTO `t_user_points` VALUES (130, 369, 201, 100, '2024-12-07 15:41:50');
INSERT INTO `t_user_points` VALUES (131, 370, 203, 100, '2024-12-07 15:41:50');
INSERT INTO `t_user_points` VALUES (132, 371, 203, 100, '2024-12-07 15:41:51');
INSERT INTO `t_user_points` VALUES (133, 372, 203, 100, '2024-12-07 15:41:51');
INSERT INTO `t_user_points` VALUES (134, 373, 203, 100, '2024-12-07 15:41:51');
INSERT INTO `t_user_points` VALUES (135, 374, 200, 100, '2024-12-07 15:41:51');
INSERT INTO `t_user_points` VALUES (136, 375, 200, 100, '2024-12-07 15:41:51');
INSERT INTO `t_user_points` VALUES (137, 376, 200, 100, '2024-12-07 15:41:51');
INSERT INTO `t_user_points` VALUES (138, 377, 200, 100, '2024-12-07 15:41:51');
INSERT INTO `t_user_points` VALUES (139, 378, 200, 100, '2024-12-07 15:41:52');
INSERT INTO `t_user_points` VALUES (140, 379, 200, 100, '2024-12-07 15:41:52');
INSERT INTO `t_user_points` VALUES (141, 380, 200, 100, '2024-12-07 15:41:52');
INSERT INTO `t_user_points` VALUES (142, 381, 200, 100, '2024-12-07 15:41:52');
INSERT INTO `t_user_points` VALUES (143, 382, 200, 100, '2024-12-07 15:41:52');
INSERT INTO `t_user_points` VALUES (144, 383, 200, 100, '2024-12-07 15:41:52');
INSERT INTO `t_user_points` VALUES (145, 384, 200, 100, '2024-12-07 15:41:52');
INSERT INTO `t_user_points` VALUES (146, 385, 200, 100, '2024-12-07 15:41:52');
INSERT INTO `t_user_points` VALUES (147, 386, 200, 100, '2024-12-07 15:41:53');
INSERT INTO `t_user_points` VALUES (148, 387, 200, 100, '2024-12-07 15:41:53');
INSERT INTO `t_user_points` VALUES (149, 388, 200, 100, '2024-12-07 15:41:53');
INSERT INTO `t_user_points` VALUES (150, 389, 200, 100, '2024-12-07 15:41:53');

SET FOREIGN_KEY_CHECKS = 1;
