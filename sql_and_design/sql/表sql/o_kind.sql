CREATE TABLE `oa`.`o_kind` (
  `id` INT NOT NULL COMMENT '类别id',
  `name` INT(4) NOT NULL COMMENT '类别名（4位数字）',
  `description` VARCHAR(45) NOT NULL COMMENT '类别描述（对应含义）',
  PRIMARY KEY (`id`));

  ALTER TABLE `oa`.`o_kind` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '类别id' ;
