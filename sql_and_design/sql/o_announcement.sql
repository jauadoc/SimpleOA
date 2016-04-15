CREATE TABLE `oa`.`o_announcement` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `name` VARCHAR(45) NOT NULL COMMENT '公告标题',
  `content` VARCHAR(255) NOT NULL COMMENT '公告内容',
  `kind` INT NOT NULL COMMENT '公告类型（全公司|部门）',
  `did` INT COMMENT '部门id',
  `announcement_date` DATE NOT NULL COMMENT '发布日期',
  `is_show` INT NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`id`));
  
  ALTER TABLE `oa`.`o_announcement` 
ADD COLUMN `expiration` DATE NOT NULL AFTER `is_show`;

