CREATE TABLE `oa`.`o_function` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '����id',
  `name` VARCHAR(45) NOT NULL COMMENT '������',
  `href` VARCHAR(100) NOT NULL COMMENT '���ܶ�Ӧҳ���ַ',
  `obey` INT NULL COMMENT '��������ģ�飨���ܣ�',
  PRIMARY KEY (`id`));
