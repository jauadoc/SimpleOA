CREATE TABLE `oa`.`o_process` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '申请类别id',
  `name` VARCHAR(20) NOT NULL COMMENT '申请类别名',
  `description` VARCHAR(255) NOT NULL COMMENT '申请类别描述',
  `obey_department` INT NOT NULL COMMENT '所属部门',
  `approve_level` INT NOT NULL COMMENT '申请级别（一级|二级）',
  `approve_one` INT NOT NULL COMMENT '一级审批人职位',
  `approve_two` INT NOT NULL COMMENT '二级审批人职位',
  PRIMARY KEY (`id`));
