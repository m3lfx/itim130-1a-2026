-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_itim130-1a
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_itim130-1a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_itim130-1a` DEFAULT CHARACTER SET utf8 ;
USE `db_itim130-1a` ;

-- -----------------------------------------------------
-- Table `db_itim130-1a`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_itim130-1a`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(20) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_itim130-1a`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_itim130-1a`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `date_ordered` DATE NOT NULL,
  `date_delivered` DATE NULL,
  `status` ENUM('processing', 'delivered', 'canceled') NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_orders_customers_idx` (`customer_id`),
  CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `db_itim130-1a`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_itim130-1a`.`brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_itim130-1a`.`brands` (
  `brand_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`brand_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_itim130-1a`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_itim130-1a`.`items` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NULL,
  `quantity` INT NULL,
  `brand_id` INT NOT NULL,
  PRIMARY KEY (`item_id`),
  INDEX `fk_items_brands1_idx` (`brand_id`),
  CONSTRAINT `fk_items_brands1`
    FOREIGN KEY (`brand_id`)
    REFERENCES `db_itim130-1a`.`brands` (`brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_itim130-1a`.`item_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_itim130-1a`.`item_order` (
  `item_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `quantity` SMALLINT(3) NOT NULL,
  INDEX `fk_items_has_orders_orders1_idx` (`order_id` ) ,
  INDEX `fk_items_has_orders_items1_idx` (`item_id` ) ,
  PRIMARY KEY (`item_id`, `order_id`),
  CONSTRAINT `fk_items_has_orders_items1`
    FOREIGN KEY (`item_id`)
    REFERENCES `db_itim130-1a`.`items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_has_orders_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `db_itim130-1a`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
