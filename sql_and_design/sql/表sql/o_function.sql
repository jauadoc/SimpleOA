CREATE TABLE `oa`.`o_function` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '功能id',
  `name` VARCHAR(45) NOT NULL COMMENT '功能名',
  `href` VARCHAR(100) NOT NULL COMMENT '功能对应页面地址',
  `obey` INT NULL COMMENT '功能所属模块（功能）',
  PRIMARY KEY (`id`));
