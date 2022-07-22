
 -- -----------------------------------------------------
 -- Database club_sandwich
 -- -----------------------------------------------------
 DROP TABLE IF EXISTS `pages`;
 DROP TABLE IF EXISTS `pageTypes`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `suppliers`;
DROP TABLE IF EXISTS `addresses`; 
DROP TABLE IF EXISTS `newsPages`;
 DROP TABLE IF EXISTS `reservations`;
 DROP TABLE IF EXISTS `items`;
 DROP TABLE IF EXISTS `socialNetworks`;
 DROP TABLE IF EXISTS `newsletterSubscribers`;
DROP TABLE IF EXISTS `openingHours`;
DROP TABLE IF EXISTS `openingDays`;
 DROP TABLE IF EXISTS `newsTypes`;


-- -----------------------------------------------------
 -- Table `pageTypes`
 -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pageTypes` (
   `id` INT NOT NULL PRIMARY KEY,
   `path` VARCHAR(50) NOT NULL,
   `name` VARCHAR(50) NOT NULL,
   `isActive` BOOLEAN NOT NULL DEFAULT 1
 ) ENGINE = InnoDB;
-- -----------------------------------------------------
 -- Table `users`
 -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
   `id` INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
   `firstName` VARCHAR(250) NOT NULL,
   `lastName` VARCHAR(250) NOT NULL,
   `userName` VARCHAR(150) NOT NULL,
   `email` VARCHAR(150) NOT NULL,
   `hashedPassword` VARCHAR(250) NOT NULL,
   `canCreateModify` BOOLEAN NOT NULL,
   `canAlsoDelete` BOOLEAN NOT NULL,
   `createdDate` DATETIME NOT NULL
 ) ENGINE = InnoDB;
-- -----------------------------------------------------
 -- Table `suppliers`
 -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `suppliers` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `name` VARCHAR(100) NULL,
   `location` VARCHAR(150) NULL,
   `logo` VARCHAR(250) NULL
 ) ENGINE = InnoDB;
-- -----------------------------------------------------
 -- Table `adresses`
 -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `addresses` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `address` VARCHAR(150) NOT NULL,
   `city` VARCHAR(150) NOT NULL,
   `zipCode` VARCHAR(50) NOT NULL
 ) ENGINE = InnoDB;
 -- -----------------------------------------------------
 -- Table `newsletterSuscribers`
 -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `newsletterSubscribers` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `email` VARCHAR(250) NOT NULL
 ) ENGINE = InnoDB;
 
-- -----------------------------------------------------
 -- Table `pages`
 -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pages` (
   `id` INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
   `idPageType` INT NULL,
   `title` VARCHAR(150) NULL,
   `subTitle` VARCHAR(150) NULL,
   `author` VARCHAR(150) NULL,
   `mobileTitle` VARCHAR(150) NULL,
   `mobileSubtitle` VARCHAR(150) NULL,
   `recipeTitle` VARCHAR(150) NULL,
   `description` LONGTEXT NULL,
   `image1` VARCHAR(250) NULL,
   `image2` VARCHAR(250) NULL,
   `image3` VARCHAR(250) NULL,
   `backgroundImg` VARCHAR(250) NULL,
   `createdDate` DATETIME NULL,
   `website` VARCHAR(250) NULL,
   `idUser` INT NULL,
   `idSupplier` INT NULL,
   `idAddress` INT NULL,
   `idNewsletterSubscriber` INT NULL,
   CONSTRAINT `fk_pages_pageTypes` FOREIGN KEY (`idPageType`) REFERENCES `pageTypes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_pages_users` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_pages_suppliers` FOREIGN KEY (`idSupplier`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_pages_addresses` FOREIGN KEY (`idAddress`) REFERENCES `addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT `fk_pages_newsletterSubscribers` FOREIGN KEY (`idNewsletterSubscriber`) REFERENCES `newsletterSubscribers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE = InnoDB;
 -- -----------------------------------------------------
 -- Table `typeNews`
 -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `newsTypes` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `name` VARCHAR(150) NOT NULL,
   `pdfFile` VARCHAR(250) NOT NULL
 ) ENGINE = InnoDB;
-- -----------------------------------------------------
 -- Table `newsPage`
 -- -----------------------------------------------------
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
CREATE TABLE IF NOT EXISTS `socialNetworks` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `name` VARCHAR(150) NOT NULL,
   `image` VARCHAR(250) NOT NULL,
   `link` VARCHAR(250) NOT NULL
 ) ENGINE = InnoDB;

-- -----------------------------------------------------
--   Table `openingDays`
--   -----------------------------------------------------
CREATE TABLE `openingDays` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `name` VARCHAR(50) NULL
) ENGINE = InnoDB;
 
-- -----------------------------------------------------
--   Table `openingHours`
--   -----------------------------------------------------
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
   id ,name, path
)
VALUES
( (1),
 ('Home'),
 ('/home')),
((2),
 ('News'),
 ('/news')),
((3),
 ('Club'),
 ('/club')),
((4),
 ('Dealers'),
 ('/dealers')),
((5),
 ('Wall Of Dwich'),
 ('/wallofdwich')),
((6),
 ('Shop'),
 ('/shop')),
((7),
 ('Infos'),
 ('/infos')),
((8),
 ('Bisous'),
 ('/bisous'));
 
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
 (NOW())
 ),
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
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fcheese.png?alt=media&token=27aaa365-16d4-4ad9-a060-a543787c73e9')
 ),
(
 ('La ferme des Acacias'),
 ('Urt'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fcharcut.jpeg?alt=media&token=a4e1c6a4-8e0f-435b-8888-b863fc11599b')
 ),
(
 ('Ona Garia'),
 ('Biarritz'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fbakery.jpeg?alt=media&token=9ac2ffdc-3a59-4c6f-9b3c-18b790a657f0')
 ),
(
 ('L’orangerie'),
 ('Anglet'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fvegetables.jpeg?alt=media&token=3297f2c1-0733-448a-b247-3f6feb39068b')
 ),
 (
 ('Atelier Coquillette'),
 ('Biarritz'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fcoquillette.jpeg?alt=media&token=649bc09a-352c-4265-8169-fca4dc1c4015')
 ),
(
 ('Lots of liquid friends'),
 ('Locals only'),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fdrinks.jpeg?alt=media&token=a4fdf111-2c21-4685-b93f-0708088a7903')
 );
  
 -- -----------------------------------------------------
 -- Table `newsLetterSuscribers`
 -- -----------------------------------------------------
INSERT INTO
 newsletterSubscribers (
   email
 )
VALUES
(
 ('aitor@gmail.com')
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
 ('24 rue d’Espagne'),
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
   author,
   mobileTitle,
   mobileSubtitle,
   recipeTitle,
   description,
   image1,
   image2,
   image3,
   backgroundImg,
   createdDate,
   website,
   idUser,
   idSupplier,
   idAddress,
   idNewsletterSubscriber
 )
VALUES
(
 (3),
 ('Le crew.'),
 ('Avant le club'),
 (''),
 (''),
(''),
(''),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/club%2Fcrew.jpeg?alt=media&token=18cc3970-dd8f-4c21-a8a5-e99e4f862d1b'),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
(
 (3),
 ('Le lieu.'),
 ('Après le crew'),
(''),
(''),
(''),
(''),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/club%2Flieu.jpeg?alt=media&token=0b80dde5-c6c9-4fda-91cf-15a2817042d0'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
(
 (3),
 ('Les dwichs.'),
 ('Sans oublier'),
(''),
(''),
(''),
(''),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/club%2Fdwich.png?alt=media&token=e30e6b62-885e-4c73-9ba2-10c60a9d25e8'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
(
 (3),
 ('Vous.'),
 ('Et avant tout'),
(''),
(''),
(''),
(''),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/club%2Fclient.jpeg?alt=media&token=1c38f0d4-d4a2-4f59-a5c6-bee61b7fffd5'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
(
(1),
('Club sandwich.'),
('Welcome to'),
(''),
(''),
(''),
(''),
('Club sandwich, lieu de vie du quartier Bibi. Un lieu de vie générateur de lien social, promoteur d’un mode de vie responsable dans l’assiette et dans le verre. Un lieu ouvert à tous sans barrière économique ni sociale grâce à une offre différente le midi et le soir. A travers le divertissement et l’engagement, nous souhaitons être un point de rencontre et d’ancrage.'),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/home%2FbgHomeV1.jpeg?alt=media&token=f8d1f445-92ff-48a3-bb0b-dd1dc3d4099d'),
(''),
(''),
(''),
(NOW()),
(''),
(1),
(1),
(1),
(1)
 ),
(
 (4),
 ('CHEESE'),
 ('SAY hello to'),
(''),
(''),
(''),
(''),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fcheese.png?alt=media&token=9f8ef2d3-db66-4bf9-9717-b8b3d628e4eb'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
(
 (4),
 ('CHARCUT'),
 ('Elle te CULBUTE notre'),
(''),
(''),
(''),
(''),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fcharcut.jpeg?alt=media&token=a4e1c6a4-8e0f-435b-8888-b863fc11599b'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (11),
 (1),
(1)
 ),
(
 (4),
 ('LA MIE'),
 ('BIENVENUE'),
(''),
(''),
(''),
(''),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fbakery.jpeg?alt=media&token=9ac2ffdc-3a59-4c6f-9b3c-18b790a657f0'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (21),
 (1),
(1)
 ),
(
 (4),
 ('LA PÊCHE'),
 ('GARDE'),
(''),
(''),
(''),
(''),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fvegetables.jpeg?alt=media&token=3297f2c1-0733-448a-b247-3f6feb39068b'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (31),
 (1),
(1)
 ),
 (
 (4),
 ('D’AMOUR'),
 ('De jolis tissus pleins'),
(''),
(''),
(''),
(''),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fcoquillette.jpeg?alt=media&token=649bc09a-352c-4265-8169-fca4dc1c4015'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (41),
 (1),
(1)
 ),
(
 (4),
 ('LIQUIDE'),
 ('TOUT n’est que'),
(''),
(''),
(''),
(''),
 (''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/dealers%2Fdrinks.jpeg?alt=media&token=a4fdf111-2c21-4685-b93f-0708088a7903'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (51),
 (1),
(1)
 ), 
(
 (7),
 ('Dans la vie, il y aura toujours un pdf pour t’aiguiller.'),
 ('Balance les infos en pdf'),
(''),
(''),
(''),
(''),
 ('Que veux-tu savoir ?'),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/club%2Fcrew.png?alt=media&token=f27b6dae-b04c-4992-99af-437a0d3eb07e'),
 (''),
 (''),
 (''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
 (
 (5),
 (''),
 (''),
 ('Momeoner'),
 (''),
(''),
('Mode Turbo Club Sandwich'),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/wallOfDwich%2Fturbochef.jpg?alt=media&token=387c8e6a-7f03-4d12-a87e-88bfc83e4a39'),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
  (
 (5),
 (''),
 (''),
 ('Momeoner'),
 (''),
(''),
('Turbo Dwich'),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/wallOfDwich%2Fturbofood2.jpg?alt=media&token=babca2d0-df2e-440e-a593-5d779c8b6717'),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
  (
 (5),
 (''),
 (''),
 ('Momeoner'),
 (''),
(''),
('Turbo Meal'),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/wallOfDwich%2Fturbofood1.jpg?alt=media&token=7394559f-81b6-4fdb-a5b6-77dc88f732cc'),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
 (
 (5),
 (''),
 (''),
 ('Cantine Milagro'),
 (''),
(''),
(''),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/wallOfDwich%2Fpics12.jpg?alt=media&token=dcf0f5bb-4dbd-410d-9893-125ef161c4cc'),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
 (
 (5),
 (''),
 (''),
 ('Cantine Milagro'),
 (''),
(''),
(''),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/wallOfDwich%2Fpics30.jpg?alt=media&token=e5db20d4-5833-43f4-86ea-167e5cb7a6bd'),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
 (
 (5),
 (''),
 (''),
 ('Cantine Milagro'),
 (''),
(''),
(''),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/wallOfDwich%2Fpics31.jpg?alt=media&token=0e4feece-3b99-479d-9c77-71f6dfd1567c'),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
 (
 (5),
 (''),
 (''),
 ('Cantine Milagro'),
 (''),
(''),
(''),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/wallOfDwich%2Fabricots.jpg?alt=media&token=ae771098-bd96-48d1-872e-1f4e6ede9ccd'),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
 (
 (5),
 (''),
 (''),
 ('Cantine Milagro'),
 (''),
(''),
(''),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/wallOfDwich%2Fpics29.jpg?alt=media&token=50eef6bf-d3a2-4cef-8d25-97735057b042'),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
 (
 (5),
 (''),
 (''),
 ('Cantine Milagro'),
 (''),
(''),
(''),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/wallOfDwich%2Fpics2.jpg?alt=media&token=b9254bb6-2dca-4787-9620-abd7fb26ae4d'),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
 (
 (5),
 (''),
 (''),
 ('Cantine Milagro'),
 (''),
(''),
(''),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/wallOfDwich%2Fpics3.jpg?alt=media&token=56cd7dce-5d35-4a1c-8a1b-08683d6bcfae'),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
 (
 (5),
 (''),
 (''),
 ('Cantine Milagro'),
 (''),
(''),
(''),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/wallOfDwich%2Ftomatoes.jpg?alt=media&token=400591b6-976b-4d8a-8ab7-0b460d5fbe01'),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
 (
 (5),
 (''),
 (''),
 ('Cantine Milagro'),
 (''),
(''),
(''),
(''),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/wallOfDwich%2Fpics28.jpg?alt=media&token=e9a73332-b82d-4eba-b372-85a02baa7f61'),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
 (1),
 (1),
(1)
 ),
(
 (8),
 ('Rigoler, le bon son, bien manger, boire ET VOUS.'),
 ('On aime,'),
 (''),
 (''),
(''),
(''),
('Club Sandwich, un connecteur, liant entre l’océan, la musique, les gens et les bonnes choses de la vie.
Nous sommes une équipe de passionné.e.s et d’ami.e.s : Anne, Margaux, Florence, Fanny, et Elsa. Merci pour votre joie, bonne humeur et énergie au quotidien.
On a failli vous oublier mais finalement on gardait le meilleur pour la fin : MERCI À VOUS, nos petits rayons de soleil quotidiens.'),
(''),
(''),
(''),
(''),
 (NOW()),
 (''),
 (1),
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
 ('Dimims du Club Sandwich'),
 ('Kitchen'),
 ('Dimanche 17 juillet 2022 - 10h30 / 16h'),
 ('Brunch Mimosa Lovers. Des mim’s dans l’assiette et dans le verre.'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/news%2Fdimims%2FDimims.jpeg?alt=media&token=ac7557b5-38dc-4bc3-bf08-3bc2131e3a6e'),
 (1)
 ),
 (
 ('Mood'),
 ('Kitchen'),
 ('Du 22 au 23 Juillet 2022'),
 ('Avec Apolline et Claire, pour une session food chaleureuse, colorée et remplie de bonne humeur.'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/news%2FmoodCafe%2Fmood.jpg?alt=media&token=22cc06d9-50d3-4bd4-9bd3-354521b79ca6'),
 (1)
 ),
  (
 ('Théo Cano'),
 ('Kitchen'),
 ('Du 4 au 6 août 2022.'),
 ('Fondateur et chef cuisinier chez Casa a Barca. Théo sera de la partie sur ce premier week-end d’août. See you all there!'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/news%2FtheoCano%2Ftheocano.png?alt=media&token=329fddbb-6799-4da8-8b51-e1f2e94f47ee'),
 (1)
 ),
(
 ('Le Bon Jaja'),
 ('Kitchen'),
 ('Du 25 au 27 août 2022.'),
 ('Mais qu’est ce donc le Bon Jaja ? Un bar à vins ? Un caviste ? Un bistrot ? Et bah tout ça à la fois m’sieurs dames. On y achète son vin à emporter, on y dîne d’une carte régressive faisant la part belle aux produits de saison travaillés à basse température, on y prend l’apéritif au comptoir ou en terrasse, et tout ça fait pas mal de rencontres sans parler des salons de vignerons régulièrement organisés.  On a hâte de venir chez Club Sandwich, on espère vous y retrouver également pour du fun, du vin, de la musique et de la belle food.'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/news%2FleBonJaja%2Fbonjaja.jpeg?alt=media&token=3ed4ebce-7d3e-4105-8b16-5be4ebf363b2'),
 (1)
 ),
(
 ('Turbo Club Sandwich'),
 ('Kitchen'),
 ('Du 7 au 9 juillet 2022.'),
 ('Turbo Club. Join the team avec @momeoner aux fourneaux. On espère que vos papilles sont prêtes pour la fête.'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/news%2FclubTurbo%2FturboDisplay.jpg?alt=media&token=8a9197db-19fe-4b9a-b4a6-db483d17ff3b'),
 (1)
 ),
 (
 ('Cantine Milagro'),
 ('Kitchen'),
 ('Du 24 au 25 juin 2022.'),
 ('Salade de tomates anciennes, cerises, poudre de pain au romarin et fleur de tagette, voilà un aperçu de ce qui vous attend chez Club Sandwich ce week-end. On s’y retrouve ?'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/news%2FcantineMilagro%2Fmilagro.jpg?alt=media&token=f7cd75e1-1907-456d-bfcc-130b5b0bbf35'),
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
 ('T-Shirt'),
 ('100% douceur'),
 ('Un peu de douceur, en veux-tu en voilà. Porté par les plus grands chef.ffe.s, il ravivera ton joli teint pour toutes les saisons. Rejoins dès maintenant le Club'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/shop%2FtshirtFront.png?alt=media&token=55a9b246-846a-43b5-829f-2c0550cc2cf8'),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/shop%2FtshirtBack.png?alt=media&token=e7a842c1-731a-49ae-88a2-0770405c2bc4'),
 (1)
 ),
 (
 ('Sweat Shirt'),
 ('100% chaleur'),
 ('Pour te caliner les soirs, apporter un zeste de douceur dans un océan de chaleur. Le vert dans nos assiettes se retrouve aussi sur ta tête, tu es magnifique, sache le.'),
 ('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/shop%2FpullFront.png?alt=media&token=536b650e-fc65-4833-a4f3-fe4353a53b4c'),
('https://firebasestorage.googleapis.com/v0/b/club-sandwich-86c01.appspot.com/o/shop%2FpullBack.png?alt=media&token=340899cc-1d05-48bc-bc92-dc6e94daa680'),
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
--   Table `openingDays`
--   -----------------------------------------------------
INSERT INTO
 openingDays (
   name
 )
VALUES
(
 ('MAR-JEU')
 ),
 (
 ('VEN-SAM')
 ),
 (
 ('DIM')
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
 ('11:00'),
 ('-15:00'),
 ('18:00'),
 ('-23:00')
 ),
 (
 (11),
 ('11:00'),
 ('-15:00'),
 ('18:00'),
 ('-00:00')
 ),
 (
 (21),
 ('11:00'),
 ('-14:00'),
(''),
('')
 );