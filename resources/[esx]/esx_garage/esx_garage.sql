USE `essentialmode`;

-- Table to store the last garage a player entered
CREATE TABLE `current_garage` (

	`identifier` varchar(60) NOT NULL,
	`garage` varchar(60) NOT NULL,
	
	PRIMARY KEY (`identifier`)
);

CREATE TABLE `user_parkings` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext,

  PRIMARY KEY (`id`)
);
