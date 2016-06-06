-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema condominio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema condominio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `condominio` DEFAULT CHARACTER SET utf8 ;
USE `condominio` ;

-- -----------------------------------------------------
-- Table `condominio`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `condominio`.`usuarios` (
  `id_usuarios` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`id_usuarios`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
