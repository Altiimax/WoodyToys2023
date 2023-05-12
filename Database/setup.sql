CREATE DATABASE b2b;
USE b2b;
CREATE TABLE `stock` (`id` INT AUTO_INCREMENT PRIMARY KEY,`name` varchar(255) DEFAULT NULL,`price` FLOAT(10) DEFAULT NULL);

INSERT INTO `stock` VALUES (NULL, 'item1' , 10);
INSERT INTO `stock` VALUES (NULL, 'item2' , 5);
INSERT INTO `stock` VALUES (NULL, 'item3' , 5);

CREATE USER 'userb2b' IDENTIFIED BY 'userpassword';
 
GRANT ALL PRIVILEGES ON b2b.* TO 'userb2b';

CREATE DATABASE interne;
USE interne;
CREATE TABLE `staff` (`id` INT AUTO_INCREMENT PRIMARY KEY,`name` varchar(255) DEFAULT NULL,`surname` varchar(255) DEFAULT NULL,);

INSERT INTO `staff` VALUES (NULL, 'Kevin' , 'Vandenede');
INSERT INTO `staff` VALUES (NULL, 'Christophe' , 'Fauconnier');
INSERT INTO `staff` VALUES (NULL,  'Victor' , 'Cotton');

CREATE USER 'userinternal' IDENTIFIED BY 'internalpassword';
 
GRANT ALL PRIVILEGES ON interne.* TO 'userinternal';