CREATE TABLE `oa`.`o_calender` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '日程id',
  `calender_date` DATE NOT NULL COMMENT '日期',
  `matter` VARCHAR(255) NOT NULL COMMENT '该日事项',
  `uid` INT NOT NULL COMMENT '归属用户',
  PRIMARY KEY (`id`));
