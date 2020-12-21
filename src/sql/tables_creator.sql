SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Repan
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Repan` ;

-- -----------------------------------------------------
-- Schema Repan
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Repan` DEFAULT CHARACTER SET utf8 ;
USE `Repan` ;

-- -----------------------------------------------------
-- Table `Repan`.`Roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Repan`.`Roles` ;

CREATE TABLE IF NOT EXISTS `Repan`.`Roles` (
  `id` INT NOT NULL,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Repan`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Repan`.`Users` ;

CREATE TABLE IF NOT EXISTS `Repan`.`Users` (
  `id` INT NOT NULL,
  `name` TEXT NOT NULL,
  `Role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_User_Role1_idx` (`Role_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_User_Role1`
    FOREIGN KEY (`Role_id`)
    REFERENCES `Repan`.`Roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Repan`.`Polls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Repan`.`Poll` ;

CREATE TABLE IF NOT EXISTS `Repan`.`Poll` (
  `id` INT NOT NULL,
  `creation_id` INT NOT NULL,
  `title` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_User_Role1_idx` (`creation_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `user_creation_id`
    FOREIGN KEY (`creation_id`)
    REFERENCES `Repan`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Repan`.`Questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Repan`.`Questions` ;

CREATE TABLE IF NOT EXISTS `Repan`.`Questions` (
  `id` INT NOT NULL,
  `text` TEXT NOT NULL,
  `poll_id` INT NOT NULL,
  `variant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Question_Survey_idx` (`poll_id` ASC) VISIBLE,
  INDEX `fk_Question_QuestionType1_idx` (`variant_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Question_Survey`
    FOREIGN KEY (`poll_id`)
    REFERENCES `Repan`.`Poll` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Repan`.`Answers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Repan`.`Answers` ;

CREATE TABLE IF NOT EXISTS `Repan`.`Answers` (
  `id` INT NOT NULL,
  `date` DATE NOT NULL,
  `text` TEXT NOT NULL,
  `user_id` INT NOT NULL,
  `q_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Answer_Expert1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_Answer_Question1_idx` (`q_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Answer_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `Repan`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Answer_q`
    FOREIGN KEY (`q_id`)
    REFERENCES `Repan`.`Questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
