-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `final_project` DEFAULT CHARACTER SET utf8 ;
USE `final_project` ;

-- -----------------------------------------------------
-- Table `mydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_project`.`employee` (
  `employee_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `start_date` DATETIME NOT NULL,
  `position_held` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_id`));


-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_project`.`customer` (
  `customer_id` BIGINT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`));


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_project`.`product` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(255) NOT NULL,
  `price_per_one` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `mydb`.`purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_project`.`purchases` (
  `purchase_id` BIGINT NOT NULL,
  `customer_id` BIGINT NOT NULL,
  `employee_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`purchase_id`),
  INDEX `customer_idx` (`customer_id` ASC) VISIBLE,
  INDEX `employee_idx` (`employee_id` ASC) VISIBLE,
  INDEX `product_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `employee`
    FOREIGN KEY (`employee_id`)
    REFERENCES `mydb`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    

    