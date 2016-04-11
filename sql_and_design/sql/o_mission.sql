CREATE TABLE `oa`.`o_mission` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `name` VARCHAR(20) NOT NULL COMMENT '任务名',
  `description` VARCHAR(45) NOT NULL COMMENT '任务描述',
  `executor` INT NOT NULL COMMENT '执行人员',
  `publisher` INT NOT NULL COMMENT '发布人员',
  `start_date` DATE NOT NULL COMMENT '任务开始日期',
  `end_date` DATE NOT NULL COMMENT '任务结束日期',
  `is_end` INT NOT NULL COMMENT '任务是否完成',
  `is_overdate` INT NOT NULL COMMENT '是否过期作废',
  `is_delay` INT NOT NULL COMMENT '是否延迟完成',
  PRIMARY KEY (`id`));
