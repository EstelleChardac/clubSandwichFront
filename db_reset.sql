-- -----------------------------------------------------
 -- Database club_sandwich
 -- -----------------------------------------------------
DROP DATABASE IF EXISTS `club_sandwich`;
CREATE DATABASE IF NOT EXISTS `club_sandwich` DEFAULT CHARACTER SET utf8;
USE `club_sandwich`;
 
-- -----------------------------------------------------
 -- Table `pageTypes`
 -- -----------------------------------------------------
DROP TABLE IF EXISTS `pageTypes`;
CREATE TABLE IF NOT EXISTS `pageTypes` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `name` VARCHAR(50) NULL
 ) ENGINE = InnoDB;
-- -----------------------------------------------------
 -- Table `users`
 -- -----------------------------------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
   `id` INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
   `firstName` VARCHAR(250) NOT NULL,
   `lastName` VARCHAR(250) NOT NULL,
   `userName` VARCHAR(150) NOT NULL,
   `email` VARCHAR(150) NOT NULL,
   `hashedPassword` VARCHAR(250) NOT NULL,
   `canCreateModify` BOOLEAN NOT NULL,
   `canAlsoDelete` BOOLEAN NOT NULL,
   `createdDate` DATE NOT NULL
 ) ENGINE = InnoDB;
-- -----------------------------------------------------
 -- Table `suppliers`
 -- -----------------------------------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `name` VARCHAR(100) NULL,
   `location` VARCHAR(150) NULL,
   `logo` VARCHAR(250) NULL
 ) ENGINE = InnoDB;
-- -----------------------------------------------------
 -- Table `adresses`
 -- -----------------------------------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `address` VARCHAR(150) NOT NULL,
   `city` VARCHAR(150) NOT NULL,
   `zipCode` VARCHAR(50) NOT NULL
 ) ENGINE = InnoDB;
-- -----------------------------------------------------
 -- Table `pages`
 -- -----------------------------------------------------
 DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
   `id` INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
   `idPageType` INT NULL,
   `title` VARCHAR(150) NULL,
   `subTitle` VARCHAR(150) NULL,
   `description` LONGTEXT NULL,
   `image1` VARCHAR(250) NULL,
   `image2` VARCHAR(250) NULL,
   `image3` VARCHAR(250) NULL,
   `backgroundImg` VARCHAR(250) NULL,
   `createdDate` date NULL,
   `website` VARCHAR(250) NULL,
   `idUser` INT NULL,
   `idSupplier` INT NULL,
   `idAddress` INT NULL,
   CONSTRAINT `fk_pages_pageTypes` FOREIGN KEY (`idPageType`) REFERENCES `pageTypes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_pages_users` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_pages_suppliers` FOREIGN KEY (`idSupplier`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_pages_addresses` FOREIGN KEY (`idAddress`) REFERENCES `addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE = InnoDB;
 -- -----------------------------------------------------
 -- Table `typeNews`
 -- -----------------------------------------------------
 DROP TABLE IF EXISTS `newsTypes`;
CREATE TABLE IF NOT EXISTS `newsTypes` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `name` VARCHAR(150) NOT NULL,
   `pdfFile` VARCHAR(250) NOT NULL
 ) ENGINE = InnoDB;
-- -----------------------------------------------------
 -- Table `newsPage`
 -- -----------------------------------------------------
 DROP TABLE IF EXISTS `newsPages`;
CREATE TABLE IF NOT EXISTS `newsPages` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `title` VARCHAR(150) NOT NULL,
   `subTitle` VARCHAR(150) NOT NULL,
   `durationEvent` VARCHAR(250) NULL,
   `description` LONGTEXT NOT NULL,
   `image` VARCHAR(250) NOT NULL,
   `idNewsType` INT NOT NULL,
   CONSTRAINT `fk_newsPage_newsTypes` FOREIGN KEY (`idNewsType`) REFERENCES `newsTypes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE = InnoDB;
-- -----------------------------------------------------
 -- Table `reservations`
 -- -----------------------------------------------------
 DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `idNewsType` INT NOT NULL,
   `name` VARCHAR(150) NULL,
   `email` VARCHAR(150) NULL,
   CONSTRAINT `fk_reservations_newsTypes` FOREIGN KEY (`idNewsType`) REFERENCES `newsTypes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE = InnoDB;
-- -----------------------------------------------------
 -- Table `items`
 -- -----------------------------------------------------
 DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `title` VARCHAR(150) NOT NULL,
   `subTitle` VARCHAR(250) NOT NULL,
   `description` LONGTEXT NOT NULL,
   `image1` VARCHAR(255) NOT NULL,
   `image2` VARCHAR(255) NULL,
   `available` BOOLEAN NOT NULL
 ) ENGINE = InnoDB;
-- -----------------------------------------------------
 -- Table `socialNetworks`
 -- -----------------------------------------------------
 DROP TABLE IF EXISTS `socialNetworks`;
CREATE TABLE IF NOT EXISTS `socialNetworks` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `name` VARCHAR(150) NOT NULL,
   `image` VARCHAR(250) NOT NULL,
   `link` VARCHAR(250) NOT NULL
 ) ENGINE = InnoDB;
 -- -----------------------------------------------------
 -- Table `newsletterSuscribers`
 -- -----------------------------------------------------
 DROP TABLE IF EXISTS `newsletterSubscribers`;
CREATE TABLE IF NOT EXISTS `newsletterSubscribers` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `firstName` VARCHAR(250) NOT NULL,
   `email` VARCHAR(250) NOT NULL
 ) ENGINE = InnoDB;
 
-- -----------------------------------------------------
--   Table `openingDays`
--   -----------------------------------------------------
DROP TABLE IF EXISTS `openingDays`;
CREATE TABLE `openingDays` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `name` VARCHAR(50) NULL
) ENGINE = InnoDB;
 
-- -----------------------------------------------------
--   Table `openingHours`
--   -----------------------------------------------------
DROP TABLE IF EXISTS `openingHours`;
CREATE TABLE IF NOT EXISTS `openingHours` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `idOpeningDay` INT NOT NULL,
   `startMorning` VARCHAR(150) NOT NULL,
   `endMorning` VARCHAR(150) NOT NULL,
   `startAfternoon` VARCHAR(150) NOT NULL,
   `endAfternoon` VARCHAR(150) NOT NULL,
   CONSTRAINT `fk_openingHours_openingDays` FOREIGN KEY (`idOpeningDay`) REFERENCES `openingDays`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE = InnoDB;
 
 


-- -----------------------------------------------------
 -- INSERT INTO TABLES
 -- -----------------------------------------------------
 
 
 
 
-- -----------------------------------------------------
 -- Table `typePages`
 -- -----------------------------------------------------
INSERT INTO
 pageTypes (
   name
 )
VALUES
 (
   'Home'
 ),
 (
   'News'
 )
,
 (
   'Club'
 ),
 (
   'Dealers'
 ),
 (
   'Wall Of Dwich'
 ),
 (
   'Shop'
 ),
 (
   'Infos'
 ),
 (
   'Bisous'
 );

 
-- -----------------------------------------------------
 -- Table `users`
 -- -----------------------------------------------------
INSERT INTO
 users (
   firstName,
   lastName,
   userName,
   email,
   hashedPassword,
   canCreateModify,
   canAlsoDelete,
   createdDate
 )
VALUES
(
 ('Aitor'),
 ('Jurquet'),
 ('superAdmin'),
 ('email'),
 ('nimdArepus'),
 (0),
 (0),
 (20181010)),
 (
 ('Geoffrey'),
 ('Emerit'),
 ('megaAdmin'),
 ('email2'),
 ('nimdAagem'),
 (1),
 (0),
 (NOW())
);
 
-- -----------------------------------------------------
 -- Table `suppliers`
 -- -----------------------------------------------------
 INSERT INTO
 suppliers (
   name,
   location,
   logo
 )
VALUES
(
 ('AuPetit Family'),
 ('Biarritz'),
 ('')
 ),
(
 ('La ferme des Acacias'),
 ('Urt'),
 ('')
 ),
(
 ('Ona Garia'),
 ('Biarritz'),
 ('')
 ),
(
 ('L’orangerie'),
 ('Anglet'),
 ('')
 ),
(
 ('Beaucoup d’amis'),
 ('locaux'),
 ('')
 );
 
-- -----------------------------------------------------
 -- Table `addresses`
 -- -----------------------------------------------------
INSERT INTO
 addresses (
   address,
   city,
   zipCode
 )
VALUES
(
 ('4 Rue Alberto'),
 ('Biarritz'),
 (64200)
 );
 
 -- -----------------------------------------------------
 -- Table `pages`
 -- -----------------------------------------------------
INSERT INTO
 pages (
   idPageType,
   title,
   subTitle,
   description,
   image1,
   image2,
   image3,
   backgroundImg,
   createdDate,
   website,
   idUser,
   idSupplier,
   idAddress
 )
VALUES
(
 (3),
 ('Le crew.'),
 ('Avant le club'),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/club%2Fcrew.png?alt=media&token=f27b6dae-b04c-4992-99af-437a0d3eb07e'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1)
 ),
(
 (3),
 ('Le lieu.'),
 ('Après le crew'),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/club%2Flieu.png?alt=media&token=5c35a79c-b7ab-4aad-a4a4-8169f7d31135'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1)
 ),
(
 (3),
 ('Les dwichs.'),
 ('Sans oublier'),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/club%2Fdwich.png?alt=media&token=e30e6b62-885e-4c73-9ba2-10c60a9d25e8'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1)
 ),
(
 (3),
 ('Vous.'),
 ('Et avant tout'),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/club%2Fclient.png?alt=media&token=dc985ce3-c83d-45d2-821b-8f29d628e8b9'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1)
 ),
(
(1),
('Club sandwich.'),
('Welcome to the'),
('Club sandwich, lieu de vie du quartier Bibi. Un lieu de vie générateur de lien social, promoteur d’un mode de vie responsable dans l’assiette et dans le verre. Un lieu ouvert à tous sans barrière économique ni sociale grâce à une offre différente le midi et le soir. A travers le divertissement et l’engagement, nous souhaitons être un point de rencontre et d’ancrage.'),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/home%2FbgHomeV1.jpeg?alt=media&token=f8d1f445-92ff-48a3-bb0b-dd1dc3d4099d'),
(''),
(''),
(''),
(NOW()),
(''),
(1),
(1),
(1)
 ),
(
 (4),
 ('CHEESE'),
 ('SAY hello to'),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fcheese.png?alt=media&token=27aaa365-16d4-4ad9-a060-a543787c73e9'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1)
 ),
(
 (4),
 ('CHARCUT'),
 ('Elle te CULBUTE notre'),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fcharcut.png?alt=media&token=19dfbf41-ef04-4ee4-a555-7d9e44a7c553'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1)
 ),
(
 (4),
 ('LA MIE'),
 ('BIENVENUE'),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fbakery.png?alt=media&token=6b0da702-b0fb-4740-b793-8bb283b29c2a'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1)
 ),
(
 (4),
 ('LA PÊCHE'),
 ('GARDE'),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fvegetables.png?alt=media&token=4d996b75-488a-46e3-bed6-35b7a842dd99'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1)
 ),
(
 (4),
 ('LIQUIDE'),
 ('TOUT n’est que'),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fdrinks.png?alt=media&token=d3498aac-489b-4473-ab51-2f30a24954f9'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1)
 ), 
(
 (7),
 ('Dans la vie, il y aura toujours un pdf pour t’aiguiller.'),
 ('Balance les infos en pdf'),
 ('Que veux-tu savoir ?'),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/club%2Fcrew.png?alt=media&token=f27b6dae-b04c-4992-99af-437a0d3eb07e'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1)
 );

 
 -- -----------------------------------------------------
 -- Table `typeNews`
 -- -----------------------------------------------------
INSERT INTO
 newsTypes (
   name,
   pdfFile
 )
VALUES
(
 ('Kitchen'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/infos%2FQG_resume_june22.pdf?alt=media&token=eb837ea6-2eb0-42e0-9372-44265d3b0247')
 ),
 (
 ('Music'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/infos%2FQG_resume_june22.pdf?alt=media&token=eb837ea6-2eb0-42e0-9372-44265d3b0247')
 ),
 (
 ('All'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/infos%2FQG_resume_june22.pdf?alt=media&token=eb837ea6-2eb0-42e0-9372-44265d3b0247')
 );
 
-- -----------------------------------------------------
 -- Table `newsPages`
 -- -----------------------------------------------------
INSERT INTO
 newsPages (
   title,
   subTitle,
   durationEvent,
   description,
   image,
   idNewsType
 )
VALUES
(
 ('Philipe Etchebest'),
 ('Kitchen'),
 ('Du 1er Juin au 18 Juillet 2022.'),
 ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada orci a elementum laoreet. Cras consequat eu augue eu elementum. 
Duis dictum ligula cursus est commodo, nec rhoncus libero hendrerit. Mauris convallis est orci, mattis malesuada purus pretium eu. Vivamus sit amet dictum nisi. Praesent malesuada, nulla sed cursus pharetra, quam eros eleifend urna, non consectetur nibh lorem at nibh.'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/news%2FnewsEtchebest.png?alt=media&token=b39ee3c5-eaf4-4e90-8528-d300a474e9ec'),
 (1)
 ),
 
(
 ('Paul Bocuze'),
 ('Music'),
 ('Du 1er Juin au 18 Juillet 2022.'),
 ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada orci a elementum laoreet. Cras consequat eu augue eu elementum. Duis dictum ligula cursus est commodo, nec rhoncus libero hendrerit. Mauris convallis est orci, mattis malesuada purus pretium eu. Vivamus sit amet dictum nisi. Praesent malesuada, nulla sed cursus pharetra, quam eros eleifend urna, non consectetur nibh lorem at nibh.'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/news%2Fchef1.jpeg?alt=media&token=33c0b68d-da10-4162-b635-a9ca5eb0cb8e'),
 (1)
 );
 
-- -----------------------------------------------------
 -- Table `reservations`
 -- -----------------------------------------------------
INSERT INTO
 reservations (
   idNewsType,
   name,
   email
 )
VALUES
(
 (1),
 ('Quentin'),
 ('quentin@gmail.com')
 );
 
-- -----------------------------------------------------
 -- Table `items`
 -- -----------------------------------------------------
INSERT INTO
 items (
   title,
   subTitle,
   description,
   image1,
   image2,
   available
 )
VALUES
(
 ('T Shirt'),
 ('100% coton'),
 ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada orci a elementum laoreet. Cras consequat eu augue eu elementum. Duis dictum ligula cursus est commodo, nec rhoncus libero hendrerit. Mauris convallis est orci, mattis malesuada purus pretium eu. Vivamus sit amet dictum nisi. Praesent malesuada, nulla sed cursus pharetra, quam eros eleifend urna, non consectetur nibh lorem at nibh.'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/shop%2FtshirtFront.png?alt=media&token=55a9b246-846a-43b5-829f-2c0550cc2cf8'),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/shop%2FtshirtBack.png?alt=media&token=e7a842c1-731a-49ae-88a2-0770405c2bc4'),
 (1)
 );
 
-- -----------------------------------------------------
 -- Table `socialNetworks`
 -- -----------------------------------------------------
INSERT INTO
 socialNetworks (
   name,
   image,
   link
 )
VALUES
(
 ('facebook'),
 ('https://www.stickees.com/files/emoticons/keriyo-emoticons/258-smoking.png'),
 ('www.facebook.com')
 );
 
 -- -----------------------------------------------------
 -- Table `newsLetterSuscribers`
 -- -----------------------------------------------------
INSERT INTO
 newsletterSubscribers (
   firstName,
   email
 )
VALUES
(
 ('Aitor'),
 ('aitor@gmail.com')
 );
 
-- -----------------------------------------------------
--   Table `openingDays`
--   -----------------------------------------------------
INSERT INTO
 openingDays (
   name
 )
VALUES
(
 ('Dimanche')
 );
 
-- -----------------------------------------------------
--   Table `openingHours`
--   -----------------------------------------------------
INSERT INTO
 openingHours (
   idOpeningDay,
   startMorning,
   endMorning,
   startAfternoon,
   endAfternoon
 )
VALUES
(
 (1),
 ('8h'),
 ('11h'),
 ('14h'),
 ('23h')
 );











