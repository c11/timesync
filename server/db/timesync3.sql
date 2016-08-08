SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `image_list`
-- ----------------------------
DROP TABLE IF EXISTS `image_list`;
CREATE TABLE `image_list` (
  `project_id` int(11) DEFAULT NULL,
  `tsa` int(11) DEFAULT NULL,
  `imgtype` varchar(255) NOT NULL,
  `imgyear` int(11) NOT NULL,
  `imgday` int(11) NOT NULL,
  `reflfile` varchar(255) NOT NULL,
  `tcfile` varchar(255) NOT NULL,
  `cloudfile` varchar(255) DEFAULT NULL,
  `image_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `load_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `image_preference`
-- ----------------------------
DROP TABLE IF EXISTS `image_preference`;
CREATE TABLE `image_preference` (
  `cpid` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `tsa` int(11) DEFAULT NULL,
  `plotid` int(11) DEFAULT NULL,
  `image_year` int(11) DEFAULT NULL,
  `image_julday` int(11) DEFAULT NULL,
  `interpreter` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT '0',
  PRIMARY KEY (`cpid`),
  KEY `ptpyj` (`project_id`,`tsa`,`plotid`,`image_year`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `interpreter`
-- ----------------------------
DROP TABLE IF EXISTS `interpreter`;
CREATE TABLE `interpreter` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(80) DEFAULT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `password` char(40) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `plot_comments`
-- ----------------------------
DROP TABLE IF EXISTS `plot_comments`;
CREATE TABLE `plot_comments` (
  `project_id` int(11) NOT NULL,
  `tsa` int(11) NOT NULL,
  `plotid` int(11) NOT NULL,
  `interpreter` int(80) NOT NULL,
  `comment` mediumtext,
  `is_example` tinyint(1) DEFAULT NULL,
  `is_complete` tinyint(1) DEFAULT NULL,
  `is_wetland` tinyint(4) DEFAULT NULL,
  `uncertainty` int(10) unsigned DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`,`tsa`,`plotid`,`interpreter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `plots`
-- ----------------------------
DROP TABLE IF EXISTS `plots`;
CREATE TABLE `plots` (
  `project_id` int(11) DEFAULT NULL,
  `tsa` int(11) DEFAULT '999999',
  `plotid` int(11) DEFAULT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `is_forest` bit(1) DEFAULT NULL,
  `is_tiger_urban` bit(1) DEFAULT NULL,
  `load_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ppid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ppid`),
  KEY `ptp` (`project_id`,`tsa`,`plotid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `project_interpreter`
-- ----------------------------
DROP TABLE IF EXISTS `project_interpreter`;
CREATE TABLE `project_interpreter` (
  `prj_interp_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `tsa` int(11) DEFAULT '999999',
  `interpreter` int(11) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  `role` int(11) DEFAULT '0' COMMENT '1: interpreter; 2: arbitrator',
  `complete_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`prj_interp_id`,`isactive`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `projects`
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code` varchar(32) DEFAULT NULL,
  `project_name` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `contact` varchar(250) DEFAULT NULL,
  `plot_size` int(11) NOT NULL DEFAULT '1',
  `target_day` int(11) NOT NULL DEFAULT '215',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `region_spectrals`
-- ----------------------------
DROP TABLE IF EXISTS `region_spectrals`;
CREATE TABLE `region_spectrals` (
  `project_id` int(11) DEFAULT NULL,
  `tsa` int(11) DEFAULT NULL,
  `plotid` int(11) NOT NULL,
  `sensor` varchar(255) NOT NULL,
  `image_year` int(11) NOT NULL,
  `image_julday` int(11) NOT NULL,
  `b1` int(11) NOT NULL,
  `b2` int(11) NOT NULL,
  `b3` int(11) NOT NULL,
  `b4` int(11) NOT NULL,
  `b5` int(11) NOT NULL,
  `b7` int(11) NOT NULL,
  `tcb` int(11) NOT NULL,
  `tcg` int(11) NOT NULL,
  `tcw` int(11) NOT NULL,
  `cloud` int(11) DEFAULT NULL,
  `cloud_cover` int(11) DEFAULT NULL,
  `spectral_scaler` int(11) DEFAULT '10000',
  `priority` tinyint(4) DEFAULT '1',
  `target_day` mediumint(9) NOT NULL DEFAULT '215',
  `rsid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rsid`),
  KEY `ptp` (`project_id`,`tsa`,`plotid`,`image_year`),
  KEY `index2` (`project_id`,`tsa`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `response_config`
-- ----------------------------
DROP TABLE IF EXISTS `response_config`;
CREATE TABLE `response_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `identifier` varchar(45) DEFAULT NULL,
  `label` varchar(45) DEFAULT NULL,
  `response_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `response_link`
-- ----------------------------
DROP TABLE IF EXISTS `response_link`;
CREATE TABLE `response_link` (
  `project_id` bigint(20) NOT NULL,
  `parent_config_id` bigint(20) NOT NULL,
  `child_config_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `response_type`
-- ----------------------------
DROP TABLE IF EXISTS `response_type`;
CREATE TABLE `response_type` (
  `response_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`response_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `responses`
-- ----------------------------
DROP TABLE IF EXISTS `responses`;
CREATE TABLE `responses` (
  `response_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `notes` text,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`response_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `spectral_properties`
-- ----------------------------
DROP TABLE IF EXISTS `spectral_properties`;
CREATE TABLE `spectral_properties` (
  `spectral_id` int(11) NOT NULL,
  `spectral_name` varchar(255) NOT NULL,
  `spectral_min` float NOT NULL,
  `spectral_mean` float NOT NULL,
  `spectral_max` float NOT NULL,
  `spectral_std` float NOT NULL,
  PRIMARY KEY (`spectral_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `vertex`
-- ----------------------------
DROP TABLE IF EXISTS `vertex`;
CREATE TABLE `vertex` (
  `vertex_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `tsa` int(11) DEFAULT NULL,
  `plotid` int(11) DEFAULT NULL,
  `image_year` int(11) DEFAULT NULL,
  `image_julday` int(11) DEFAULT NULL,
  `dominant_landuse` varchar(50) DEFAULT NULL,
  `secondary_landuse` varchar(50) DEFAULT NULL,
  `dominant_landuse_notes` text,
  `secondary_landuse_notes` text,
  `dominant_landcover` varchar(50) DEFAULT NULL,
  `secondary_landcover` varchar(50) DEFAULT NULL,
  `dominant_landcover_notes` text,
  `secondary_landcover_notes` text,
  `landcover_ephemeral` bit(1) DEFAULT NULL,
  `date_confidence` varchar(10) DEFAULT NULL,
  `change_process` varchar(30) DEFAULT NULL,
  `change_process_notes` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `interpreter` int(80) DEFAULT NULL,
  `julday` int(11) DEFAULT NULL,
  `patch_size` int(10) unsigned DEFAULT NULL,
  `relative_magnitude` int(10) unsigned DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `qa_by` int(11) DEFAULT '0',
  `history_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`vertex_id`),
  KEY `ptp` (`plotid`,`tsa`,`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
