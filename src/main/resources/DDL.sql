CREATE SCHEMA `opentest` ;

CREATE TABLE `opentest`.`users` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `login` varchar(45) DEFAULT NULL,
    `password` varchar(45) DEFAULT NULL,
    `name` varchar(45) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `login_UNIQUE` (`login`)
);

CREATE TABLE `opentest`.`tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `opentest`.`questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(45) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE `opentest`.`questions`
ADD INDEX `id_idx` (`test_id` ASC);
ALTER TABLE `opentest`.`questions`
ADD CONSTRAINT `id_qt`
  FOREIGN KEY (`test_id`)
  REFERENCES `opentest`.`tests` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

CREATE TABLE `opentest`.`answers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(150) NULL,
  `is_correct` BINARY NULL,
  `question_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `idf_idx` (`question_id` ASC),
  CONSTRAINT `id_aq`
    FOREIGN KEY (`question_id`)
    REFERENCES `opentest`.`questions` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


  CREATE TABLE `opentest`.`permissions` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `test_id` int(11) DEFAULT NULL,
    `user_id` int(11) DEFAULT NULL,
    `type` varchar(45) DEFAULT NULL,
    PRIMARY KEY (`id`),
    INDEX `idff_idx` (`test_id` ASC),
    CONSTRAINT `id_pt`
      FOREIGN KEY (`test_id`)
      REFERENCES `opentest`.`tests` (`id`)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    INDEX `idfff_idx` (`user_id` ASC),
    CONSTRAINT `id_pu`
      FOREIGN KEY (`user_id`)
      REFERENCES `opentest`.`users` (`id`)
      ON DELETE CASCADE
      ON UPDATE CASCADE
  );