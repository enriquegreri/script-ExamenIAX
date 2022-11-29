CREATE USER 'gestor'@'%' IDENTIFIED BY '';
GRANT SELECT, INSERT, UPDATE, DELETE ON gestorTaller.* TO 'gestor'@'%'
