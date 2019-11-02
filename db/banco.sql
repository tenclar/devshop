-- MySQL Script generated by MySQL Workbench
-- Sat May 25 14:43:16 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema devshop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema devshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `devshop` DEFAULT CHARACTER SET utf8 ;
USE `devshop` ;

-- -----------------------------------------------------
-- Table `devshop`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(245) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `devshop`.`product_variations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`product_variations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(245) NULL,
  `avaliable` INT NULL,
  `variation_name` VARCHAR(245) NULL,
  `price` FLOAT NULL,
  `price_from` FLOAT NULL,
  `weight` INT NULL,
  `ordere` INT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_variations_products_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_variations_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `devshop`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `devshop`.`product_images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`product_images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(245) NULL,
  `url` VARCHAR(245) NULL,
  `order` INT NULL,
  `product_variation_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_images_product_variations1_idx` (`product_variation_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_images_product_variations1`
    FOREIGN KEY (`product_variation_id`)
    REFERENCES `devshop`.`product_variations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `devshop`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(245) NULL,
  `description` TEXT NULL,
  `category_dad` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `devshop`.`categories_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`categories_products` (
  `category_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `product_id`),
  INDEX `fk_categories_has_products_products1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_categories_has_products_categories1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_categories_has_products_categories1`
    FOREIGN KEY (`category_id`)
    REFERENCES `devshop`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categories_has_products_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `devshop`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `devshop`.`banner_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`banner_types` (
  `id` INT NOT NULL,
  `banner_type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `devshop`.`banners`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`banners` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(245) NULL,
  `url` TEXT NULL,
  `order` INT NULL,
  `image_url` VARCHAR(245) NULL,
  `banner_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_banners_banner_types1_idx` (`banner_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_banners_banner_types1`
    FOREIGN KEY (`banner_type_id`)
    REFERENCES `devshop`.`banner_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;