-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema campeonatov2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema campeonatov2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `campeonatov2` DEFAULT CHARACTER SET utf8 ;
USE `campeonatov2` ;

-- -----------------------------------------------------
-- Table `campeonatov2`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campeonatov2`.`estado` (
  `idestado` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `sigla` VARCHAR(2) NULL,
  PRIMARY KEY (`idestado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `campeonatov2`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campeonatov2`.`cidade` (
  `idcidade` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `estado_idestado` INT NOT NULL,
  PRIMARY KEY (`idcidade`),
  INDEX `fk_cidade_estado1_idx` (`estado_idestado` ASC),
  CONSTRAINT `fk_cidade_estado1`
    FOREIGN KEY (`estado_idestado`)
    REFERENCES `campeonatov2`.`estado` (`idestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `campeonatov2`.`times`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campeonatov2`.`times` (
  `idtime` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `bandeira` VARCHAR(45) NULL,
  `cidade_idcidade` INT NOT NULL,
  PRIMARY KEY (`idtime`),
  INDEX `fk_times_cidade1_idx` (`cidade_idcidade` ASC),
  CONSTRAINT `fk_times_cidade1`
    FOREIGN KEY (`cidade_idcidade`)
    REFERENCES `campeonatov2`.`cidade` (`idcidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `campeonatov2`.`torcedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campeonatov2`.`torcedores` (
  `idtorcedore` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(11) NULL,
  `logradouro` VARCHAR(45) NULL,
  `numero` INT NULL,
  `complemento` VARCHAR(45) NULL,
  `telefone` VARCHAR(11) NULL,
  `times_idtime` INT NULL,
  `cidade_idcidade` INT NULL,
  PRIMARY KEY (`idtorcedore`),
  INDEX `fk_torcedores_times_idx` (`times_idtime` ASC),
  INDEX `fk_torcedores_cidade1_idx` (`cidade_idcidade` ASC),
  CONSTRAINT `fk_torcedores_times`
    FOREIGN KEY (`times_idtime`)
    REFERENCES `campeonatov2`.`times` (`idtime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_torcedores_cidade1`
    FOREIGN KEY (`cidade_idcidade`)
    REFERENCES `campeonatov2`.`cidade` (`idcidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `campeonatov2`.`campeonatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campeonatov2`.`campeonatos` (
  `idcampeonato` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `dataInicio` VARCHAR(45) NULL,
  `dataFim` VARCHAR(45) NULL,
  PRIMARY KEY (`idcampeonato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `campeonatov2`.`times_has_campeonatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campeonatov2`.`times_has_campeonatos` (
  `times_idtime` INT NOT NULL,
  `campeonatos_idcampeonato` INT NOT NULL,
  PRIMARY KEY (`times_idtime`, `campeonatos_idcampeonato`),
  INDEX `fk_times_has_campeonatos_campeonatos1_idx` (`campeonatos_idcampeonato` ASC),
  INDEX `fk_times_has_campeonatos_times1_idx` (`times_idtime` ASC),
  CONSTRAINT `fk_times_has_campeonatos_times1`
    FOREIGN KEY (`times_idtime`)
    REFERENCES `campeonatov2`.`times` (`idtime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_times_has_campeonatos_campeonatos1`
    FOREIGN KEY (`campeonatos_idcampeonato`)
    REFERENCES `campeonatov2`.`campeonatos` (`idcampeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
