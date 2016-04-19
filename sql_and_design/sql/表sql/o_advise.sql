CREATE TABLE `oa`.`o_advise` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '意见id',
  `name` VARCHAR(45) NOT NULL COMMENT '意见标题',
  `content` VARCHAR(255) NOT NULL COMMENT '意见内容',
  `did` INT NOT NULL COMMENT '涉及部门',
  `advise_date` DATE NOT NULL COMMENT '创建日期',
  `uid` INT COMMENT '创建人',
  PRIMARY KEY (`id`));
