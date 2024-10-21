CREATE TABLE IF NOT EXISTS `cp_charinfo` (
    `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
    `charinfo` varchar(50) NOT NULL,
    `tattosinfo` text DEFAULT NULL,
    `clothes` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;