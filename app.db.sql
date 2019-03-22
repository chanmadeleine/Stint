BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `users` (
	`id`	INTEGER NOT NULL,
	`email`	VARCHAR ( 64 ) UNIQUE,
	`name`	VARCHAR ( 64 ),
	`password_hash`	VARCHAR ( 128 ),
	`major`	VARCHAR ( 128 ),
	`role_id`	INTEGER,
	`headline`	VARCHAR ( 32 ),
	`about_me`	TEXT,
	`about_me_html`	TEXT,
	`avatar`	VARCHAR ( 128 ),
	`member_since`	DATETIME,
	FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`),
	PRIMARY KEY(`id`)
);
INSERT INTO `users` VALUES (1,'root@gmail.com','root','pbkdf2:sha256:50000$dsmuwI9i$04f6508af62eae4b87efaf28702d161c7bee73724b690a35335d68bdeb7bff68','administrator',3,'Administrator','Administrator','<p>Administrator</p>',NULL,'2019-03-03 18:15:03.352400');
INSERT INTO `users` VALUES (2,'madeleine@madeleine.com','MC','pbkdf2:sha256:50000$pFk3uWP1$fe8d42c254b7d56c7511b7e36cd77c72545e17359ba6b71474fe1873be1c0d21','Media',1,'User',NULL,NULL,NULL,'2019-03-03 18:15:03.397465');
INSERT INTO `users` VALUES (3,'test@test.com','test','pbkdf2:sha256:50000$aGgXqPaH$97578082e055ebcb513aab5560161ba3c929f02aa757456e93e4ba8ab910aba9',NULL,1,NULL,NULL,NULL,NULL,'2019-03-03 18:15:03.437707');
INSERT INTO `users` VALUES (4,'caroline@yahoo.com','Caroline','pbkdf2:sha256:50000$ZDH1C4DX$dfd7a5d5ab7bb91bec3cece833672d680bc0440a43c532bbc2c88daa0f1817b9',NULL,1,NULL,NULL,NULL,NULL,'2019-03-03 18:15:03.478874');
INSERT INTO `users` VALUES (5,'helena.lingor@leuphana.de','Helena','pbkdf2:sha256:50000$pkfnPHOO$daf35514a83d9120439c9b130e61f25006c9b5e6298a73e414314aacc166c610',NULL,1,'Teaching and Research Associate',NULL,NULL,NULL,'2019-03-03 18:15:03.517535');
CREATE TABLE IF NOT EXISTS `tags` (
	`id`	INTEGER NOT NULL,
	`name`	VARCHAR,
	PRIMARY KEY(`id`)
);
INSERT INTO `tags` VALUES (1,'Comedy');
INSERT INTO `tags` VALUES (2,'Drama');
INSERT INTO `tags` VALUES (3,'Music');
INSERT INTO `tags` VALUES (4,'Musical');
INSERT INTO `tags` VALUES (5,'Romance');
INSERT INTO `tags` VALUES (6,'Crime');
INSERT INTO `tags` VALUES (7,'Thriller');
INSERT INTO `tags` VALUES (8,' Adventure');
INSERT INTO `tags` VALUES (9,'Sci-Fi');
INSERT INTO `tags` VALUES (10,'Animation');
INSERT INTO `tags` VALUES (11,'Adventure');
INSERT INTO `tags` VALUES (12,'Family');
INSERT INTO `tags` VALUES (13,'Fantasy');
INSERT INTO `tags` VALUES (14,'Mystery');
INSERT INTO `tags` VALUES (15,'Biography');
INSERT INTO `tags` VALUES (16,'History');
INSERT INTO `tags` VALUES (17,'War');
INSERT INTO `tags` VALUES (18,' Action');
INSERT INTO `tags` VALUES (19,'Western');
CREATE TABLE IF NOT EXISTS `roles` (
	`id`	INTEGER NOT NULL,
	`name`	VARCHAR ( 64 ) UNIQUE,
	`default`	BOOLEAN,
	`permissions`	INTEGER,
	CHECK("default"IN(0,1)),
	PRIMARY KEY(`id`)
);
INSERT INTO `roles` VALUES (1,'User',1,7);
INSERT INTO `roles` VALUES (2,'Moderator',0,15);
INSERT INTO `roles` VALUES (3,'Administrator',0,511);
CREATE TABLE IF NOT EXISTS `logs` (
	`id`	INTEGER NOT NULL,
	`user_id`	INTEGER,
	`book_id`	INTEGER,
	`borrow_timestamp`	DATETIME,
	`return_timestamp`	DATETIME,
	`returned`	BOOLEAN,
	FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
	FOREIGN KEY(`book_id`) REFERENCES `books`(`id`),
	CHECK(returnedIN(0,1)),
	PRIMARY KEY(`id`)
);
INSERT INTO `logs` VALUES (1,2,2,'2019-03-03 18:15:03.769505','2019-04-02 18:15:03.769505',0);
INSERT INTO `logs` VALUES (2,2,3,'2019-03-03 18:15:03.771226','2019-04-02 18:15:03.771226',0);
INSERT INTO `logs` VALUES (3,2,4,'2019-03-03 18:15:03.771226','2019-04-02 18:15:03.771226',0);
INSERT INTO `logs` VALUES (4,2,6,'2019-03-03 18:15:03.772214','2019-04-02 18:15:03.772214',0);
INSERT INTO `logs` VALUES (5,3,1,'2019-03-03 18:15:03.773149','2019-04-02 18:15:03.773149',0);
INSERT INTO `logs` VALUES (6,3,3,'2019-03-03 18:15:03.773149','2019-04-02 18:15:03.773149',0);
INSERT INTO `logs` VALUES (7,3,5,'2019-03-03 18:15:03.774142','2019-04-02 18:15:03.774142',0);
INSERT INTO `logs` VALUES (8,4,2,'2019-03-03 18:15:03.774142','2019-04-02 18:15:03.774142',0);
INSERT INTO `logs` VALUES (9,4,5,'2019-03-03 18:15:03.775121','2019-04-02 18:15:03.775121',0);
CREATE TABLE IF NOT EXISTS `comments` (
	`id`	INTEGER NOT NULL,
	`user_id`	INTEGER,
	`book_id`	INTEGER,
	`comment`	VARCHAR ( 1024 ),
	`create_timestamp`	DATETIME,
	`edit_timestamp`	DATETIME,
	`deleted`	BOOLEAN,
	FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
	PRIMARY KEY(`id`),
	CHECK(deletedIN(0,1)),
	FOREIGN KEY(`book_id`) REFERENCES `books`(`id`)
);
INSERT INTO `comments` VALUES (1,2,2,'fdgdfgdg','2019-03-03 19:08:47.270265','2019-03-03 19:08:47.270265',1);
INSERT INTO `comments` VALUES (2,2,2,'<h1>Outstanding Thriller</h1>
I think this is one of the best films ever made. I''m very much into things that are creepy and sick, so this was right up my alley. It wasn''t as scary as I suspected. It was more suspenseful than scary. There is obviously violent/disturbing content, since it''s about serial killers and all. I''m not going to elaborate on each instance of disturbing content because it would take too long. As for sexual stuff, a prisoner flicks semen at Clarice in one scene, and Buffalo Bill is shown dancing naked in front of a mirror with his penis tucked between his legs. All of the acting is phenomenal, but I feel like the other actors get overshadowed Anthony Hopkins as Hannibal Lecter. Lecter is easily the best villain in film history, and Anthony Hopkins is superb. The way that serial killers were portrayed in this film is chillingly realistic. The story has you on the edge of your seat the whole time.','2019-03-03 19:09:10.653066','2019-03-03 19:09:10.653066',1);
INSERT INTO `comments` VALUES (3,2,2,'Outstanding Thriller
I think this is one of the best films ever made. I''m very much into things that are creepy and sick, so this was right up my alley. It wasn''t as scary as I suspected. It was more suspenseful than scary. There is obviously violent/disturbing content, since it''s about serial killers and all. I''m not going to elaborate on each instance of disturbing content because it would take too long. As for sexual stuff, a prisoner flicks semen at Clarice in one scene, and Buffalo Bill is shown dancing naked in front of a mirror with his penis tucked between his legs. All of the acting is phenomenal, but I feel like the other actors get overshadowed Anthony Hopkins as Hannibal Lecter. Lecter is easily the best villain in film history, and Anthony Hopkins is superb. The way that serial killers were portrayed in this film is chillingly realistic. The story has you on the edge of your seat the whole time. I highly, highly recommend this movie.','2019-03-03 19:10:22.984729','2019-03-03 19:10:22.984729',0);
CREATE TABLE IF NOT EXISTS `books_tags` (
	`book_id`	INTEGER,
	`tag_id`	INTEGER,
	FOREIGN KEY(`book_id`) REFERENCES `books`(`id`),
	FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`)
);
INSERT INTO `books_tags` VALUES (1,5);
INSERT INTO `books_tags` VALUES (1,4);
INSERT INTO `books_tags` VALUES (1,1);
INSERT INTO `books_tags` VALUES (1,2);
INSERT INTO `books_tags` VALUES (1,3);
INSERT INTO `books_tags` VALUES (2,2);
INSERT INTO `books_tags` VALUES (2,6);
INSERT INTO `books_tags` VALUES (2,7);
INSERT INTO `books_tags` VALUES (3,8);
INSERT INTO `books_tags` VALUES (3,2);
INSERT INTO `books_tags` VALUES (3,9);
INSERT INTO `books_tags` VALUES (4,1);
INSERT INTO `books_tags` VALUES (4,10);
INSERT INTO `books_tags` VALUES (4,11);
INSERT INTO `books_tags` VALUES (4,12);
INSERT INTO `books_tags` VALUES (4,13);
INSERT INTO `books_tags` VALUES (4,3);
INSERT INTO `books_tags` VALUES (4,14);
INSERT INTO `books_tags` VALUES (5,15);
INSERT INTO `books_tags` VALUES (5,2);
INSERT INTO `books_tags` VALUES (5,16);
INSERT INTO `books_tags` VALUES (5,17);
INSERT INTO `books_tags` VALUES (6,18);
INSERT INTO `books_tags` VALUES (6,11);
INSERT INTO `books_tags` VALUES (6,19);
CREATE TABLE IF NOT EXISTS `books` (
	`id`	INTEGER NOT NULL,
	`isbn`	VARCHAR ( 16 ) UNIQUE,
	`title`	VARCHAR ( 128 ),
	`origin_title`	VARCHAR ( 128 ),
	`subtitle`	VARCHAR ( 128 ),
	`author`	VARCHAR ( 128 ),
	`translator`	VARCHAR ( 64 ),
	`publisher`	VARCHAR ( 64 ),
	`image`	VARCHAR ( 128 ),
	`pubdate`	VARCHAR ( 32 ),
	`pages`	INTEGER,
	`price`	VARCHAR ( 16 ),
	`binding`	VARCHAR ( 16 ),
	`numbers`	INTEGER,
	`summary`	TEXT,
	`summary_html`	TEXT,
	`catalog`	TEXT,
	`catalog_html`	TEXT,
	`hidden`	BOOLEAN,
	CHECK(hiddenIN(0,1)),
	PRIMARY KEY(`id`)
);
INSERT INTO `books` VALUES (1,'3783958','La La Land (2016)',NULL,'Here''s to the fools who dream','Ryan Gosling and Emma Stone',NULL,NULL,'https://m.media-amazon.com/images/M/MV5BMzUzNDM2NzM2MV5BMl5BanBnXkFtZTgwNTM3NTg4OTE@._V1_SY1000_SX675_AL_.jpg',NULL,NULL,NULL,NULL,5,'Aspiring actress serves lattes to movie stars in between auditions and jazz musician Sebastian scrapes by playing cocktail-party gigs in dingy bars. But as success mounts, they are faced with decisions that fray the fragile fabric of their love affair, and the dreams they worked so hard to maintain in each other threaten to rip them apart.','<p>Aspiring actress serves lattes to movie stars in between auditions and jazz musician Sebastian scrapes by playing cocktail-party gigs in dingy bars. But as success mounts, they are faced with decisions that fray the fragile fabric of their love affair, and the dreams they worked so hard to maintain in each other threaten to rip them apart.</p>','',NULL,0);
INSERT INTO `books` VALUES (2,'0102926','The Silence of the Lambs (1991)',NULL,'Prepare yourself for the most exciting, mesmerising and terrifying two hours of your life!',' Jodie Foster,Anthony Hopkins,Lawrence A. Bonney',NULL,NULL,'https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,677,1000_AL_.jpg',NULL,NULL,NULL,NULL,5,'FBI trainee Clarice Starling works hard to advance her career, while trying to hide/put behind her West Virginia roots, of which if some knew, would automatically classify her as being backward or white trash. After graduation, she aspires to work in the agency''s Behavioral Science Unit under the leadership of Jack Crawford. While she is still a trainee, Crawford asks her to question Dr. Hannibal Lecter, a psychiatrist imprisoned, thus far, for eight years in maximum security isolation for being a serial killer who cannibalized his victims. Clarice is able to figure out the assignment is to pick Lecter''s brains to help them solve another serial murder case, that of someone coined by the media as Buffalo Bill, who has so far killed five victims, all located in the eastern US, all young women who are slightly overweight (especially around the hips), all who were drowned in natural bodies of water, and all who were stripped of large swaths of skin. She also figures that Crawford chose ...','<p>FBI trainee Clarice Starling works hard to advance her career, while trying to hide/put behind her West Virginia roots, of which if some knew, would automatically classify her as being backward or white trash. After graduation, she aspires to work in the agency''s Behavioral Science Unit under the leadership of Jack Crawford. While she is still a trainee, Crawford asks her to question Dr. Hannibal Lecter, a psychiatrist imprisoned, thus far, for eight years in maximum security isolation for being a serial killer who cannibalized his victims. Clarice is able to figure out the assignment is to pick Lecter''s brains to help them solve another serial murder case, that of someone coined by the media as Buffalo Bill, who has so far killed five victims, all located in the eastern US, all young women who are slightly overweight (especially around the hips), all who were drowned in natural bodies of water, and all who were stripped of large swaths of skin. She also figures that Crawford chose ...</p>','',NULL,0);
INSERT INTO `books` VALUES (3,'0816692','Interstellar (2014)',NULL,'Mankind''s next step will be our greatest.',' Matthew McConaughey, Anne Hathaway, Jessica Chastain',NULL,NULL,'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SY1000_SX675_AL_.jpg',NULL,NULL,NULL,NULL,5,'Earth''s future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind''s survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life.','<p>Earth''s future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind''s survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life.</p>','',NULL,0);
INSERT INTO `books` VALUES (4,'2380307','Coco (2017)',NULL,NULL,' Anthony Gonzalez, Gael García Bernal, Benjamin Bratt',NULL,NULL,'https://m.media-amazon.com/images/M/MV5BYjQ5NjM0Y2YtNjZkNC00ZDhkLWJjMWItN2QyNzFkMDE3ZjAxXkEyXkFqcGdeQXVyODIxMzk5NjA@._V1_SY1000_CR0,0,699,1000_AL_.jpg',NULL,NULL,NULL,NULL,5,'Despite his family''s baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz. Desperate to prove his talent, Miguel finds himself in the stunning and colorful Land of the Dead following a mysterious chain of events. Along the way, he meets charming trickster Hector, and together, they set off on an extraordinary journey to unlock the real story behind Miguel''s family history.','<p>Despite his family''s baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz. Desperate to prove his talent, Miguel finds himself in the stunning and colorful Land of the Dead following a mysterious chain of events. Along the way, he meets charming trickster Hector, and together, they set off on an extraordinary journey to unlock the real story behind Miguel''s family history.</p>','',NULL,0);
INSERT INTO `books` VALUES (5,'2119532','Hacksaw Ridge (2016)',NULL,'When the order came to retreat, one man stayed.',' Andrew Garfield, Sam Worthington, Luke Bracey',NULL,NULL,'https://m.media-amazon.com/images/M/MV5BMjQ1NjM3MTUxNV5BMl5BanBnXkFtZTgwMDc5MTY5OTE@._V1_SY1000_CR0,0,647,1000_AL_.jpg',NULL,NULL,NULL,NULL,5,'The true story of Desmond T. Doss, the conscientious objector who, at the Battle of Okinawa, was awarded the Medal of Honor for his incredible bravery and regard for his fellow soldiers. We see his upbringing and how this shaped his views, especially his religious view and anti-killing stance. We see Doss''s trials and tribulations after enlisting in the US Army and trying to become a medic. Finally, we see the hell on Earth that was Hacksaw Ridge.','<p>The true story of Desmond T. Doss, the conscientious objector who, at the Battle of Okinawa, was awarded the Medal of Honor for his incredible bravery and regard for his fellow soldiers. We see his upbringing and how this shaped his views, especially his religious view and anti-killing stance. We see Doss''s trials and tribulations after enlisting in the US Army and trying to become a medic. Finally, we see the hell on Earth that was Hacksaw Ridge.</p>','',NULL,0);
INSERT INTO `books` VALUES (6,'tt2404435','The Magnificent Seven (2016)',NULL,NULL,' Denzel Washington, Chris Pratt, Ethan Hawke',NULL,NULL,'https://m.media-amazon.com/images/M/MV5BMTUzNTc0NTAyM15BMl5BanBnXkFtZTgwMTk1ODA5OTE@._V1_SY1000_CR0,0,675,1000_AL_.jpg',NULL,NULL,NULL,NULL,5,'Director Antoine Fuqua brings his modern vision to a classic story in The Magnificent Seven. With the town of Rose Creek under the deadly control of industrialist Bartholomew Bogue, the desperate townspeople employ protection from seven outlaws, bounty hunters, gamblers and hired guns. As they prepare the town for the violent showdown that they know is coming, these seven mercenaries find themselves fighting for more than money.','<p>Director Antoine Fuqua brings his modern vision to a classic story in The Magnificent Seven. With the town of Rose Creek under the deadly control of industrialist Bartholomew Bogue, the desperate townspeople employ protection from seven outlaws, bounty hunters, gamblers and hired guns. As they prepare the town for the violent showdown that they know is coming, these seven mercenaries find themselves fighting for more than money.</p>','',NULL,0);
CREATE INDEX IF NOT EXISTS `ix_roles_default` ON `roles` (
	`default`
);
COMMIT;
