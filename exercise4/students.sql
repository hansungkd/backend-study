CREATE TABLE `students` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `admission_year` INT NOT NULL,
    `major` INT NOT NULL,
    `individual_number` INT NOT NULL,
    `phone_number` VARCHAR(15) NOT NULL,
    `address` VARCHAR(100) NOT NULL,
    `credit_earned` INT NOT NULL DEFAULT 0,
    `GPA` DECIMAL NOT NULL DEFAULT 0.0,
    `is_attending` TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;