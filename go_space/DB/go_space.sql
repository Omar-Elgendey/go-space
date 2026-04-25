DROP DATABASE IF EXISTS Gospace;
CREATE DATABASE Gospace;
USE Gospace;

CREATE TABLE User (
User_ID INT PRIMARY KEY Auto_Increment,
Username VARCHAR(50),
Password VARCHAR(100),
Phone VARCHAR(20),
Email VARCHAR(100) Unique
);

CREATE TABLE Coworking_space (
Place_ID INT Auto_Increment PRIMARY KEY,
S_Name VARCHAR(100)
);

CREATE TABLE Rated_places (
ID INT,
User_ID INT,
Rating_value INT CHECK (Rating_value BETWEEN 1 AND 5),
PRIMARY KEY (ID,User_ID),
FOREIGN KEY (User_ID) REFERENCES User(User_ID),
FOREIGN KEY (ID) REFERENCES Coworking_space(Place_ID)
);

CREATE TABLE Amenity_Set (
Amenities VARCHAR(100),
Place_ID INT,
PRIMARY KEY (Amenities,Place_ID),
FOREIGN KEY (Place_ID) REFERENCES Coworking_space(Place_ID)
);

CREATE TABLE Service_Set(
Services VARCHAR(100),
Place_ID INT,
PRIMARY KEY (Services,Place_ID),
FOREIGN KEY (Place_ID) REFERENCES Coworking_space(Place_ID)
);

CREATE TABLE Link(
Link_ID INT PRIMARY KEY,
Place_ID INT,
FOREIGN KEY (Place_ID) REFERENCES Coworking_space(Place_ID)
);

CREATE TABLE link_Set(
Links VARCHAR(255),
Link_ID INT,
PRIMARY KEY (Links,Link_ID),
FOREIGN KEY (Link_ID) REFERENCES Link(Link_ID)
);

CREATE TABLE Branch (
Branch_ID INT PRIMARY KEY,
Place_ID INT,
Address TEXT,
Branch_name VARCHAR(50),
FOREIGN KEY (Place_ID) REFERENCES Coworking_space(Place_ID)
);

INSERT INTO User VALUES
(1,'Karim','pass123','01011111111','karim1@gmail.com'),
(2,'Ahmed','pass234','01022222222','ahmed@gmail.com'),
(3,'Dina','pass345','01033333333','dina@gmail.com'),
(4,'Mona','pass456','01044444444','mona@gmail.com'),
(5,'Mostafa','pass567','01055555555','mostafa@gmail.com'),
(6,'Laila','pass678','01066666666','laila@gmail.com'),
(7,'Tamer','pass789','01077777777','tamer@gmail.com'),
(8,'Hana','pass890','01088888888','hana@gmail.com'),
(9,'Ali','pass901','01099999999','ali@gmail.com'),
(10,'Mariam','pass012','01100000000','mariam@gmail.com');

INSERT INTO Coworking_space VALUES
(11,'Barah coworking space'),
(12,'comma coworking space'),
(13,'soul Lounge'),
(14,'sha8af Space'),
(15,'Arom'),
(16,'Zodiac coworking space'),
(17,'Bafakar'),
(18,'CozyHive'),
(19,'KROO'),
(20,'mqrspaces');

INSERT INTO Rated_places VALUES
(11,1,5),
(12,2,4),
(13,3,5),
(14,4,3),
(15,5,4),
(16,6,5),
(17,7,4),
(18,8,5),
(19,9,3),
(20,10,4);

INSERT INTO Amenity_Set VALUES
('Coffee corner',11),
('WIFI',12),
('Printer',13),
('Projector',14),
('Coffee corner',15),
('WIFI',16),
('Printer',17),
('Projector',18),
('Coffee corner',19),
('WIFI',20);

INSERT INTO Service_Set VALUES
('Private Office',11),
('Meeting Room',12),
('Dedicated Desk',13),
('Coworking space',14),
('Private Office',15),
('Meeting Room',16),
('Dedicated Desk',17),
('Coworking space',18),
('Private Office',19),
('Meeting Room',20);

INSERT INTO Link VALUES
(101,11),
(202,12),
(303,13),
(404,14),
(505,15),
(606,16),
(707,17),
(808,18),
(909,19),
(1001,20);

INSERT INTO link_Set VALUES
('https://www.instagram.com/barahcoworking',101),
('https://www.instagram.com/comma.coworking.space',202),
('https://linktr.ee/yoursoullounge',303),
('https://linktr.ee/shaghafcoworkingspace',404),
('https://www.instagram.com/arom_coworking_space/',505),
('https://linktr.ee/zodiac.space.eg',606),
('https://www.instagram.com/bafakar.w.space',707),
('https://linktr.ee/cozyhive',808),
('https://linktr.ee/kroo.cc',909),
('https://www.mqrspaces.com/',1001);

INSERT INTO Branch VALUES
(60, 11, 'El Dokki', 'Barah - El Dokki'),

(61, 12, 'Madent Naser', 'Comma - Madent Naser'),
(62, 12, 'El Dokki', 'Comma - El Dokki'),
(63, 12, 'El Manial', 'Comma - El Manial'),

(64, 13, 'Masr El Gededa', 'Soul Lounge - Masr El Gededa'),
(65, 13, 'Maadi', 'Soul Lounge - Maadi'),
(66, 13, 'Korba', 'Soul Lounge - Korba'),

(67, 14, 'Korba', 'Sha8af - Korba'),
(68, 14, 'Roxy', 'Sha8af - Roxy'),
(69, 14, 'El Dokki', 'Sha8af - El Dokki'),
(70, 14, 'West El Balad', 'Sha8af - West El Balad'),
(71, 14, 'Maadi', 'Sha8af - Maadi'),
(72, 14, 'El Manial', 'Sha8af - El Manial'),

(73, 15, 'Masr El Gededa', 'Arom - Masr El Gededa'),

(74, 16, 'Maadi', 'Zodiac - Maadi'),
(75, 16, 'Korba', 'Zodiac - Korba'),

(76, 17, 'Korba', 'Bafakar - Korba'),
(77, 17, 'Masr El Gededa', 'Bafakar - Masr El Gededa'),

(78, 18, 'Maadi', 'CozyHive - Maadi'),
(79, 18, 'El Manial', 'CozyHive - El Manial'),

(80, 19, 'West El Balad', 'Kroo - West El Balad'),
(81, 19, 'Masr El Gededa', 'Kroo - Masr El Gededa'),
(82, 19, 'El Sheikh Zayed', 'Kroo - El Sheikh Zayed'),
(83, 19, 'Fifth Settlement', 'Kroo - Fifth Settlement'),

(84, 20, 'New Cairo - Enawalks Mall', 'MQR - Enawalks Mall'),
(85, 20, 'New Cairo - Cairo Business Park', 'MQR - Cairo Business Park'),
(86, 20, 'New Cairo - Gateway Mall', 'MQR - Gateway Mall'),
(87, 20, 'New Cairo - Platz', 'MQR - Platz'),
(88, 20, 'New Cairo - Al Rehab Park 15', 'MQR - Al Rehab Park 15'),
(89, 20, 'Downtown - The GrEEK Campus', 'MQR - GrEEK Campus'),
(90, 20, 'Downtown - Nile City Towers', 'MQR - Nile City Towers'),
(91, 20, 'Maadi - Eco Building', 'MQR - Eco Building'),
(92, 20, 'October - Melanite Mall', 'MQR - Melanite Mall'),
(93, 20, 'Zayed - Al Rabwa', 'MQR - Al Rabwa'),
(94, 20, 'Zayed - Eden Mall', 'MQR - Eden Mall');


SELECT  Coworking_space.S_Name, Branch.Branch_name, Branch.Address
FROM Coworking_space
JOIN Branch ON Coworking_space.Place_ID = Branch.Place_ID;

SELECT Coworking_space.S_Name,Rated_places.Rating_value
FROM Coworking_space
JOIN Rated_places ON Coworking_space.Place_ID = Rated_places.ID;

SELECT Coworking_space.S_Name,Amenity_Set.Amenities
FROM Coworking_space
JOIN Amenity_Set ON Coworking_space.Place_ID = Amenity_Set.Place_ID;

SELECT Coworking_space.S_Name,Service_Set.Services
FROM Coworking_space
 JOIN Service_Set ON Coworking_space.Place_ID = Service_Set.Place_ID;

SELECT Coworking_space.S_Name, AVG(Rated_places.Rating_value) AS Avg_Rating
FROM Coworking_space
JOIN Rated_places ON Coworking_space.Place_ID = Rated_places.ID
GROUP BY Coworking_space.S_Name;
