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
  CONSTRAINT `FK__service1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `FK__param_names_s` FOREIGN KEY (`prm_id`) REFERENCES `param_names` (`id`),
  CONSTRAINT `FK_service_params_param_values` FOREIGN KEY (`prm_value`) REFERENCES `param_values` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для процедура entities._bandParamUpdate
DELIMITER //
CREATE PROCEDURE `_service_serviceParamUpdateParamUpdate`(
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

	SET mid = (SELECT id FROM service WHERE `guid` = p_guid);
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
	
	SET mp = (SELECT id FROM service_params WHERE `prm_id` = pid);
	if IFNULL(mp, 0) <> 0 
	then
		UPDATE service_params SET `prm_value` = vid WHERE id = mp;
	else
		INSERT INTO service_params(`band_id`, `prm_id`, `prm_value`) values (bid, pid, vid);
	END if;
	SET out_vid = vid;
	SELECT out_vid;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
