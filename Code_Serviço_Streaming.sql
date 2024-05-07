-- MySQL Script generated by MySQL Workbench
-- ter 07 mai 2024 14:58:10
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tbUsuários`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbUsuários` (
  `cpf` VARCHAR(20) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(70) NULL,
  `numb cartão` INT NULL,
  `senha` VARCHAR(50) NOT NULL,
  `tipo assinatura` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `numb cartão_UNIQUE` (`numb cartão` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbEndereço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbEndereço` (
  `id endereço` INT NOT NULL,
  `rua` VARCHAR(70) NOT NULL,
  `num casa` VARCHAR(20) NOT NULL,
  `cidade` VARCHAR(30) NOT NULL,
  `estado` VARCHAR(20) NOT NULL,
  `cpf` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id endereço`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  CONSTRAINT `cpf`
    FOREIGN KEY (`cpf`)
    REFERENCES `mydb`.`tbUsuários` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbTelefoneUsuários`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbTelefoneUsuários` (
  `cpf` VARCHAR(20) NOT NULL,
  `telefone usuários` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cpf`, `telefone usuários`),
  UNIQUE INDEX `telefone usuários_UNIQUE` (`telefone usuários` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  CONSTRAINT `cpf`
    FOREIGN KEY (`cpf`)
    REFERENCES `mydb`.`tbUsuários` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbConteúdo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbConteúdo` (
  `id conteúdo` INT NOT NULL,
  `titulo` VARCHAR(30) NOT NULL,
  `diretor` VARCHAR(40) NOT NULL,
  `ano de lançamento` DATE NOT NULL,
  `descrição` VARCHAR(300) NOT NULL,
  `classificação` VARCHAR(20) NOT NULL,
  `tipo documentário` VARCHAR(20) NOT NULL,
  `quant temporadas` INT NOT NULL,
  `tempo duração` TIME NOT NULL,
  `tipo de conteúdo` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id conteúdo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbLista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbLista` (
  `id listar` INT NOT NULL,
  `cpf` VARCHAR(20) NOT NULL,
  `id conteúdo` INT NOT NULL,
  PRIMARY KEY (`id listar`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `id conteúdo_idx` (`id conteúdo` ASC) VISIBLE,
  CONSTRAINT `cpf`
    FOREIGN KEY (`cpf`)
    REFERENCES `mydb`.`tbUsuários` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id conteúdo`
    FOREIGN KEY (`id conteúdo`)
    REFERENCES `mydb`.`tbConteúdo` (`id conteúdo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbConsome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbConsome` (
  `id condumida` INT NOT NULL,
  `cpf` VARCHAR(20) NOT NULL,
  `id conteúdo` INT NOT NULL,
  `horas consumidas` TIME NOT NULL,
  PRIMARY KEY (`id condumida`),
  INDEX `cpf_idx` (`cpf` ASC) VISIBLE,
  INDEX `id conteúdo_idx` (`id conteúdo` ASC) VISIBLE,
  CONSTRAINT `cpf`
    FOREIGN KEY (`cpf`)
    REFERENCES `mydb`.`tbUsuários` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id conteúdo`
    FOREIGN KEY (`id conteúdo`)
    REFERENCES `mydb`.`tbConteúdo` (`id conteúdo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbAvaliações`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbAvaliações` (
  `id avaliação` INT NOT NULL,
  `avaliação` FLOAT NULL,
  `comentarios` VARCHAR(300) NULL,
  PRIMARY KEY (`id avaliação`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbCrítica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbCrítica` (
  `id crítica` INT NOT NULL,
  `cpf` VARCHAR(20) NOT NULL,
  `id conteúdo` INT NOT NULL,
  `id avaliação` INT NOT NULL,
  PRIMARY KEY (`id crítica`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `id avaliação_idx` (`id avaliação` ASC) VISIBLE,
  INDEX `id conteúdo_idx` (`id conteúdo` ASC) VISIBLE,
  CONSTRAINT `cpf`
    FOREIGN KEY (`cpf`)
    REFERENCES `mydb`.`tbUsuários` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id conteúdo`
    FOREIGN KEY (`id conteúdo`)
    REFERENCES `mydb`.`tbConteúdo` (`id conteúdo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id avaliação`
    FOREIGN KEY (`id avaliação`)
    REFERENCES `mydb`.`tbAvaliações` (`id avaliação`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbGênero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbGênero` (
  `id gênero` INT NOT NULL,
  `titulo gênero` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id gênero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbTipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbTipo` (
  `id tipo` INT NOT NULL,
  `id conteúdo` INT NOT NULL,
  `id gênero` INT NOT NULL,
  PRIMARY KEY (`id tipo`),
  INDEX `id conteúdo_idx` (`id conteúdo` ASC) VISIBLE,
  INDEX `id gênero_idx` (`id gênero` ASC) VISIBLE,
  CONSTRAINT `id conteúdo`
    FOREIGN KEY (`id conteúdo`)
    REFERENCES `mydb`.`tbConteúdo` (`id conteúdo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id gênero`
    FOREIGN KEY (`id gênero`)
    REFERENCES `mydb`.`tbGênero` (`id gênero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbFornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbFornecedores` (
  `id fornecedor` INT NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  `contato` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id fornecedor`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbDispõem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbDispõem` (
  `id disponivél` INT NOT NULL,
  `id conteúdo` INT NOT NULL,
  `id fornecedor` INT NOT NULL,
  PRIMARY KEY (`id disponivél`),
  INDEX `id conteúdo_idx` (`id conteúdo` ASC) VISIBLE,
  INDEX `id fornecedor_idx` (`id fornecedor` ASC) VISIBLE,
  CONSTRAINT `id conteúdo`
    FOREIGN KEY (`id conteúdo`)
    REFERENCES `mydb`.`tbConteúdo` (`id conteúdo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id fornecedor`
    FOREIGN KEY (`id fornecedor`)
    REFERENCES `mydb`.`tbFornecedores` (`id fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
