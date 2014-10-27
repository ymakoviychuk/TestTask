CREATE database gitdb DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE gitdb;

CREATE TABLE users(
    IdUser INT(6) NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL,
	Nickname VARCHAR(50) NOT NULL,
	Company VARCHAR(50) NOT NULL,
	Blog VARCHAR(255) NOT NULL,
	Followers INT(6) DEFAULT 0,
	IsLiked BOOLEAN DEFAULT FALSE,
    PRIMARY KEY(IdUser)
    ) ENGINE = INNODB;
	
CREATE TABLE projects(
    IdProject INT(6) NOT NULL AUTO_INCREMENT,
	IdOwner INT(6) NOT NULL,
    Name VARCHAR(100) NOT NULL,
	Description VARCHAR(100) NOT NULL,
	Watchers INT(6) DEFAULT 0,
	Forks INT(6) DEFAULT 0,
	OpenIssues INT(6) DEFAULT 0,
	HomePage VARCHAR(255) NOT NULL,
	GitHubRepo VARCHAR(255) NOT NULL,
	DateCreation DATETIME NOT NULL,
	IsLiked BOOLEAN DEFAULT FALSE,
    PRIMARY KEY(IdProject),
	FOREIGN KEY(IdOwner) REFERENCES users(IdUser)
		ON UPDATE CASCADE
		ON DELETE CASCADE
    ) ENGINE = INNODB;
	
CREATE TABLE projectsusers(
	IdProject INT(6) NOT NULL,
	IdUser INT(6) NOT NULL,
	FOREIGN KEY(IdProject) REFERENCES projects(IdProject)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY(IdUser) REFERENCES users(IdUser)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	) ENGINE = INNODB;

INSERT INTO users (Name, Surname, Nickname, Company, Blog, Followers, IsLiked) VALUES
('Quiang', 'Xue', 'yiisoft', 'Yii developers team', 'yiiframework.com', '4836', '1'),
('Alexander', 'Makarov', 'samdark', 'RMCreate', 'http://rmcreative.ru/', '135', '0'),
('Mat', 'Brown', 'resurtm', 'GE', 'http://ge.com/', '584', '1'),
('Vinnie', 'Tokarev', 'mdomba', 'NUOS', 'http://nuos.net/', '1792', '1'),
('Robert', 'Doms', 'clevertech', 'AT&T', 'http://blog5.net', '86', '0'),
('Boris', 'Godunov', 'Nodge', 'MosVodokanal', 'http://blog6.ru', '2574', '1'),
('Jason', 'Zaugg', 'retronym', 'FedEX', 'http://retronym.net', '197', '0'),
('Walter', 'Bright', 'WalterBright', 'Digital Mars', 'http://www.walterbright.com', '178', '1'),
('George', 'Zahariev', 'gkz', 'Canada', 'http://georgezahariev.com', '140', '0'),
('Jeremy', 'Ashkenas', 'jashkenas', 'The New York Times', 'http://ashkenas.com', '6300', '1'),
('Herbert', 'Vojčík', 'herby', 'unknown', 'http://blog.herby.sk', '23', '0'),
('Matthew', 'Flatt', 'mflatt', 'PLT, University of Utah', 'http://www.cs.utah.edu/~mflatt/', '105', '0'),
('Amr', 'Bedair', 'amrbedair', 'unknown', 'http://amr.nefya.com', '1', '1'),
('Ruslan', 'Fadeev', 'magefad', 'unknown', 'unknown', '9', '1'),
('Maksim', 'Naumov', 'fromYukki', 'Lazada.vn', 'http://yukki.name/', '6', '0');
	
INSERT INTO projects (IdOwner, Name, Description, Watchers, Forks, OpenIssues, HomePage, GitHubRepo, DateCreation, IsLiked) VALUES
('1', 'yii', 'Yii PHP Framework', '1357', '836', '385', 'http://www.yiiframework.com', 'https://github.com/yiisoft/yii', '2012-02-15 16:26:22', '0'),
('5', 'YiiBooster', 'YiiBooster', '144', '365', '86', 'http://yiibooster.com', 'https://github.com/clevertech/YiiBooster', '2014-07-17 14:23:32', '1'),
('6', 'yii-eauth', 'EAuth extension allows to authenticate users with accounts on other websites.', '65', '110', '14', 'http://yii-eauth.com', 'https://github.com/Nodge/yii-eauth', '2014-03-11 19:29:38', '0'),
('7', 'scala', 'Construct elegant class hierarchies for maximum code reuse and extensibility.', '381', '854', '33', 'http://www.scala-lang.org', 'https://github.com/scala/scala', '2013-07-09 16:24:31', '1'),
('8', 'D Programming Language', 'DMD is the formal implementation of the D language. It is actively developed by the D community.', '110', '273', '9', 'http://dlang.org', 'https://github.com/D-Programming-Language/dmd', '2014-02-20 12:19:32', '0'),
('9', 'LiveScript', 'LiveScript is a language which compiles to JavaScript.', '116', '72', '120', 'http://livescript.net', 'https://github.com/gkz/LiveScript', '2014-04-28 10:46:17', '1'),
('10', 'coffeescript', 'CoffeeScript is a little language that compiles into JavaScript.', '512', '1322', '237', 'http://coffeescript.org/', 'https://github.com/jashkenas/coffeescript', '2010-12-16 12:44:25', '0'),
('11', 'amber', 'An implementation of the Smalltalk language that runs on top of the JS runtime', '56', '121', '43', 'http://amber-lang.net', 'https://github.com/amber-smalltalk/amber', '2014-06-05 11:17:42', '1'),
('12', 'racket', 'Racket is a full-spectrum programming language.', '91', '202', '17', 'http://racket-lang.org/', 'https://github.com/plt/racket', '2010-05-11 08:45:33', '0');

INSERT INTO projectsusers (IdProject, IdUser) VALUES
('1', '2'), ('1', '3'), ('1', '4'), ('2', '15'), ('2', '14'), ('2', '13'), ('3', '12'), ('3', '11'), ('3', '10'), ('4', '9'), ('4', '8'),
('4', '7'), ('5', '5'), ('5', '6'), ('5', '7'), ('6', '2'), ('6', '11'), ('6', '8'), ('7', '4'), ('7', '2'), ('7', '13'), ('8', '10'),
('8', '1'), ('8', '5'), ('9', '3'), ('9', '12'), ('9', '15');