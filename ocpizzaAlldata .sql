-- data-db.sql

INSERT INTO `ocpizza`.`address`(`label`,`name`,`line1`,`line2`,`zip`,`city`)VALUES
("numéro1","Client Un","1, rue d'ici","maison",01000,"Paris"),
("numéro2","Client Deux","2, avenue de là","maisonnette",02000,"Torcy"),
("numéro3","Client Trois","3, allée de là","maison",03000,"Marseille"),
("numéro4","Client Quatre","4, boulevard de la sagesse","golf",04000,"Avignon"),
("numéro5","Client Cinq","5, rue des cométes","3ème étage",05000,"Lyon"),
("numéro6","Client Six","6, allée des rossignols","",06000,"Nice"),
("numéro7","Client Sept","7, avenue de la liberté","batiment A",07000,"Brest"),
("numéro8","Agent A","8, rue fleurie","",08000,"Bordeau"),
("numéro9","Agent B","9, place de la mairie","",09000,"Provin"),
("numéro10","Agent C","10, rue de la dame","",10000,"Troyes"),
("numéro11","Agent D","11, rue plaisance","",11000,"Carcassonne"),
("numéro12","Restau Roma","12, allée de la forêt","restaurant",12000,"Logne"),
("numéro13","Restau ciciliano","13, av st jacques","restaurant",13000,"Toulon"),
("numéro14","Restau Milano","14, avenue de geole","restaurant",14000,"Toulouse"),
("numéro15","Restau Luigi","15, bld de l'hôtel de ville","restaurant",15000,"Nante");

INSERT INTO `ocpizza`.`ingredient`(`label`,`unit`)VALUES
("bœuf","g"),
("champigon","g"),
("emmental","g"),
("jambon","g"),
("mozzarella","g"),
("œuf","unité"),
("oignon","g"),
("parmesan","g"),
("olive","g"),
("origan","g"),
("pate","g"),
("poivrons","g"),
("tomate","g");

INSERT INTO `ocpizza`.`payment_method`(`label`)VALUES
("paypal");

INSERT INTO `ocpizza`.`pizza`(`name`,`unit_price_ex_tax`,`tax_rate100`)VALUES
("calzone",6.50,5.50),
("caprese",7.00,5.50),
("margarita",7.50,5.50),
("pino",8.00,5.50),
("reine",8.50,5.50),
("sorrentina",8.00,5.50);

INSERT INTO `ocpizza`.`phone`(`number`)VALUES
("0102030401"),
("0102030402"),
("0102030403"),
("0102030404"),
("0102030405"),
("0102030406"),
("0102030407"),
("0102030408"),
("0102030409"),
("0102030410"),
("0102030411"),
("0102030412");

INSERT INTO `ocpizza`.`restaurant`(`address_id`,`name`,`phone_id`)VALUES
(12,"Roma",6),
(13,"Ciciliano",7),
(14,"Milano",8);

INSERT INTO `ocpizza`.`client`(`billing_address_id`,`delivery_address_id`,`phone_id`,`1st_name`,`name`,`mail`,`login`,`password_sha2bin`)VALUES
(1,1,1,"Client","Un","un@mail.fr","numberone",UNHEX(SHA2('passone',256))),
(2,3,2,"Client","Deux","deux@mail.fr","numbertwo",UNHEX(SHA2('passtwo',256))),
(4,5,3,"Client","Quatre","quatre@mail.fr","numberfour",UNHEX(SHA2('passfour',256))),
(6,6,4,"Client","Six","six@mail.fr","numbersix",UNHEX(SHA2('passsix',256))),
(7,7,5,"Client","Sept","sept@mail.fr","numberseven",UNHEX(SHA2('passseven',256)));

INSERT INTO `ocpizza`.`employee`(`address_id`,`phone_id`,`1st_name`,`name`,`mail`,`login`,`password_sha2bin`)VALUES
(8,9,"Agent","A","A@mail.fr","letterA",UNHEX(SHA2('passA',256))),
(9,10,"Agent","B","B@mail.fr","letterB",UNHEX(SHA2('passB',256))),
(10,11,"Agent","C","C@mail.fr","letterC",UNHEX(SHA2('passC',256))),
(11,12,"Agent","D","D@mail.fr","letterD",UNHEX(SHA2('passD',256)));

INSERT INTO `ocpizza`.`composition`(`pizza_id`,`ingredient_id`,`quantity`)VALUES
(1,11,60),
(1,4,70),
(1,3,40),
(1,2,70),
(2,11,60),
(2,7,40),
(2,6,1),
(2,5,40),
(3,11,60),
(3,10,60),
(3,9,70),
(3,8,50),
(4,13,60),
(4,12,70),
(4,11,60),
(4,1,40),
(5,11,60),
(5,4,50),
(5,3,60),
(5,2,50),
(6,11,60),
(6,7,1),
(6,6,1),
(6,5,50);

INSERT INTO `ocpizza`.`basket`(`employee_id`,`client_id`,`restaurant_id`,`invoice_num`,`date`,`status`)VALUES
(4,1,2,"18000001","2021-01-29 11:11:11","archive"),
(2,2,1,"18000002","2021-01-30 10:10:10","archive"),
(3,3,1,"18000003","2021-01-31 09:09:09","cancel"),
(4,1,2,"18000004","2021-02-01 05:05:05","deliver"),
(1,5,3,"18000005","2021-02-01 06:06:06","deliver"),
(2,4,1,"18000006","2021-02-01 08:08:08","draft");

INSERT INTO `ocpizza`.`line_basket`(`basket_id`,`pizza_id`,`quantity`,`tax_rate100`,`unit_price_ex_tax`)VALUES
(1,5,2,5.5,8.50),
(1,6,2,5.5,8.00),
(2,5,1,5.5,8.50),
(3,1,3,5.5,6.50),
(4,2,1,5.5,7.00),
(5,4,2,5.5,8.00),
(5,3,2,5.5,7.50),
(6,2,1,5.5,7.00),
(6,5,3,5.5,8.50);

INSERT INTO `ocpizza`.`payment_history`(`payment_solution_id`,`basket_id`,`amount`,`date`)VALUES
(1,1,33,"2021-01-29 11:11:11"),
(1,2,8.5,"2021-01-30 10:10:10"),
(1,3,19.5,"2021-01-31 09:09:09"),
(1,4,7,"2021-02-01 05:05:05"),
(1,5,31,"2021-02-01 06:06:06"),
(1,6,32.5,"2021-02-01 08:08:08");

INSERT INTO `ocpizza`.`stock`(`ingredient_id`,`restaurant_id`,`quantity`)VALUES
(1,1,3200),
(2,1,2200),
(3,1,3100),
(4,1,2800),
(5,1,2900),
(6,1,24),
(7,1,3000),
(8,1,2800),
(9,1,2600),
(10,1,3300),
(11,1,3400),
(12,1,2900),
(13,1,3100),
(1,2,3200),
(2,2,0),
(3,2,3100),
(4,2,2800),
(5,2,2900),
(6,2,16),
(7,2,3000),
(8,2,2800),
(9,2,2600),
(10,2,3300),
(11,2,3400),
(12,2,2900),
(13,2,3100),
(1,3,3200),
(2,3,2200),
(3,3,3100),
(4,3,2800),
(5,3,2900),
(6,3,52),
(7,3,3000),
(8,3,2800),
(9,3,2600),
(10,3,3300),
(11,3,3400),
(12,3,2900),
(13,3,3100);
