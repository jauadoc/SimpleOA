CREATE TABLE `oa`.`o_quickuse` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '��ݷ�ʽid',
  `fid` INT NOT NULL COMMENT '��Ӧ����id',
  `uid` INT NOT NULL COMMENT '�û�id',
  PRIMARY KEY (`id`));
ALTER TABLE `oa`.`o_quickuse` 
ADD COLUMN `isChoose` INT NOT NULL AFTER `uid`;
