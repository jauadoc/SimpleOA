CREATE TABLE `oa`.`o_document` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `name` VARCHAR(45) NOT NULL COMMENT '文件名',
  `kind` VARCHAR(255) NOT NULL COMMENT '文件类型',
  `authorization` INT NOT NULL COMMENT '查阅权限（全公司|部门）',
  `size` VARCHAR(20) NOT NULL COMMENT '文件大小',
  `location` VARCHAR(100) NOT NULL COMMENT '文件地址',
  `did` INT COMMENT '部门id',
  `document_date` DATE NOT NULL COMMENT '创建日期',
  `uid` INT NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`));
