CREATE TABLE `oa`.`o_department` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `name` VARCHAR(20) NOT NULL COMMENT '部门名',
  `description` VARCHAR(45) NOT NULL COMMENT '部门描述',
  `manager` INT NOT NULL COMMENT '管理者',
  PRIMARY KEY (`id`));
