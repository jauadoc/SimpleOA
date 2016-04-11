CREATE TABLE `oa`.`o_user` (
  `id` INT NOT NULL COMMENT '用户id',
  `uname` VARCHAR(18) NOT NULL COMMENT '用户名',
  `pwd` VARCHAR(32) NOT NULL COMMENT '用户密码',
  `name` VARCHAR(45) NOT NULL COMMENT '用户姓名',
  `gender` INT NOT NULL COMMENT '性别',
  `birthday` DATE COMMENT '出生日期',
  `tel_phone` VARCHAR(20) COMMENT '分机号',
  `mobile_phone` VARCHAR(20) COMMENT '移动电话',
  `email` VARCHAR(45) COMMENT '邮箱',
  `status` VARCHAR(45) COMMENT '状态（类似个人签名）',
  `head` VARCHAR(100) COMMENT '头像地址',
  `job` INT COMMENT '职位',
  `department` INT NOT NULL COMMENT '所属部门',
  `position_status` VARCHAR(45) NOT NULL COMMENT '在职状态',
  PRIMARY KEY (`id`));
  
  ALTER TABLE `oa`.`o_user` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '用户id' ;

