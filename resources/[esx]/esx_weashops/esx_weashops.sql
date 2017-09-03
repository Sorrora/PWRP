USE `essentialmode`;

CREATE TABLE `weashops` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `weashops` (name, item, price) VALUES
	('GunShop','WEAPON_KNIFE',200),
	('GunShop','WEAPON_PISTOL',1000),
	('GunShop','WEAPON_REVOLVER',800),
	('GunShop','WEAPON_FLASHLIGHT',100),
	('GunShop','WEAPON_BAT',150),
	('GunShop','WEAPON_CROWBAR',200),
	('GunShop','WEAPON_GOLFCLUB',300),
	('GunShop','WEAPON_FLAREGUN',200),
	('GunShop','WEAPON_FIREEXTINGUISHER',50),
	('GunShop','WEAPON_PETROLCAN',500),
	('GunShop','GADGET_PARACHUTE',2000),
	('BlackWeashop','WEAPON_ASSAULTRIFLE',16000),
	('BlackWeashop','WEAPON_COMBATPISTOL',3000),
	('BlackWeashop','WEAPON_MICROSMG',7000),
	('BlackWeashop','WEAPON_SMG',10000),
	('BlackWeashop','WEAPON_PUMPSHOTGUN',5000)
	('BlackWeashop','WEAPON_SAWNOFFSHOTGUN',4000),
;