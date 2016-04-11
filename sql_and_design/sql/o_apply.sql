CREATE TABLE `oa`.`o_apply` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `name` VARCHAR(20) NOT NULL COMMENT '申请名',
  `description` VARCHAR(255) NOT NULL COMMENT '申请描述',
  `apply` INT NOT NULL COMMENT '申请人',
  `up_date` DATE NOT NULL COMMENT '申请提交日期',
  `apply_date` DATE NOT NULL COMMENT '申请日期',
  `status` INT NOT NULL COMMENT '申请状态（批准|驳回|未读）',
  `kind` INT NOT NULL COMMENT '申请类别',
  PRIMARY KEY (`id`));
