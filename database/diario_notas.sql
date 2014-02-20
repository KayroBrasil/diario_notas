SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `diario_notas`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diario_notas`.`aluno` (
  `matricula` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diario_notas`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diario_notas`.`disciplina` (
  `iddisciplina` INT NOT NULL,
  PRIMARY KEY (`iddisciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diario_notas`.`matriculado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diario_notas`.`matriculado` (
  `aluno_matricula` INT NOT NULL,
  `disciplina_iddisciplina` INT NOT NULL,
  PRIMARY KEY (`aluno_matricula`, `disciplina_iddisciplina`),
  INDEX `fk_aluno_has_disciplina_disciplina1_idx` (`disciplina_iddisciplina` ASC),
  INDEX `fk_aluno_has_disciplina_aluno_idx` (`aluno_matricula` ASC),
  CONSTRAINT `fk_aluno_has_disciplina_aluno`
    FOREIGN KEY (`aluno_matricula`)
    REFERENCES `diario_notas`.`aluno` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_has_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_iddisciplina`)
    REFERENCES `diario_notas`.`disciplina` (`iddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diario_notas`.`componenteavaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diario_notas`.`componenteavaliacao` (
  `idcomponenteavaliacao` INT NOT NULL,
  `total` INT NOT NULL,
  `limite` INT NOT NULL,
  PRIMARY KEY (`idcomponenteavaliacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diario_notas`.`possui`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diario_notas`.`possui` (
  `disciplina_iddisciplina` INT NOT NULL,
  `componenteavaliacao_idcomponenteavaliacao` INT NOT NULL,
  PRIMARY KEY (`disciplina_iddisciplina`, `componenteavaliacao_idcomponenteavaliacao`),
  INDEX `fk_disciplina_has_componenteavaliacao_componenteavaliacao1_idx` (`componenteavaliacao_idcomponenteavaliacao` ASC),
  INDEX `fk_disciplina_has_componenteavaliacao_disciplina1_idx` (`disciplina_iddisciplina` ASC),
  CONSTRAINT `fk_disciplina_has_componenteavaliacao_disciplina1`
    FOREIGN KEY (`disciplina_iddisciplina`)
    REFERENCES `diario_notas`.`disciplina` (`iddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplina_has_componenteavaliacao_componenteavaliacao1`
    FOREIGN KEY (`componenteavaliacao_idcomponenteavaliacao`)
    REFERENCES `diario_notas`.`componenteavaliacao` (`idcomponenteavaliacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diario_notas`.`examesemestral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diario_notas`.`examesemestral` (
  `idexamesemestral` INT NOT NULL,
  `componenteavaliacao_idcomponenteavaliacao` INT NOT NULL,
  `pontuacaomaxima` INT NOT NULL,
  `peso` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idexamesemestral`, `componenteavaliacao_idcomponenteavaliacao`),
  INDEX `fk_examesemestral_componenteavaliacao1_idx` (`componenteavaliacao_idcomponenteavaliacao` ASC),
  CONSTRAINT `fk_examesemestral_componenteavaliacao1`
    FOREIGN KEY (`componenteavaliacao_idcomponenteavaliacao`)
    REFERENCES `diario_notas`.`componenteavaliacao` (`idcomponenteavaliacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diario_notas`.`examemensal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diario_notas`.`examemensal` (
  `idexamemensal` INT NOT NULL,
  `componenteavaliacao_idcomponenteavaliacao` INT NOT NULL,
  `pontuacaomaxima` INT NOT NULL,
  `peso` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idexamemensal`, `componenteavaliacao_idcomponenteavaliacao`),
  INDEX `fk_examemensal_componenteavaliacao1_idx` (`componenteavaliacao_idcomponenteavaliacao` ASC),
  CONSTRAINT `fk_examemensal_componenteavaliacao1`
    FOREIGN KEY (`componenteavaliacao_idcomponenteavaliacao`)
    REFERENCES `diario_notas`.`componenteavaliacao` (`idcomponenteavaliacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diario_notas`.`examefinal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diario_notas`.`examefinal` (
  `idexamefinal` INT NOT NULL,
  `componenteavaliacao_idcomponenteavaliacao` INT NOT NULL,
  `pontuacaomaxima` INT NOT NULL,
  `peso` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idexamefinal`, `componenteavaliacao_idcomponenteavaliacao`),
  INDEX `fk_examefinal_componenteavaliacao1_idx` (`componenteavaliacao_idcomponenteavaliacao` ASC),
  CONSTRAINT `fk_examefinal_componenteavaliacao1`
    FOREIGN KEY (`componenteavaliacao_idcomponenteavaliacao`)
    REFERENCES `diario_notas`.`componenteavaliacao` (`idcomponenteavaliacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diario_notas`.`projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diario_notas`.`projeto` (
  `idprojeto` INT NOT NULL,
  `componenteavaliacao_idcomponenteavaliacao` INT NOT NULL,
  `pontuacaomaxima` INT NOT NULL,
  `peso` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idprojeto`, `componenteavaliacao_idcomponenteavaliacao`),
  INDEX `fk_projeto_componenteavaliacao1_idx` (`componenteavaliacao_idcomponenteavaliacao` ASC),
  CONSTRAINT `fk_projeto_componenteavaliacao1`
    FOREIGN KEY (`componenteavaliacao_idcomponenteavaliacao`)
    REFERENCES `diario_notas`.`componenteavaliacao` (`idcomponenteavaliacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
