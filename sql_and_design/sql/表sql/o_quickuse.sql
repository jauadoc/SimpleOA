CREATE TABLE `oa`.`o_quickuse` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '快捷方式id',
  `fid` INT NOT NULL COMMENT '对应功能id',
  `uid` INT NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`));
ALTER TABLE `oa`.`o_quickuse` 
ADD COLUMN `isChoose` INT NOT NULL AFTER `uid`;
