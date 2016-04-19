CREATE TABLE `oa`.`o_phonebook` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` INT NOT NULL COMMENT '归属用户id',
  `cid` INT NOT NULL COMMENT '联系人id',
  PRIMARY KEY (`id`));
