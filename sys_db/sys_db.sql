/*
 Navicat Premium Data Transfer

 Source Server         : 203.154.37.55
 Source Server Type    : MariaDB
 Source Server Version : 100507
 Source Host           : 10.50.240.192:3306
 Source Schema         : sys_db

 Target Server Type    : MariaDB
 Target Server Version : 100507
 File Encoding         : 65001

 Date: 16/02/2021 11:42:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_cancel_reason
-- ----------------------------
DROP TABLE IF EXISTS `tb_cancel_reason`;
CREATE TABLE `tb_cancel_reason`  (
  `cancel_reason_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสการยกเลิกรายการ',
  `cancel_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'การยกเลิกรายการ',
  PRIMARY KEY (`cancel_reason_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_cancel_reason
-- ----------------------------
INSERT INTO `tb_cancel_reason` VALUES (1, 'ข้อมูลการส่งผิดพลาด');
INSERT INTO `tb_cancel_reason` VALUES (2, 'รถชำรุดระหว่างเดินทาง');

-- ----------------------------
-- Table structure for tb_change_reason
-- ----------------------------
DROP TABLE IF EXISTS `tb_change_reason`;
CREATE TABLE `tb_change_reason`  (
  `change_reason_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสการเปลี่ยนแปลง',
  `change_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'การเปลี่ยนแปลง',
  PRIMARY KEY (`change_reason_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_change_reason
-- ----------------------------
INSERT INTO `tb_change_reason` VALUES (1, 'ข้อมูลการส่งผิดพลาด');
INSERT INTO `tb_change_reason` VALUES (2, 'รถชำรุดระหว่างเดินทาง');

-- ----------------------------
-- Table structure for tb_company
-- ----------------------------
DROP TABLE IF EXISTS `tb_company`;
CREATE TABLE `tb_company`  (
  `com_id` int(1) NOT NULL AUTO_INCREMENT,
  `com_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ชื่อบริษัท',
  `com_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ที่อยู่',
  `zip_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รหัสไปรษณีย์',
  `prov_id` int(11) NULL DEFAULT NULL COMMENT 'จังหวัด',
  `com_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เบอร์โทรศัพท์',
  `com_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'อีเมล',
  `sys1_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ชื่อโรงงาน sys1',
  `sys1_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เบอร์โทรศัพท์',
  `sys1_callcentre` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เบอร์โทรศัพท์ รปภ.sys1',
  `sys1_lon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'longitude',
  `sys1_lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'latitude',
  `sys2_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ชื่อโรงงาน sys2',
  `sys2_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เบอร์โทรศัพท์ sys2',
  `sys2_callcentre` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เบอร์โทรศัพท์ รปภ.sys2',
  `sys2_lon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'longitude',
  `sys2_lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'latitude',
  `created_at` datetime NULL DEFAULT NULL COMMENT 'สร้างเมื่อ',
  `created_by` int(11) NULL DEFAULT NULL COMMENT 'สร้างโดย',
  `updated_at` datetime NULL DEFAULT NULL COMMENT 'ปรับปรุงเมื่อ',
  `updated_by` int(11) NULL DEFAULT NULL COMMENT 'ปรับปรุงโดย',
  `sys1_on` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SYS 1 เปิดใช้งาน T/F',
  `sys2_on` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SYS 2 เปิดใช้งาน T/F',
  PRIMARY KEY (`com_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_company
-- ----------------------------
INSERT INTO `tb_company` VALUES (1, 'บริษัท เหล็กสยามยามาโตะ จำกัด', '1 ซอย ปูนซีเมนต์ไทย แขวง บางซื่อ เขตบางซื่อ กรุงเทพมหานคร ', '10800', NULL, '02 586 7777', 'email ทดสอบ', 'บริษัท เหล็กสยามยามาโตะ จำกัด 1', '+6638698500', '+6638698500', '12.707983466828827', '101.11220518880515', 'บริษัท เหล็กสยามยามาโตะ จำกัด 2', '+6638683723', '+6638683723', '12.676499725810988', '101.14705244824391', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_driver
-- ----------------------------
DROP TABLE IF EXISTS `tb_driver`;
CREATE TABLE `tb_driver`  (
  `driver_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'autoid',
  `driver_title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ชื่อต้น',
  `driver_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ชื่อ',
  `driver_surname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'นามสกุล',
  `user_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสการใช้งานระบบ',
  `driver_cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เลขที่บัตรประชาชน',
  `driver_license` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เลขที่ใบอนุญาติขับรถยนต์',
  `driver_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เบอร์โทรติดต่อ',
  `driver_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'email',
  `blacklist_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Y=black list  N=Active',
  `owner_type_id` int(11) NULL DEFAULT NULL COMMENT 'ประเภทพนักงานรถ 1=พนักงานร้านค้า 2 = พนักงานรับจ้าง',
  `ret_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสร้านค้า',
  `driver_pic_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_pic_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `confirm_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ยืนยัน Y or N',
  `AutoID` int(11) NULL DEFAULT NULL COMMENT 'id_refferent',
  `driver_status_id` int(11) NOT NULL COMMENT 'สถานะ 1 active 2 deactive',
  `created_by` int(11) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL COMMENT 'สร้างข้อมูล',
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'ปรับปรุงข้อมูล',
  `driver_cid_pic_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_cid_pic_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_license_pic_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_license_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`driver_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `blacklist_status`(`blacklist_status`) USING BTREE,
  INDEX `owner_type_id`(`owner_type_id`) USING BTREE,
  INDEX `ret_id`(`ret_id`) USING BTREE,
  INDEX `driver_status_id`(`driver_status_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_driver
-- ----------------------------
INSERT INTO `tb_driver` VALUES (7, 'นาย', 'ธนวัต', 'โอลาพฤกษ์', NULL, '1234567890123', '6015107001052', '0812345678', NULL, NULL, 1, NULL, NULL, NULL, 'N', NULL, 1, NULL, '2021-01-27 22:41:29', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_driver` VALUES (8, 'นาย', 'กิตติพงศ์', 'ศิริรักษ์', NULL, '1234567890123', '6015107001037', '0812345678', NULL, NULL, 1, NULL, NULL, NULL, 'N', NULL, 1, NULL, '2021-01-27 22:41:35', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_driver` VALUES (9, 'นาย', 'โพสิฐ์', 'รัตนดิลก ณ ภูเก็ต', NULL, '1234567890123', '6015107001035', '0812345678', NULL, NULL, 1, NULL, NULL, NULL, 'N', NULL, 1, NULL, '2021-01-27 22:41:38', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_driver` VALUES (10, 'นาย', 'ตะวัน', 'ศรีนวล', NULL, '1234567890123', '6015107001033', '0812345678', NULL, NULL, 2, NULL, NULL, NULL, 'N', NULL, 1, NULL, '2021-01-27 22:41:41', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_driver` VALUES (11, 'นาย', 'ภูวเดช', 'เศวตศิลป์', NULL, '1234567890123', '6015107001043', '0812345678', NULL, NULL, 2, NULL, NULL, NULL, 'N', NULL, 1, NULL, '2021-01-27 22:41:43', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_grade
-- ----------------------------
DROP TABLE IF EXISTS `tb_grade`;
CREATE TABLE `tb_grade`  (
  `com_grade_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'รหัสเกรด',
  `com_grade_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ชื่อเกรด',
  PRIMARY KEY (`com_grade_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_grade
-- ----------------------------

-- ----------------------------
-- Table structure for tb_holiday
-- ----------------------------
DROP TABLE IF EXISTS `tb_holiday`;
CREATE TABLE `tb_holiday`  (
  `holiday_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'วันหยุด',
  `holiday_date` date NOT NULL COMMENT 'วันที่',
  `holiday_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ชื่อวันหยุด',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`holiday_id`) USING BTREE,
  INDEX `holiday_date`(`holiday_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_holiday
-- ----------------------------

-- ----------------------------
-- Table structure for tb_pdpa
-- ----------------------------
DROP TABLE IF EXISTS `tb_pdpa`;
CREATE TABLE `tb_pdpa`  (
  `pdpa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัส pdpa',
  `pdpa_date` date NOT NULL COMMENT 'วันที่',
  `pdpa_type_id` int(11) NULL DEFAULT NULL COMMENT '1=ร้านค้าย่อย/2=พนักงานขับรถยนต์',
  `pdpa_version` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เวอร์ชั่น',
  `pdpa_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รายละเอียด pdpa',
  `pdpa_status_id` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'สถานะ T/F',
  `created_by` int(11) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pdpa_id`) USING BTREE,
  INDEX `pdpa_date`(`pdpa_date`) USING BTREE,
  INDEX `pdpa_type_id`(`pdpa_type_id`) USING BTREE,
  INDEX `pdpa_status_id`(`pdpa_status_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_pdpa
-- ----------------------------
INSERT INTO `tb_pdpa` VALUES (1, '2021-01-27', 1, NULL, 'ข้อความทดสอบ PDPA ร้านค้าย่อย', '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_pdpa` VALUES (2, '2021-01-27', 2, NULL, 'ข้อความทดสอบ PDPA พนักงานขับรถยนต์', '1', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_pdpa_concent
-- ----------------------------
DROP TABLE IF EXISTS `tb_pdpa_concent`;
CREATE TABLE `tb_pdpa_concent`  (
  `pdpa_concent_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'autoid',
  `user_id` int(11) NOT NULL COMMENT 'รหัสผู้ใช้งาน',
  `pdpa_id` int(11) NOT NULL COMMENT 'รหัส pdpa',
  `created_at` datetime NOT NULL COMMENT 'เวลาสร้างข้อมูล',
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`pdpa_concent_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `pdpa_id`(`pdpa_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_pdpa_concent
-- ----------------------------

-- ----------------------------
-- Table structure for tb_pl
-- ----------------------------
DROP TABLE IF EXISTS `tb_pl`;
CREATE TABLE `tb_pl`  (
  `pl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'autoid',
  `doc_num` int(11) NOT NULL COMMENT 'เลขที่เอกสาร',
  `doc_date` date NOT NULL COMMENT 'วันที่เอกสาร',
  `ret_id` int(11) NOT NULL COMMENT 'รหัสร้านค้า',
  `trd_id` int(11) NOT NULL COMMENT 'รหัสผู้ขายเศษเหล็ก',
  `truck_type_id` int(11) NOT NULL COMMENT 'ประเภทรถยนต์',
  `wh_number` int(11) NOT NULL COMMENT 'โกดัง defualt = 1',
  `doc_type_id` int(11) NOT NULL COMMENT 'ประเภทการส่ง 1=ส่งปกติ/2=walk in',
  `ship_date` date NOT NULL COMMENT 'วันที่ส่ง',
  `ship_time_begin` time NULL DEFAULT NULL COMMENT 'เวลาส่งเริ่ม',
  `ship_time_end` time NULL DEFAULT NULL COMMENT 'เวลาส่งถึง',
  `plant_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'รหัสโรงงาน',
  `owner_type_id` int(11) NULL DEFAULT NULL COMMENT 'ประเภทพนักงานรถ 1=พนักงานร้านค้า 2 = พนักงานรับจ้าง',
  `driver_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสพนักงานขับรถยนต์',
  `shipment_status_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสสถานะการส่ง',
  `start_time` datetime NULL DEFAULT NULL COMMENT 'เวลาเริ่มเดินทาง',
  `confirm_time` datetime NULL DEFAULT NULL COMMENT 'เวลายืนยัน',
  `checkin_time` datetime NULL DEFAULT NULL COMMENT 'เวลาเช็คอิน',
  `doc_status` int(11) NULL DEFAULT NULL COMMENT 'สถานะเอกสาร 1=Active/2=Delete',
  `cancel_reason_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสการยกเลิกรายการ',
  `change_reason_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสการเปลี่ยนแปลง',
  `pl_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'บันทึก',
  `pl_lon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'longitude',
  `pl_lat` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'latitude',
  `update_accept` int(11) NULL DEFAULT NULL COMMENT 'ต้องการยินยันการเปลี่ยนแปลง 1 = yes /2 = no',
  `update_accept_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่การยืนยันการเปลี่ยนแปลง',
  `calling_time` datetime NULL DEFAULT NULL COMMENT 'เวลาเรียกคิว',
  `created_by` int(11) NULL DEFAULT NULL COMMENT 'ผู้สร้างข้อมูล',
  `created_at` datetime NULL DEFAULT NULL COMMENT 'สร้างข้อมูล',
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL COMMENT 'ปรับปรุงข้อมูล',
  PRIMARY KEY (`pl_id`) USING BTREE,
  INDEX `doc_date`(`doc_date`) USING BTREE,
  INDEX `ret_id`(`ret_id`) USING BTREE,
  INDEX `trd_id`(`trd_id`) USING BTREE,
  INDEX `truck_type_id`(`truck_type_id`) USING BTREE,
  INDEX `doc_type_id`(`doc_type_id`) USING BTREE,
  INDEX `owner_type_id`(`owner_type_id`) USING BTREE,
  INDEX `driver_id`(`driver_id`) USING BTREE,
  INDEX `shipment_status_id`(`shipment_status_id`) USING BTREE,
  INDEX `cancel_reason_id`(`cancel_reason_id`) USING BTREE,
  INDEX `change_reason_id`(`change_reason_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_pl
-- ----------------------------

-- ----------------------------
-- Table structure for tb_pl_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_pl_detail`;
CREATE TABLE `tb_pl_detail`  (
  `pl_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'autoid',
  `pl_id` int(11) NULL DEFAULT NULL COMMENT 'เลขที่อ้างอิงค์',
  `pl_seq` int(2) NULL DEFAULT NULL COMMENT 'ลำดับ',
  `pl_bulk` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'เศษเหล็กเหมากอง T / F',
  `contract_yr` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ปีสัญญาซือขาย',
  `contract_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เลขที่สัญญาซื้อขาย',
  `com_grade_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รหัสเกรด',
  `owner_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ประเภทรถ 1=รถร้านค้า 2 = รถรับจ้าง',
  `truck_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสรถยนต์',
  `truckwgt` decimal(10, 2) NULL DEFAULT NULL COMMENT 'น้ำหนักชั่งเบา',
  `tot_truckwgt` decimal(10, 2) NULL DEFAULT NULL COMMENT 'น้ำหนักชั่งหนัก',
  `tot_actwgt` decimal(10, 2) NULL DEFAULT NULL COMMENT 'น้ำหนักสุทธิ',
  `pl_contact` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ส่งตามสัญญา T / F',
  PRIMARY KEY (`pl_detail_id`) USING BTREE,
  INDEX `pl_id`(`pl_id`) USING BTREE,
  CONSTRAINT `tb_pl_detail_ibfk_1` FOREIGN KEY (`pl_id`) REFERENCES `tb_pl` (`pl_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_pl_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tb_province
-- ----------------------------
DROP TABLE IF EXISTS `tb_province`;
CREATE TABLE `tb_province`  (
  `prov_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'autoid',
  `prov_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'รหัสจังหวัด',
  `prov_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ชื่อจังหวัด',
  `zone_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รหัสโซน',
  PRIMARY KEY (`prov_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_province
-- ----------------------------
INSERT INTO `tb_province` VALUES (1000, '1000', 'จังหวัดทดสอบ', NULL);

-- ----------------------------
-- Table structure for tb_ret
-- ----------------------------
DROP TABLE IF EXISTS `tb_ret`;
CREATE TABLE `tb_ret`  (
  `ret_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'autoid',
  `ret_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'รหัสร้านค้าย่อย',
  `ret_title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ชื่อต้น',
  `ret_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ชื่อร้านค้าย่อย',
  `ret_adr1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ที่อยู่1',
  `ret_adr2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ที่อยู่2',
  `zip_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รหัสไปรษณีย์',
  `prov_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสจังหวัด',
  `con_p` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ชื่อผู้ติดต่อ',
  `con_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เบอร์โทรศัพท์',
  `fax1` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'fax1',
  `ret_email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'email',
  `ret_lon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'longitude',
  `ret_lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'latitude',
  `ret_profile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ret_status_id` int(1) NULL DEFAULT NULL COMMENT 'สถานะ 1 active 2 deactive',
  `ret_confirm` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ยืนยัน T or F',
  `user_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสการใช้งานระบบ',
  `created_by` int(11) NOT NULL COMMENT 'สร้างโดย',
  `created_at` datetime NOT NULL COMMENT 'สร้างเมื่อ',
  `updated_by` int(11) NULL DEFAULT NULL COMMENT 'ปรับปรุงข้อมูลโดย',
  `updated_at` datetime NULL DEFAULT NULL COMMENT 'ปรับปรุงข้อมูลเมื่อ',
  PRIMARY KEY (`ret_id`) USING BTREE,
  INDEX `ret_code`(`ret_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_ret
-- ----------------------------
INSERT INTO `tb_ret` VALUES (1, 'ret001', 'ร้าน', 'ยิ่งเจริญ ทดสอบ', '22 ซ.จินตนา', 'ต.ทดสอบ อ.ทดสอบ', '10000', 1000, NULL, NULL, NULL, NULL, '16.440802775622874', '102.76661316261094', NULL, 1, NULL, NULL, 0, '2021-01-27 21:46:48', NULL, NULL);
INSERT INTO `tb_ret` VALUES (2, 'ret002', 'ร้าน', 'ไทนเจริญ ทดสอบ', '34 ซ.ประชาชาติไทย', 'ต.ทดสอบ อ.ทดสอบ', '10000', 1000, NULL, NULL, NULL, NULL, '13.550164258367152', '100.6233965791814', NULL, 1, NULL, NULL, 0, '2021-01-27 21:46:52', NULL, NULL);
INSERT INTO `tb_ret` VALUES (3, 'ret003', 'ร้าน', 'ประชา ทดสอบ', '435 ซ.วิภาวดีรังสิต', 'ต.ทดสอบ อ.ทดสอบ', '10000', 1000, NULL, NULL, NULL, NULL, '13.77818358499521', '100.51061505323926', NULL, 1, NULL, NULL, 0, '2021-01-27 21:46:56', NULL, NULL);
INSERT INTO `tb_ret` VALUES (8, 'ret004', 'ร้าน', 'สมบัติทอง', '656 ซ.ทดสอบ', 'ต.ทดสอบ อ.ทดสอบ', '10000', 1000, NULL, NULL, NULL, NULL, '12.761206111723784', '101.4192434372178', NULL, 1, NULL, NULL, 0, '2021-01-27 21:46:59', NULL, NULL);

-- ----------------------------
-- Table structure for tb_schedule
-- ----------------------------
DROP TABLE IF EXISTS `tb_schedule`;
CREATE TABLE `tb_schedule`  (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสตารางงาน',
  `plant_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'รหัสโรงงาน sys1 or sys2',
  `schedule_date` date NULL DEFAULT NULL COMMENT 'วันที่',
  `begin_time` time NULL DEFAULT NULL COMMENT 'เวลาเริ่มงาน',
  `end_time` time NULL DEFAULT NULL COMMENT 'เวลาสิ้นสุดงาน',
  `loader_number` int(2) NULL DEFAULT NULL COMMENT 'จำนวนช่องลงเศษเหล็ก',
  `created_by` int(11) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for tb_schedule_wk
-- ----------------------------
DROP TABLE IF EXISTS `tb_schedule_wk`;
CREATE TABLE `tb_schedule_wk`  (
  `schedule_wk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสตารางงานรายสัปดาห์',
  `day_wk` int(2) NULL DEFAULT NULL COMMENT 'วันสัปดาห์',
  `plant_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รหัสโรงงาน',
  `begin_time` time NULL DEFAULT NULL COMMENT 'เวลาเริ่มงาน',
  `end_time` time NULL DEFAULT NULL COMMENT 'เวลาสิ้นสุดงาน',
  `loader_number` int(4) NULL DEFAULT NULL COMMENT 'จำนวนช่องลงเศษเหล็ก',
  `schedule_status_id` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'สถานะ T/F',
  `created_by` int(11) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`schedule_wk_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_schedule_wk
-- ----------------------------

-- ----------------------------
-- Table structure for tb_setting
-- ----------------------------
DROP TABLE IF EXISTS `tb_setting`;
CREATE TABLE `tb_setting`  (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'autoid',
  `ret_location_check_km` int(4) NULL DEFAULT NULL COMMENT 'ระยะตรวจสอบการทำรายการร้านค้าย่อย',
  `upload_location` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'เปิดการ upload location T/F',
  `upload_location_min` int(4) NULL DEFAULT NULL COMMENT 'ความถี่ในการส่ง Location data',
  `shipment_confirm` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'เปิดการแจ้งเตือนยืนยันการจัดส่ง T/F',
  `shipment_confirm_km` int(4) NULL DEFAULT NULL COMMENT 'ระยะทางการยืนยันการจัดส่ง km.',
  `bulk_location_check` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ตรวจสอบ Locataion เศษเหล็กเหมากอง T/F',
  `driver_blacklist_allow` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'อนุญาตพนักงานรถยนต์ Black list ลงทะเบียนใช้งานได้ T/F',
  `car_blacklist_allow` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'อนุญาตรถยนต์ Black list สามารถใช้งานได้ T/F',
  `truck_approve_req` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Approve เอกสารรถยนต์ ก่อนใช้งานระบบ T/F',
  `driver_approve_req` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Approve เอกสารพนักงานขับรถยนต์ ก่อนใช้งานระบบ  T/F',
  `advance_day` int(2) NULL DEFAULT NULL COMMENT 'จองคิวล่วงหน้า(วัน)',
  `advance_time` time NULL DEFAULT NULL COMMENT 'เวลาปิดก่อนวันเดินทาง',
  `map_api_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Map API Key',
  `map_api_key_update` date NULL DEFAULT NULL COMMENT 'Map API Key วันที่ปรับปรุง',
  `created_by` int(11) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_setting
-- ----------------------------
INSERT INTO `tb_setting` VALUES (7, 1, '1', 5, '1', 20, '1', '1', '1', '2', '2', 1, '18:00:00', '51650f67a46bcffe96da4edba78d4f28', '2021-02-12', NULL, NULL, NULL, '2021-02-12 11:11:31');

-- ----------------------------
-- Table structure for tb_shipment_status
-- ----------------------------
DROP TABLE IF EXISTS `tb_shipment_status`;
CREATE TABLE `tb_shipment_status`  (
  `shipment_status_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสถานะการส่ง',
  `shipment_status_des` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'สถานะการส่ง',
  `shipment_status_color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`shipment_status_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_shipment_status
-- ----------------------------
INSERT INTO `tb_shipment_status` VALUES (1, 'รอการจัดส่ง', NULL);
INSERT INTO `tb_shipment_status` VALUES (2, 'กำลังจัดส่ง', NULL);
INSERT INTO `tb_shipment_status` VALUES (3, 'หยุดชั่วคราว', NULL);
INSERT INTO `tb_shipment_status` VALUES (4, 'ยืนยันแล้ว', NULL);
INSERT INTO `tb_shipment_status` VALUES (5, 'เช็คอินแล้ว', NULL);
INSERT INTO `tb_shipment_status` VALUES (6, 'กำลังเรียกคิว', NULL);

-- ----------------------------
-- Table structure for tb_trd
-- ----------------------------
DROP TABLE IF EXISTS `tb_trd`;
CREATE TABLE `tb_trd`  (
  `trd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'autoid',
  `trd_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'รหัสผู้ขายเศษเหล็ก',
  `trd_title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ชื่อต้น',
  `trd_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ชื่อผู้ขายเศษเหล็ก',
  `trd_adr1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ที่อยู่1',
  `trd_adr2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ที่อยู่2',
  `trdsap_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prov_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสจังหวัด',
  `zip_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รหัสไปรษณีย์',
  `cn_p1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เบอร์โทรผู้ติดต่อ1',
  `cn_p1_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ชื่อผู้ติดต่อ2',
  `cn_p2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เบอร์โทรผู้ติดต่อ2',
  `cn_p2_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ชื่อผู้ติดต่อ3',
  `cn_p3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เบอร์โทรผู้ติดต่อ3',
  `cn_p3_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เบอร์โทรผู้ติดต่อ3',
  `fax1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'fax1',
  `fax2` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'fax2',
  `trd_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'email',
  `trd_profile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trd_status_id` int(11) NULL DEFAULT NULL COMMENT 'สถานะ 1 active 2 deactive',
  `user_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสการใช้งานระบบ',
  `created_by` int(11) NULL DEFAULT NULL COMMENT 'ผู้สร้างรายการ',
  `created_at` datetime NULL DEFAULT NULL COMMENT 'สร้างข้อมูล',
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'ปรับปรุงข้อมูล',
  PRIMARY KEY (`trd_id`) USING BTREE,
  INDEX `trd_code`(`trd_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_trd
-- ----------------------------
INSERT INTO `tb_trd` VALUES (1, 'trd001', 'บจก.', 'พิรุณสร้าง', '21/12 ซ.xxxx ', 'ต.xxxx อ.xxxxx', NULL, 1000, '100000', 'บรรจง สมคิด', '081 3300022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, '2021-01-27 21:32:48', NULL, NULL);
INSERT INTO `tb_trd` VALUES (2, 'trd002', 'หจก.', 'กิจการนำรุ่ง', '212 ซ.xxxx', 'ต.xxxx อ.xxxxx', NULL, 1000, '100000', 'สมทรง พญาไท', '081 2000222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, '2021-01-27 21:32:48', NULL, NULL);
INSERT INTO `tb_trd` VALUES (3, 'trd003', 'บจก.', 'บางกอกพัฒนา', '55/23 ซ.xxxx ', 'ต.xxxx อ.xxxxx', NULL, 1000, '100000', 'สมหมาย ทันใจดี', '092 2233333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, '2021-01-27 21:32:48', NULL, NULL);

-- ----------------------------
-- Table structure for tb_trd_confirm
-- ----------------------------
DROP TABLE IF EXISTS `tb_trd_confirm`;
CREATE TABLE `tb_trd_confirm`  (
  `trd_confirm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'autoid',
  `trd_id` int(11) NOT NULL COMMENT 'รหัสผู้ขายเศษเหล็ก',
  `ret_id` int(11) NOT NULL COMMENT 'รหัสร้านค้า',
  `confirm_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ยืนยัน Y or N',
  `created_at` datetime NULL DEFAULT NULL COMMENT 'สร้างข้อมูล',
  `updated_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'ปรับปรุงข้อมูล',
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`trd_confirm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_trd_confirm
-- ----------------------------
INSERT INTO `tb_trd_confirm` VALUES (11, 1, 1, 'Y', '2021-02-05 13:03:44', NULL, NULL, NULL);
INSERT INTO `tb_trd_confirm` VALUES (12, 2, 2, 'Y', '2021-02-05 13:03:44', NULL, NULL, NULL);
INSERT INTO `tb_trd_confirm` VALUES (13, 1, 3, 'N', '2021-02-05 13:03:44', NULL, NULL, NULL);
INSERT INTO `tb_trd_confirm` VALUES (14, 2, 8, 'N', '2021-02-05 13:03:44', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_truck
-- ----------------------------
DROP TABLE IF EXISTS `tb_truck`;
CREATE TABLE `tb_truck`  (
  `truck_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'autoid',
  `truck_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ทะเบียนรถยนต์',
  `truck_prov_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'รหัสจังหวัด',
  `head_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Y=ทะเบียนหัว  N=ทะเบียนหาง',
  `truck_type_id` int(11) NULL DEFAULT NULL COMMENT 'ประเภทรถยนต์',
  `blacklist_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Y=black list  N=Active',
  `owner_type` int(11) NULL DEFAULT NULL COMMENT 'ประเภทรถ 1=รถร้านค้า 2 = รถรับจ้าง',
  `ret_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสร้านค้าย่อย',
  `chassis_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'หมายเลขตัวถัง',
  `truck_pic1_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ภาพด้านหน้า',
  `truck_pic1_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `truck_pic2_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ภาพด้านข้าง',
  `truck_pic2_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `truck_pic3_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ภาพด้านขวา',
  `truck_pic3_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `truck_pic4_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ภาพด้านซ้าย',
  `truck_pic4_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `book_pic_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ภาพคู่มือทะเบียนรถ',
  `book_pic_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `confirm_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ยืนยัน Y or N',
  `truck_confirm` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ยืนยัน T or F',
  `truck_status_id` int(11) NOT NULL COMMENT 'สถานะ 1 active 2 deactive',
  `created_at` datetime NULL DEFAULT NULL COMMENT 'สร้างข้อมูล',
  `updated_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'ปรับปรุงข้อมูล',
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`truck_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_truck
-- ----------------------------
INSERT INTO `tb_truck` VALUES (1, '10-2233', '1000', 'Y', 1, '', 1, 1, 'chassis_1000', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', '1', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_truck` VALUES (2, '63-0000', '1000', 'Y', 2, '', 1, 1, 'chassis_1001', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', '1', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_truck` VALUES (11, '56-5540', '1000', 'N', 2, '', 1, 1, 'chassis_1002', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_truck_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_truck_type`;
CREATE TABLE `tb_truck_type`  (
  `truck_type_id` int(2) NOT NULL AUTO_INCREMENT COMMENT 'autoid',
  `truck_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ประเภทรถยนต์',
  `truck_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ชื่อประเภทรถยนต์',
  `trailer` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'มีพ่วงท้าย T=มีพ่วงท้าย F=ไม่มีพ่วงท้าย',
  `stdtime_loding` int(11) NULL DEFAULT NULL COMMENT 'เวลา loading (นาที)',
  `base_low_wgt` int(11) NULL DEFAULT NULL,
  `max_diff_wgt` int(11) NULL DEFAULT NULL,
  `tolerance` int(11) NULL DEFAULT NULL,
  `tol_trans` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`truck_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_truck_type
-- ----------------------------
INSERT INTO `tb_truck_type` VALUES (1, '1', 'ประเภทรถทดสอบ', 'F', 30, NULL, NULL, NULL, NULL);
INSERT INTO `tb_truck_type` VALUES (2, '2', 'ประเภทรถทดสอบ + พ่วง', 'T', 45, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_trucktracking
-- ----------------------------
DROP TABLE IF EXISTS `tb_trucktracking`;
CREATE TABLE `tb_trucktracking`  (
  `truck_tracking_id` int(11) NOT NULL,
  `pl_id` int(11) NULL DEFAULT NULL COMMENT 'เลขที่ใบนำส่งเศษเหล็ก',
  `plant_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `truck_lon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ลองจิจูด',
  `truck_lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distance` decimal(4, 2) NULL DEFAULT NULL COMMENT 'ระยะทาง',
  `interval` int(4) NULL DEFAULT NULL COMMENT 'เวลาเดินทาง',
  `created_by` int(11) NULL DEFAULT NULL,
  `created_at` date NULL DEFAULT NULL COMMENT 'สร้างข้อมูลเมื่อ',
  PRIMARY KEY (`truck_tracking_id`) USING BTREE,
  INDEX `pl_id`(`pl_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_trucktracking
-- ----------------------------

-- ----------------------------
-- Table structure for tb_vFindPriAnnFix_with_Freight
-- ----------------------------
DROP TABLE IF EXISTS `tb_vFindPriAnnFix_with_Freight`;
CREATE TABLE `tb_vFindPriAnnFix_with_Freight`  (
  `pyear` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `period_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trd_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ret_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wh_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `com_grade_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `freight_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `loyalty_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `wh_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `addition_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `spcadj_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `create_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `change_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `change_date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trd_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trd_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ret_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wh_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `com_grade_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `effdate_from` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `effdate_to` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_vFindPriAnnFix_with_Freight
-- ----------------------------

-- ----------------------------
-- Table structure for tb_vRptContractPrice
-- ----------------------------
DROP TABLE IF EXISTS `tb_vRptContractPrice`;
CREATE TABLE `tb_vRptContractPrice`  (
  `pyear` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `trd_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `contract_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `contract_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `loyalty_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `wh_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `addition_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sup_code_freight` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sup_title_freight` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sup_name_freight` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `freight_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sup_code_cut` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sup_title_cut` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sup_title_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cut_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ret_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `wh_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ret_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ret_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `wh_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `rev_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tot_estwgt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tot_wgtlimit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `gain_qb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `effdate_from` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `effdate_to` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ver_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ver_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `apprv_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apprv_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `com_grade_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `est_wgt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trd_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trd_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state_scrap` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reference` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_vRptContractPrice
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อผู้ใช้',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'อีเมล์',
  `password_hash` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `confirmed_at` int(11) NULL DEFAULT NULL,
  `unconfirmed_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `blocked_at` int(11) NULL DEFAULT NULL,
  `registration_ip` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  `last_login_at` int(11) NULL DEFAULT NULL,
  `access_token_expired_at` int(11) NULL DEFAULT NULL,
  `access_token` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_type_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_unique_username`(`username`) USING BTREE,
  UNIQUE INDEX `user_unique_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (9, 'Tanakit3', 'anndaman88888@gmail.com', '$2a$12$F26gV3ThAkx0HsbNuYdfC.QAbtZd8QvTKHlGybIZijaH/rOep3ani', NULL, NULL, NULL, NULL, 1605603622, NULL, NULL, 1608195622, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2MDU2MDM2MjIsImV4cCI6MTYwODE5NTYyMn0.OXbwrquZuZQa_UzF-lefyOshfOQFKVLh-0Zu_eYaf5Y', 0);

-- ----------------------------
-- Table structure for user_type
-- ----------------------------
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type`  (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'autoid',
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ประเภทผู้ใช้งาน',
  PRIMARY KEY (`user_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO `user_type` VALUES (1, 'SYS Admin');
INSERT INTO `user_type` VALUES (2, 'SYS ปศ.');
INSERT INTO `user_type` VALUES (3, 'ผู้ขายเศษเหล็ก');
INSERT INTO `user_type` VALUES (4, 'ร้านค้าย่อย');
INSERT INTO `user_type` VALUES (5, 'รภป');
INSERT INTO `user_type` VALUES (6, 'พนักงานขับรถยนต์ (mobile app)');

-- ----------------------------
-- View structure for list_รายการรถยนต์
-- ----------------------------
DROP VIEW IF EXISTS `list_รายการรถยนต์`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `list_รายการรถยนต์` AS select `sys_db`.`tb_truck`.`truck_ids` AS `truck_ids`,`sys_db`.`tb_truck`.`truck_no` AS `truck_no`,`sys_db`.`tb_province`.`prov_name` AS `prov_name`,`sys_db`.`tb_truck_type`.`truck_name` AS `truck_name`,`sys_db`.`tb_truck`.`owner_type` AS `owner_type`,concat(`sys_db`.`tb_ret`.`ret_title`,' ',`sys_db`.`tb_ret`.`ret_name`) AS `ret_name`,`sys_db`.`tb_truck`.`truck_confirm` AS `truck_confirm`,`sys_db`.`tb_truck`.`truck_status_id` AS `truck_status_id` from (((`tb_truck` left join `tb_ret` on(`sys_db`.`tb_truck`.`ret_code` = `sys_db`.`tb_ret`.`ret_code`)) left join `tb_province` on(`sys_db`.`tb_truck`.`truck_province` = `sys_db`.`tb_province`.`prov_code`)) left join `tb_truck_type` on(`sys_db`.`tb_truck`.`truck_type` = `sys_db`.`tb_truck_type`.`truck_type_ids`));

-- ----------------------------
-- View structure for list_รายการใบนำส่งเศษเหล็ก
-- ----------------------------
DROP VIEW IF EXISTS `list_รายการใบนำส่งเศษเหล็ก`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `list_รายการใบนำส่งเศษเหล็ก` AS select `sys_db`.`tb_pl`.`pl_ids` AS `pl_ids`,`sys_db`.`tb_pl`.`doc_num` AS `doc_num`,`sys_db`.`tb_pl`.`doc_date` AS `doc_date`,`sys_db`.`tb_pl`.`ship_date` AS `ship_date`,`sys_db`.`tb_pl`.`ship_time_end` AS `ship_time_end`,concat(`sys_db`.`tb_pl`.`ship_time_begin`,'-',`sys_db`.`tb_pl`.`ship_time_end`) AS `TIME`,`sys_db`.`tb_pl`.`ret_code` AS `ret_code`,concat(`sys_db`.`tb_ret`.`ret_title`,' ',`sys_db`.`tb_ret`.`ret_name`) AS `CONCAT(ret_title," ",ret_name)`,`sys_db`.`tb_pl`.`trd_code` AS `trd_code`,concat(`sys_db`.`tb_trd`.`trd_title`,' ',`sys_db`.`tb_trd`.`trd_name`) AS `CONCAT(trd_title," ",trd_name)`,`sys_db`.`tb_truck_type`.`truck_name` AS `truck_name`,group_concat(`sys_db`.`tb_pl_detail`.`com_grade_code` separator ', ') AS `com_grade_code`,`sys_db`.`tb_pl`.`plant_code` AS `plant_code`,concat(`sys_db`.`tb_driver`.`driver_title`,`sys_db`.`tb_driver`.`driver_name`,'  ',`sys_db`.`tb_driver`.`driver_surname`) AS `driver_name`,`sys_db`.`tb_pl`.`shipment_status_id` AS `shipment_status_id`,`sys_db`.`tb_shipment_status`.`shipment_status_des` AS `shipment_status_des` from ((((((`tb_pl` left join `tb_trd` on(`sys_db`.`tb_trd`.`trd_code` = `sys_db`.`tb_pl`.`trd_code`)) left join `tb_ret` on(`sys_db`.`tb_ret`.`ret_code` = `sys_db`.`tb_pl`.`ret_code`)) left join `tb_truck_type` on(`sys_db`.`tb_truck_type`.`truck_type_ids` = `sys_db`.`tb_pl`.`truck_type_ids`)) join `tb_pl_detail` on(`sys_db`.`tb_pl_detail`.`pl_ids` = `sys_db`.`tb_pl`.`pl_ids`)) left join `tb_driver` on(`sys_db`.`tb_pl`.`driver_ids` = `sys_db`.`tb_driver`.`driver_ids`)) left join `tb_shipment_status` on(`sys_db`.`tb_shipment_status`.`shipment_status_id` = `sys_db`.`tb_pl`.`shipment_status_id`)) group by `sys_db`.`tb_pl`.`pl_ids`;

-- ----------------------------
-- View structure for list_รายการใบนำส่งเศษเหล็ก_detail
-- ----------------------------
DROP VIEW IF EXISTS `list_รายการใบนำส่งเศษเหล็ก_detail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `list_รายการใบนำส่งเศษเหล็ก_detail` AS select `sys_db`.`tb_pl_detail`.`pl_detail_ids` AS `pl_detail_ids`,`sys_db`.`tb_pl_detail`.`pl_ids` AS `pl_ids`,`sys_db`.`tb_pl_detail`.`pl_seq` AS `pl_seq`,`sys_db`.`tb_truck`.`truck_no` AS `truck_no`,`sys_db`.`tb_province`.`prov_name` AS `prov_name`,`sys_db`.`tb_pl_detail`.`pl_bulk` AS `pl_bulk`,`sys_db`.`tb_pl_detail`.`contract_yr` AS `contract_yr`,`sys_db`.`tb_pl_detail`.`contract_no` AS `contract_no`,`sys_db`.`tb_pl_detail`.`com_grade_code` AS `com_grade_code`,`sys_db`.`tb_pl_detail`.`truckwgt` AS `truckwgt`,`sys_db`.`tb_pl_detail`.`tot_truckwgt` AS `tot_truckwgt`,`sys_db`.`tb_pl_detail`.`tot_actwgt` AS `tot_actwgt` from ((`tb_pl_detail` left join `tb_truck` on(`sys_db`.`tb_pl_detail`.`truck_ids` = `sys_db`.`tb_truck`.`truck_ids`)) left join `tb_province` on(`sys_db`.`tb_truck`.`truck_province` = `sys_db`.`tb_province`.`prov_code`));

-- ----------------------------
-- View structure for list_รายชื่อผู้ขายเศษเหล็ก
-- ----------------------------
DROP VIEW IF EXISTS `list_รายชื่อผู้ขายเศษเหล็ก`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `list_รายชื่อผู้ขายเศษเหล็ก` AS select `sys_db`.`tb_trd`.`trd_ids` AS `trd_ids`,`sys_db`.`tb_trd`.`trd_code` AS `trd_code`,`sys_db`.`tb_trd`.`trd_title` AS `trd_title`,`sys_db`.`tb_trd`.`trd_name` AS `trd_name`,concat(`sys_db`.`tb_trd`.`trd_title`,' ',`sys_db`.`tb_trd`.`trd_name`) AS `name`,`sys_db`.`tb_trd`.`cn_p1` AS `cn_p1`,`sys_db`.`tb_trd`.`cn_p1_tel` AS `cn_p1_tel`,`sys_db`.`tb_trd`.`trd_status_id` AS `trd_status_id`,`sys_db`.`tb_trd`.`userid` AS `userid` from `tb_trd`;

-- ----------------------------
-- View structure for list_รายชื่อพนักงานขับรถยนต์
-- ----------------------------
DROP VIEW IF EXISTS `list_รายชื่อพนักงานขับรถยนต์`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `list_รายชื่อพนักงานขับรถยนต์` AS select `sys_db`.`tb_driver`.`driver_ids` AS `driver_ids`,concat(`sys_db`.`tb_driver`.`driver_title`,`sys_db`.`tb_driver`.`driver_name`,'  ',`sys_db`.`tb_driver`.`driver_surname`) AS `drivername`,`sys_db`.`tb_driver`.`driver_cid` AS `driver_cid`,`sys_db`.`tb_driver`.`driver_license` AS `driver_license`,`sys_db`.`tb_driver`.`owner_type` AS `owner_type`,`sys_db`.`tb_ret`.`ret_code` AS `ret_code`,concat(`sys_db`.`tb_ret`.`ret_title`,' ',`sys_db`.`tb_ret`.`ret_name`) AS `ret_name`,`sys_db`.`tb_driver`.`confirm_status` AS `confirm_status`,`sys_db`.`tb_driver`.`driver_status_id` AS `driver_status_id` from (`tb_driver` left join `tb_ret` on(`sys_db`.`tb_ret`.`ret_code` = `sys_db`.`tb_driver`.`ret_code`));

-- ----------------------------
-- View structure for list_รายชื่อร้านค้าย่อย
-- ----------------------------
DROP VIEW IF EXISTS `list_รายชื่อร้านค้าย่อย`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `list_รายชื่อร้านค้าย่อย` AS select `sys_db`.`tb_ret`.`ret_ids` AS `ret_ids`,`sys_db`.`tb_ret`.`ret_code` AS `ret_code`,`sys_db`.`tb_ret`.`ret_title` AS `ret_title`,`sys_db`.`tb_ret`.`ret_name` AS `ret_name`,concat(`sys_db`.`tb_ret`.`ret_title`,' ',`sys_db`.`tb_ret`.`ret_name`) AS `name`,`sys_db`.`tb_ret`.`con_p` AS `con_p`,`sys_db`.`tb_ret`.`con_tel` AS `con_tel`,`sys_db`.`tb_ret`.`ret_confirm` AS `ret_confirm`,`sys_db`.`tb_ret`.`ret_status_id` AS `ret_status_id`,`sys_db`.`tb_trd_confirm`.`trd_code` AS `trd_code`,`sys_db`.`tb_ret`.`userid` AS `userid` from (`tb_ret` left join `tb_trd_confirm` on(`sys_db`.`tb_ret`.`ret_code` = `sys_db`.`tb_trd_confirm`.`ret_code`));

-- ----------------------------
-- View structure for list_รายชื่อร้านค้าย่อย_dashboard_ผู้ขายเศษเหล็ก
-- ----------------------------
DROP VIEW IF EXISTS `list_รายชื่อร้านค้าย่อย_dashboard_ผู้ขายเศษเหล็ก`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `list_รายชื่อร้านค้าย่อย_dashboard_ผู้ขายเศษเหล็ก` AS select `sys_db`.`tb_trd_confirm`.`ids` AS `ids`,`sys_db`.`tb_trd_confirm`.`trd_code` AS `trd_code`,`sys_db`.`tb_trd`.`trd_title` AS `trd_title`,`sys_db`.`tb_trd`.`trd_name` AS `trd_name`,concat(`sys_db`.`tb_trd`.`trd_title`,' ',`sys_db`.`tb_trd`.`trd_name`) AS `CONCAT(trd_title," ",trd_name)`,`sys_db`.`tb_ret`.`ret_title` AS `ret_title`,`sys_db`.`tb_ret`.`ret_name` AS `ret_name`,concat(`sys_db`.`tb_ret`.`ret_title`,' ',`sys_db`.`tb_ret`.`ret_name`) AS `CONCAT(ret_title," ",ret_name)`,`sys_db`.`tb_trd_confirm`.`ret_code` AS `ret_code`,`sys_db`.`tb_trd_confirm`.`confirm_status` AS `confirm_status` from ((`tb_trd_confirm` left join `tb_trd` on(`sys_db`.`tb_trd_confirm`.`trd_code` = `sys_db`.`tb_trd`.`trd_code`)) left join `tb_ret` on(`sys_db`.`tb_ret`.`ret_code` = `sys_db`.`tb_trd_confirm`.`ret_code`));

SET FOREIGN_KEY_CHECKS = 1;
