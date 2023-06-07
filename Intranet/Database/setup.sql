CREATE DATABASE woodytoys;
USE woodytoys;
CREATE TABLE `stock` (`id` INT AUTO_INCREMENT PRIMARY KEY,`name` varchar(255) DEFAULT NULL,`price` FLOAT(10) DEFAULT NULL);

INSERT INTO `stock` VALUES (NULL, 'item1' , 10);
INSERT INTO `stock` VALUES (NULL, 'item2' , 5);
INSERT INTO `stock` VALUES (NULL, 'item3' , 5);

CREATE TABLE `staff` (`id` INT AUTO_INCREMENT PRIMARY KEY,`name` varchar(255) DEFAULT NULL,`surname` varchar(255) DEFAULT NULL);

INSERT INTO `staff` VALUES (NULL, 'Kevin' , 'Vandenede');
INSERT INTO `staff` VALUES (NULL, 'Christopher' , 'Fauconnier');
INSERT INTO `staff` VALUES (NULL,  'Victor' , 'Cotton');