CREATE TABLE `oa`.`o_job` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '职位id',
  `name` VARCHAR(20) NOT NULL COMMENT '职位名',
  `description` VARCHAR(45) NOT NULL COMMENT '职位描述',
  `obey_department` INT NOT NULL COMMENT '所属部门（id）',
  `authorization` INT NOT NULL COMMENT '权限等级',
  PRIMARY KEY (`id`));
