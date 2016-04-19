CREATE TABLE `oa`.`o_attendance` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` INT NOT NULL COMMENT '归属用户',
  `work_start` DATE COMMENT '上班打卡时间',
  `work_end` DATE COMMENT '下班打卡时间',
  `work_time` VARCHAR(4) COMMENT '工作时长',
  `attendance_date` DATE NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`));
