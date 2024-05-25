-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cat_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cat_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cat_store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cat_store` ;

-- -----------------------------------------------------
-- Table `cat_store`.`failed_jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cat_store`.`failed_jobs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(255) NOT NULL,
  `connection` TEXT NOT NULL,
  `queue` TEXT NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `exception` LONGTEXT NOT NULL,
  `failed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `failed_jobs_uuid_unique` (`uuid` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cat_store`.`migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cat_store`.`migrations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) NOT NULL,
  `batch` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cat_store`.`password_resets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cat_store`.`password_resets` (
  `email` VARCHAR(255) NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  INDEX `password_resets_email_index` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cat_store`.`personal_access_tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cat_store`.`personal_access_tokens` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` VARCHAR(255) NOT NULL,
  `tokenable_id` BIGINT UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `token` VARCHAR(64) NOT NULL,
  `abilities` TEXT NULL DEFAULT NULL,
  `last_used_at` TIMESTAMP NULL DEFAULT NULL,
  `expires_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `personal_access_tokens_token_unique` (`token` ASC) VISIBLE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type` ASC, `tokenable_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cat_store`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cat_store`.`role` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(225) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cat_store`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cat_store`.`users` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `remember_token` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `role_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `users_email_unique` (`email` ASC) VISIBLE,
  INDEX `fk_users_role_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_role`
    FOREIGN KEY (`role_id`)
    REFERENCES `cat_store`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `cat_store`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cat_store`.`categories` (
  `id` BIGINT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cat_store`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cat_store`.`products` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` BIGINT NOT NULL,
  `status` TINYINT NOT NULL,
  `description` VARCHAR(255) NULL,
  `categories_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_categories1_idx` (`categories_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `cat_store`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cat_store`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cat_store`.`orders` (
  `id` BIGINT NOT NULL,
  `phone` VARCHAR(10) NULL,
  `address` VARCHAR(225) NULL,
  `total` VARCHAR(45) NULL,
  `users_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `cat_store`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cat_store`.`products_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cat_store`.`products_orders` (
  `products_id` BIGINT NOT NULL,
  `orders_id` BIGINT NOT NULL,
  INDEX `fk_product_order_products1_idx` (`products_id` ASC) VISIBLE,
  INDEX `fk_product_order_orders1_idx` (`orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_order_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `cat_store`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_order_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `cat_store`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
