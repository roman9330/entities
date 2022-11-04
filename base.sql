-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.30 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных entities
CREATE DATABASE IF NOT EXISTS `entities` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `entities`;

-- Дамп структуры для таблица entities.band
CREATE TABLE IF NOT EXISTS `band` (
  `id` int NOT NULL AUTO_INCREMENT,
  `guid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `w` double NOT NULL,
  `t` double NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_band_band_type` (`type`),
  CONSTRAINT `FK_band_band_type` FOREIGN KEY (`type`) REFERENCES `band_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.band_i18n
CREATE TABLE IF NOT EXISTS `band_i18n` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `row_id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__band` (`row_id`),
  CONSTRAINT `FK__band` FOREIGN KEY (`row_id`) REFERENCES `band` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.band_params
CREATE TABLE IF NOT EXISTS `band_params` (
  `id` int NOT NULL AUTO_INCREMENT,
  `band_id` int NOT NULL,
  `prm_id` int NOT NULL,
  `prm_value` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__band1` (`band_id`),
  KEY `FK__param_names` (`prm_id`),
  KEY `FK_band_params_param_values` (`prm_value`),
  CONSTRAINT `FK__band1` FOREIGN KEY (`band_id`) REFERENCES `band` (`id`),
  CONSTRAINT `FK__param_names` FOREIGN KEY (`prm_id`) REFERENCES `param_names` (`id`),
  CONSTRAINT `FK_band_params_param_values` FOREIGN KEY (`prm_value`) REFERENCES `param_values` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.band_type
CREATE TABLE IF NOT EXISTS `band_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `guid` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.material
CREATE TABLE IF NOT EXISTS `material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `guid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `w` double NOT NULL,
  `l` double NOT NULL,
  `t` double NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__material_type` (`type`),
  CONSTRAINT `FK__material_type` FOREIGN KEY (`type`) REFERENCES `material_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.material_i18n
CREATE TABLE IF NOT EXISTS `material_i18n` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `row_id` int NOT NULL,
  `language` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__material` (`row_id`),
  CONSTRAINT `FK__material` FOREIGN KEY (`row_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.material_params
CREATE TABLE IF NOT EXISTS `material_params` (
  `id` int NOT NULL AUTO_INCREMENT,
  `material_id` int NOT NULL,
  `prm_id` int NOT NULL,
  `prm_value` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__material_m` (`material_id`),
  KEY `FK__param_names_m` (`prm_id`),
  KEY `FK_material_param_values` (`prm_value`),
  CONSTRAINT `FK__ma,erial1` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`),
  CONSTRAINT `FK__param_names_m` FOREIGN KEY (`prm_id`) REFERENCES `param_names` (`id`),
  CONSTRAINT `FK_material_params_param_values` FOREIGN KEY (`prm_value`) REFERENCES `param_values` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.material_type
CREATE TABLE IF NOT EXISTS `material_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.param_names
CREATE TABLE IF NOT EXISTS `param_names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `guid` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.param_names_i18n
CREATE TABLE IF NOT EXISTS `param_names_i18n` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `row_id` int NOT NULL,
  `language` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_param_names_i18n_param_names` (`row_id`),
  CONSTRAINT `FK_param_names_i18n_param_names` FOREIGN KEY (`row_id`) REFERENCES `param_names` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.param_values
CREATE TABLE IF NOT EXISTS `param_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.param_values_i18n
CREATE TABLE IF NOT EXISTS `param_values_i18n` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `row_id` int NOT NULL,
  `language` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_param_values_i18n_param_values` (`row_id`),
  CONSTRAINT `FK_param_values_i18n_param_values` FOREIGN KEY (`row_id`) REFERENCES `param_values` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.service
CREATE TABLE IF NOT EXISTS `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `guid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_servise_servise_type` (`type`),
  CONSTRAINT `FK_servise_servise_type` FOREIGN KEY (`type`) REFERENCES `service_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.service_i18n
CREATE TABLE IF NOT EXISTS `service_i18n` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `row_id` int NOT NULL,
  `language` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__servise` (`row_id`),
  CONSTRAINT `FK__servise` FOREIGN KEY (`row_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.service_params
CREATE TABLE IF NOT EXISTS `service_params` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_id` int NOT NULL,
  `prm_id` int NOT NULL,
  `prm_value` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__service_m` (`service_id`),
  KEY `FK__param_names_m` (`prm_id`),
  KEY `FK_service_param_values` (`prm_value`),
  CONSTRAINT `FK__param_names_s` FOREIGN KEY (`prm_id`) REFERENCES `param_names` (`id`),
  CONSTRAINT `FK__service1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `FK_service_params_param_values` FOREIGN KEY (`prm_value`) REFERENCES `param_values` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.service_type
CREATE TABLE IF NOT EXISTS `service_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица entities.short_urls
CREATE TABLE IF NOT EXISTS `short_urls` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `long_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `short_code` varbinary(6) NOT NULL,
  `date_created` int unsigned NOT NULL,
  `counter` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `short_code` (`short_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для процедура entities._bandParamUpdate
DELIMITER //
CREATE PROCEDURE `_bandParamUpdate`(
	IN `p_guid` VARCHAR(36),
	IN `prm_guid` VARCHAR(36),
	IN `p_name` VARCHAR(255),
	IN `p_value` VARCHAR(255),
	IN `p_lng` VARCHAR(5),
	IN `in_vid` INT,
	OUT `out_vid` INT
)
BEGIN
DECLARE vid INT;
DECLARE pid INT;
DECLARE p18id INT;
DECLARE bp INT;
DECLARE bid INT;

	SET bid = (SELECT id FROM band WHERE `guid` = p_guid);
	set vid = (SELECT row_id FROM param_values_i18n WHERE `value` = p_value AND `language` = p_lng);
	if IFNULL(vid, 0) = 0
	then
		if IFNULL(in_vid, 0) = 0
		then
			INSERT INTO param_values VALUES();
			SET in_vid = LAST_INSERT_ID();
		END if;
		INSERT INTO param_values_i18n(`value`, `row_id`, `language`) VALUES(p_value, in_vid, p_lng);
		SET vid = in_vid;
	END if;

	set pid = (SELECT `id` FROM param_names WHERE `guid` = prm_guid);
	SET p18id = (SELECT id FROM param_names_i18n WHERE `row_id` = pid AND `language` = p_lng);

	if IFNULL(pid, 0) = 0
	then
		INSERT INTO param_names(`guid`) VALUES (prm_guid);
		SET pid = LAST_INSERT_ID();
	END if;
	
	if IFNULL(p18id, 0) <> 0
	then
		UPDATE param_names_i18n SET `name` = p_name WHERE id = p18id;
	else
		INSERT INTO param_names_i18n (`name`, `row_id`, `language`) VALUES (p_name, pid, p_lng);
	END if;
	
	SET bp = (SELECT id FROM band_params WHERE `prm_id` = pid AND `band_id` = bid);
	if IFNULL(bp, 0) <> 0 
	then
		UPDATE band_params SET `prm_value` = vid WHERE id = bp;
	else
		INSERT INTO band_params(`band_id`, `prm_id`, `prm_value`) values (bid, pid, vid);
	END if;
	SET out_vid = vid;
	SELECT out_vid;
END//
DELIMITER ;

-- Дамп структуры для процедура entities._bandSelect
DELIMITER //
CREATE PROCEDURE `_bandSelect`(
	IN `p_name` VARCHAR(255),
	IN `p_code` VARCHAR(50),
	IN `lim` INT
)
BEGIN
DECLARE nameStr VARCHAR(255);
SET nameStr = CONCAT('%', p_name, '%');

if p_name = ''
then
	if p_code = ''
	then
		SELECT b.`guid`, `code`, `w`, `t`, bi.`name`, bi.`description`, bt.`name` AS typename, bi.`language`
		FROM band b 
		INNER JOIN band_type bt ON b.`type` = bt.id
		INNER JOIN band_i18n bi ON b.id = bi.row_id
		ORDER BY id LIMIT lim;
	else
		SELECT b.`guid`, `code`, `w`, `t`, bi.`name`, bi.`description`, bt.`name` AS typename, bi.`language`
		FROM band b 
		INNER JOIN band_type bt ON b.`type` = bt.id
		INNER JOIN band_i18n bi ON b.id = bi.row_id 
		WHERE b.`code` = p_code;
	END if;
ELSE
	if p_code = ''
	then
		SELECT distinct b.`guid`, `code`, `w`, `t`, bi.`name`, bi.`description`, bt.`name` AS typename, bi.`language`
		FROM band b 
		INNER JOIN band_type bt ON b.`type` = bt.id
		INNER JOIN band_i18n bi ON b.id = bi.row_id
		INNER JOIN (SELECT `row_id`, `language` FROM band_i18n WHERE `name` LIKE nameStr) s ON b.id = s.row_id -- AND bi.`language` = s.`language` 
		ORDER BY b.id LIMIT lim;
	else
		SELECT distinct b.`guid`, `code`, `w`, `t`, bi.`name`, bi.`description`, bt.`name` AS typename, bi.`language`
		FROM band b 
		INNER JOIN band_type bt ON b.`type` = bt.id
		INNER JOIN band_i18n bi ON b.id = bi.row_id 
		INNER JOIN (SELECT `row_id`, `language` FROM band_i18n WHERE `name` LIKE nameStr) s ON b.id = s.row_id -- AND bi.`language` = s.`language`
		WHERE b.`code` = p_code;
	END if;
END if;
END//
DELIMITER ;

-- Дамп структуры для процедура entities._bandUpdate
DELIMITER //
CREATE PROCEDURE `_bandUpdate`(
	IN `p_guid` VARCHAR(36),
	IN `p_code` VARCHAR(50),
	IN `p_w` DOUBLE,
	IN `p_t` DOUBLE,
	IN `p_type` INT
)
BEGIN
	DECLARE bid INT;
	SET bid = (SELECT `id` FROM band WHERE `guid` = p_guid);

	if IFNULL(bid, 0) <> 0
	then
		UPDATE band
		SET 
			`code` = p_code,
			`w` = p_w,
			`t` = p_t,
			`type` = p_type
		WHERE `id` = bid;
	else
		INSERT INTO band
		(`guid`, `code`, `w`, `t`, `type`)
		VALUES(p_guid, p_code, p_w, p_t, p_type);
	END if;
END//
DELIMITER ;

-- Дамп структуры для процедура entities._band_i18_Update
DELIMITER //
CREATE PROCEDURE `_band_i18_Update`(
	IN `p_guid` VARCHAR(36),
	IN `p_name` VARCHAR(255),
	IN `p_desc` VARCHAR(255),
	IN `p_lang` VARCHAR(5)
)
BEGIN
	DECLARE bid INT;
	DECLARE b18id INT;

	SET bid = (SELECT `id` FROM band WHERE `guid` = p_guid);
	SET b18id = (SELECT `id` FROM band_i18n WHERE `row_id` = bid AND `language` = p_lang);
		
	if IFNULL(b18id, 0) <> 0
	then
		UPDATE band_i18n
		SET 
			`name` = p_name,
			`description` = p_desc
		WHERE `id` = b18id;
	else
		INSERT INTO band_i18n
		(`name`, `description`, `row_id`, `language`)
		VALUES(p_name, p_desc, bid, p_lang);
	END if;
END//
DELIMITER ;

-- Дамп структуры для процедура entities._materialParamUpdate
DELIMITER //
CREATE PROCEDURE `_materialParamUpdate`(
	IN `p_guid` VARCHAR(36),
	IN `prm_guid` VARCHAR(36),
	IN `p_name` VARCHAR(255),
	IN `p_value` VARCHAR(255),
	IN `p_lng` VARCHAR(5),
	IN `in_vid` INT,
	OUT `out_vid` INT
)
BEGIN
DECLARE vid INT;
DECLARE pid INT;
DECLARE p18id INT;
DECLARE mp INT;
DECLARE mid INT;

	SET mid = (SELECT id FROM material WHERE `guid` = p_guid);
	set vid = (SELECT row_id FROM param_values_i18n WHERE `value` = p_value AND `language` = p_lng);
	if IFNULL(vid, 0) = 0
	then
		if IFNULL(in_vid, 0) = 0
		then
			INSERT INTO param_values VALUES();
			SET in_vid = LAST_INSERT_ID();
		END if;
		INSERT INTO param_values_i18n(`value`, `row_id`, `language`) VALUES(p_value, in_vid, p_lng);
		SET vid = in_vid;
	END if;

	set pid = (SELECT `id` FROM param_names WHERE `guid` = prm_guid);
	SET p18id = (SELECT id FROM param_names_i18n WHERE `row_id` = pid AND `language` = p_lng);

	if IFNULL(pid, 0) = 0
	then
		INSERT INTO param_names(`guid`) VALUES (prm_guid);
		SET pid = LAST_INSERT_ID();
	END if;
	
	if IFNULL(p18id, 0) <> 0
	then
		UPDATE param_names_i18n SET `name` = p_name WHERE id = p18id;
	else
		INSERT INTO param_names_i18n (`name`, `row_id`, `language`) VALUES (p_name, pid, p_lng);
	END if;
	
	SET mp = (SELECT id FROM material_params WHERE `prm_id` = pid AND `material_id` = mid);
	if IFNULL(mp, 0) <> 0 
	then
		UPDATE material_params SET `prm_value` = vid WHERE id = mp;
	else
		INSERT INTO material_params(`material_id`, `prm_id`, `prm_value`) values (mid, pid, vid);
	END if;
	SET out_vid = vid;
	SELECT out_vid;
END//
DELIMITER ;

-- Дамп структуры для процедура entities._materialSelect
DELIMITER //
CREATE PROCEDURE `_materialSelect`(
	IN `p_name` VARCHAR(255),
	IN `p_code` VARCHAR(50),
	IN `lim` INT
)
BEGIN
DECLARE nameStr VARCHAR(255);
SET nameStr = CONCAT('%', p_name, '%');

if p_name = ''
then
	if p_code = ''
	then
		SELECT b.`guid`, `code`, `w`, `l`, `t`, bi.`name`, bi.`description`, bt.`name` AS typename, bi.`language`
		FROM material b 
		INNER JOIN material_type bt ON b.`type` = bt.id
		INNER JOIN material_i18n bi ON b.id = bi.row_id
		ORDER BY id LIMIT lim;
	else
		SELECT b.`guid`, `code`, `w`, `l`, `t`, bi.`name`, bi.`description`, bt.`name` AS typename, bi.`language`
		FROM material b 
		INNER JOIN material_type bt ON b.`type` = bt.id
		INNER JOIN material_i18n bi ON b.id = bi.row_id 
		WHERE b.`code` = p_code;
	END if;
ELSE
	if p_code = ''
	then
		SELECT distinct b.`guid`, `code`, `w`, `l`, `t`, bi.`name`, bi.`description`, bt.`name` AS typename, bi.`language`
		FROM material b 
		INNER JOIN material_type bt ON b.`type` = bt.id
		INNER JOIN material_i18n bi ON b.id = bi.row_id
		INNER JOIN (SELECT `row_id`, `language` FROM material_i18n WHERE `name` LIKE nameStr) s ON b.id = s.row_id -- AND bi.`language` = s.`language` 
		ORDER BY b.id LIMIT lim;
	else
		SELECT distinct b.`guid`, `code`, `w`, `l`, `t`, bi.`name`, bi.`description`, bt.`name` AS typename, bi.`language`
		FROM material b 
		INNER JOIN material_type bt ON b.`type` = bt.id
		INNER JOIN material_i18n bi ON b.id = bi.row_id 
		INNER JOIN (SELECT `row_id`, `language` FROM material_i18n WHERE `name` LIKE nameStr) s ON b.id = s.row_id -- AND bi.`language` = s.`language`
		WHERE b.`code` = p_code;
	END if;
END if;
END//
DELIMITER ;

-- Дамп структуры для процедура entities._materialUpdate
DELIMITER //
CREATE PROCEDURE `_materialUpdate`(
	IN `p_guid` VARCHAR(36),
	IN `p_code` VARCHAR(50),
	IN `p_w` DOUBLE,
	IN `p_l` DOUBLE,
	IN `p_t` DOUBLE,
	IN `p_type` INT
)
BEGIN
	DECLARE `mid` INT;
	SET `mid` = (SELECT `id` FROM material WHERE `guid` = p_guid);

	if IFNULL(`mid`, 0) <> 0
	then
		UPDATE material
		SET 
			`code` = p_code,
			`w` = p_w,
			`t` = p_t,
			`l` = p_l,
			`type` = p_type
		WHERE `id` = `mid`;
	else
		INSERT INTO material
		(`guid`, `code`, `w`, `l`, `t`, `type`)
		VALUES(p_guid, p_code, p_w, p_l, p_t, p_type);
	END if;
END//
DELIMITER ;

-- Дамп структуры для процедура entities._material_i18_Update
DELIMITER //
CREATE PROCEDURE `_material_i18_Update`(
	IN `p_guid` VARCHAR(36),
	IN `p_name` VARCHAR(255),
	IN `p_desc` VARCHAR(255),
	IN `p_lang` VARCHAR(5)
)
BEGIN
	DECLARE `mid` INT;
	DECLARE `m18id` INT;

	SET `mid` = (SELECT `id` FROM material WHERE `guid` = p_guid);
	SET `m18id` = (SELECT `id` FROM material_i18n WHERE `row_id` = `mid` AND `language` = p_lang);
		
	if IFNULL(`m18id`, 0) <> 0
	then
		UPDATE material_i18n
		SET 
			`name` = p_name,
			`description` = p_desc
		WHERE `id` = `m18id`;
	else
		INSERT INTO material_i18n
		(`name`, `description`, `row_id`, `language`)
		VALUES(p_name, p_desc, `mid`, p_lang);
	END if;
END//
DELIMITER ;

-- Дамп структуры для процедура entities._serviceParamUpdate
DELIMITER //
CREATE PROCEDURE `_serviceParamUpdate`(
	IN `p_guid` VARCHAR(36),
	IN `prm_guid` VARCHAR(36),
	IN `p_name` VARCHAR(255),
	IN `p_value` VARCHAR(255),
	IN `p_lng` VARCHAR(5),
	IN `in_vid` INT,
	OUT `out_vid` INT
)
BEGIN
DECLARE vid INT;
DECLARE pid INT;
DECLARE p18id INT;
DECLARE mp INT;
DECLARE sid INT;

	SET sid = (SELECT id FROM service WHERE `guid` = p_guid);
	set vid = (SELECT row_id FROM param_values_i18n WHERE `value` = p_value AND `language` = p_lng);
	if IFNULL(vid, 0) = 0
	then
		if IFNULL(in_vid, 0) = 0
		then
			INSERT INTO param_values VALUES();
			SET in_vid = LAST_INSERT_ID();
		END if;
		INSERT INTO param_values_i18n(`value`, `row_id`, `language`) VALUES(p_value, in_vid, p_lng);
		SET vid = in_vid;
	END if;

	set pid = (SELECT `id` FROM param_names WHERE `guid` = prm_guid);
	SET p18id = (SELECT id FROM param_names_i18n WHERE `row_id` = pid AND `language` = p_lng);

	if IFNULL(pid, 0) = 0
	then
		INSERT INTO param_names(`guid`) VALUES (prm_guid);
		SET pid = LAST_INSERT_ID();
	END if;
	
	if IFNULL(p18id, 0) <> 0
	then
		UPDATE param_names_i18n SET `name` = p_name WHERE id = p18id;
	else
		INSERT INTO param_names_i18n (`name`, `row_id`, `language`) VALUES (p_name, pid, p_lng);
	END if;
	
	SET mp = (SELECT id FROM service_params WHERE `prm_id` = pid AND `service_id` = sid);
	if IFNULL(mp, 0) <> 0 
	then
		UPDATE service_params SET `prm_value` = vid WHERE id = mp;
	else
		INSERT INTO service_params(`service_id`, `prm_id`, `prm_value`) values (sid, pid, vid);
	END if;
	SET out_vid = vid;
	SELECT out_vid;
END//
DELIMITER ;

-- Дамп структуры для процедура entities._serviceSelect
DELIMITER //
CREATE PROCEDURE `_serviceSelect`(
	IN `p_name` VARCHAR(255),
	IN `p_code` VARCHAR(50),
	IN `lim` INT
)
BEGIN
DECLARE nameStr VARCHAR(255);

SET nameStr = CONCAT('%', p_name, '%');

if p_name = ''
then
	if p_code = ''
	then
		SELECT b.`id`, b.`guid`, `code`, bi.`name`, bi.`description`, bt.`name` AS typename, bi.`language`
		FROM service b 
		INNER JOIN service_type bt ON b.`type` = bt.id
		INNER JOIN service_i18n bi ON b.id = bi.row_id
		ORDER BY id LIMIT lim;
	else
		SELECT b.`id`, b.`guid`, `code`, bi.`name`, bi.`description`, bt.`name` AS typename, bi.`language`
		FROM service b 
		INNER JOIN service_type bt ON b.`type` = bt.id
		INNER JOIN service_i18n bi ON b.id = bi.row_id 
		WHERE b.`code` = p_code;
	END if;
ELSE
	if p_code = ''
	then
		SELECT distinct b.`id`, b.`guid`, `code`, bi.`name`, bi.`description`, bt.`name` AS typename, bi.`language`
		FROM service b 
		INNER JOIN service_type bt ON b.`type` = bt.id
		INNER JOIN service_i18n bi ON b.id = bi.row_id
		INNER JOIN (SELECT `row_id`, `language` FROM service_i18n WHERE `name` LIKE nameStr) s ON b.id = s.row_id -- AND bi.`language` = s.`language` 
		ORDER BY b.id LIMIT lim;
	else
		SELECT distinct b.`id`, b.`guid`, `code`, bi.`name`, bi.`description`, bt.`name` AS typename, bi.`language`
		FROM service b 
		INNER JOIN service_type bt ON b.`type` = bt.id
		INNER JOIN service_i18n bi ON b.id = bi.row_id 
		INNER JOIN (SELECT `row_id`, `language` FROM service_i18n WHERE `name` LIKE nameStr) s ON b.id = s.row_id -- AND bi.`language` = s.`language`
		WHERE b.`code` = p_code;
	END if;
END if;
END//
DELIMITER ;

-- Дамп структуры для процедура entities._serviceUpdate
DELIMITER //
CREATE PROCEDURE `_serviceUpdate`(
	IN `p_guid` VARCHAR(36),
	IN `p_code` VARCHAR(50),
	IN `p_type` INT
)
BEGIN
DECLARE sid INT;
	SET sid = (SELECT `id` FROM service WHERE `guid` = p_guid);

	if IFNULL(sid, 0) <> 0
	then
		UPDATE service
		SET 
			`code` = p_code,
			`type` = p_type
		WHERE `id` = sid;
	else
		INSERT INTO service
		(`guid`, `code`, `type`)
		VALUES(p_guid, p_code, p_type);
	END if;
END//
DELIMITER ;

-- Дамп структуры для процедура entities._service_i18_Update
DELIMITER //
CREATE PROCEDURE `_service_i18_Update`(
	IN `p_guid` VARCHAR(36),
	IN `p_name` VARCHAR(255),
	IN `p_desc` VARCHAR(255),
	IN `p_lang` VARCHAR(5)
)
BEGIN
	DECLARE sid INT;
	DECLARE s18id INT;

	SET sid = (SELECT `id` FROM service WHERE `guid` = p_guid);
	SET s18id = (SELECT `id` FROM service_i18n WHERE `row_id` = sid AND `language` = p_lang);
		
	if IFNULL(s18id, 0) <> 0
	then
		UPDATE service_i18n
		SET 
			`name` = p_name,
			`description` = p_desc
		WHERE `id` = s18id;
	else
		INSERT INTO service_i18n
		(`name`, `description`, `row_id`, `language`)
		VALUES(p_name, p_desc, sid, p_lang);
	END if;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
