CREATE TABLE `oa`.`o_kind` (
  `id` INT NOT NULL COMMENT '���id',
  `name` INT(4) NOT NULL COMMENT '�������4λ���֣�',
  `description` VARCHAR(45) NOT NULL COMMENT '�����������Ӧ���壩',
  PRIMARY KEY (`id`));

  ALTER TABLE `oa`.`o_kind` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '���id' ;
