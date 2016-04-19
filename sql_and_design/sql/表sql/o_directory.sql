CREATE TABLE `oa`.`o_directory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `img` VARCHAR(255) NOT NULL,
  `href` VARCHAR(45) NOT NULL,
  `order` INT NOT NULL,
  PRIMARY KEY (`id`));
