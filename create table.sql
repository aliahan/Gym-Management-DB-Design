--member TABLE



CREATE  TABLE Member (
    MemberID int NOT NULL Primary key,
    Member_LastName varchar(255) NOT NULL,
    Member_FirstName varchar(255) ,
	Member_Phonenum varchar(255) ,
	Member_SignupDate DATETIME ,
	EnterId int,
    Address varchar(255),
    City varchar(255),
	birthDate DATETIME,
	Member_RemainDays int,
	Member_MemberShipType int
);

USE [Gym_Managment]
GO

INSERT INTO [dbo].[Member]
           ([MemberID]
           ,[Member_LastName]
           ,[Member_FirstName]
           ,[Member_Phonenum]
           ,[Member_SignupDate]
           ,[Address]
           ,[City]
           ,[birthDate]
           ,[Member_RemainDays]
           ,[Member_MemberShipType])
     VALUES
           
            (1,
           'mousavi',
           'alireza', 
           123456789, 
           '2020-10-10', 
           'esfahan', 
           'esfahan', 
           '2000-12-12', 
           150, 
           1 ),
		   (2,'ahangar','ali',987654321,'2020-10-11','ahvaz','ahvaz','2001-08-01',100,2),
		   (5375,'Purvis','Angela','5-718-084-7385','1997-04-29 11:46:13','Andrews  Lane','Norfolk','1981-08-01 05:31:57',112,19),
(8592,'Driscoll','Harmony','8-618-314-4287','2008-05-27 00:35:36','Parkfield  Walk','Denver','2005-07-03 10:01:28',285,5),
(3254,'Ebbs','Vivian','5-161-727-5758','1991-12-03 07:39:05','Timber   Alley','London','1986-05-24 21:20:47',59,2),
(7159,'Kelly','Clint','8-841-678-1167','2014-07-05 18:01:42','St. Jamess  Street','Omaha','1985-04-16 08:22:48',53,3),
(5408,'Whittle','Joseph','0-510-825-7174','1999-07-05 15:56:44','Boadicea   Avenue','Madrid','1984-02-10 07:04:02',323,9),
(8724,'Campbell','Doris','6-281-521-4477','2001-12-01 09:49:54','Camdale  Road','Oakland','2000-11-29 09:04:42',226,14),
(9530,'Bristow','Grace','6-641-131-7738','1998-05-20 19:12:55','Glenwood Hill','Lancaster','2008-03-07 05:07:32',155,16),
(6945,'Steer','William','6-275-517-6263','2020-09-19 16:02:28','Longman   Walk','Memphis','1998-06-24 19:46:54',57,16),
(4297,'Hobson','Wade','2-684-301-5427','2008-09-29 09:10:25','Blackall   Tunnel','Las Vegas','1996-04-20 01:04:43',9,18),
(2325,'Ebden','Kurt','0-851-254-5675','2006-01-17 20:51:08','Enford   Route','Huntsville','1993-08-08 14:28:16',197,2);
GO



--coach TABLE


CREATE  TABLE coach (
    coachID int NOT NULL Primary key,
    coach_LastName varchar(255) NOT NULL,
    coach_FirstName varchar(255),
	coach_Phonenum varchar(255) ,
	coach_SignupDate DATETIME ,
    Address varchar(255) ,
    City varchar(255) ,
	salary int ,
	birthDate DATETIME
);

INSERT INTO coach VALUES 

(9275,'Michael','Hazel','4-600-760-8506','1982-05-28 01:38:45','Collingwood  Rue','Fremont',205,'1987-02-04 07:14:01'),
(6014,'Daniells','Joyce','7-046-451-2308','1998-11-12 15:20:01','St. Pauls  Drive','Fullerton',414,'2003-09-20 00:37:42'),
(8683,'Savage','Johnathan','1-154-484-1703','1989-10-28 10:54:21','Adelaide  Avenue','Los Angeles',378,'1988-12-17 00:16:45'),
(6746,'James','Eileen','2-135-767-8065','1999-03-26 10:11:08','Biggerstaff   Grove','Omaha',1467,'1997-11-18 00:39:15'),
(1257,'Sylvester','Nathan','6-745-608-1843','2003-06-23 11:33:55','Tilloch   Way','Detroit',570,'1997-03-06 05:51:05'),
(5169,'Stubbs','Phillip','8-581-412-1151','2016-05-20 08:27:58','Carpenter Pass','Lisbon',22,'1982-08-30 03:04:21'),
(3950,'Thomson','Doug','1-760-073-0502','2017-05-20 08:11:21','Cheney  Rue','Louisville',1980,'2002-10-31 05:14:42'),
(3213,'Mccormick','Sara','4-722-661-1334','1986-12-04 00:55:25','Jackson Alley','Springfield',282,'1994-05-24 00:47:17'),
(2277,'York','Carter','6-803-740-8136','2004-06-13 04:10:01','Lake Route','Bellevue',518,'2004-04-19 22:48:48'),
(9264,'Shaw','Hannah','6-655-036-4220','2010-12-28 14:54:00','Cam  Alley','San Francisco',1708,'2003-08-16 10:58:48');



--coach_member TABLE

CREATE  TABLE coach_member (
	Id int NOT NUll PRIMARY KEY,
    coachID int NOT NULL,
	MemberID int NOT NULL ,
	EnterID int ,
	contract_type varchar(255),
	contract_startDate DATETIME,
	contract_expireDate DATETIME,
	CONSTRAINT FK_coachID FOREIGN KEY (coachID) REFERENCES coach(coachID),
	CONSTRAINT FK_memberhID FOREIGN KEY (MemberID) REFERENCES Member(MemberID)

   
);


--staff TABLE

CREATE  TABLE staff (
    staffID int NOT NULL Primary key,
    staff_LastName varchar(255) NOT NULL,
    staff_FirstName varchar(255),
	staff_Phonenum varchar(255) ,
	staff_SignupDate DATETIME ,
    Address varchar(255) ,
    City varchar(255) ,
	salary int ,
	birthDate DATETIME
);
insert into staff VALUES
(2823,'Hobbs','Alice','4-635-563-0387','2010-06-20 06:43:16','Bingham   Alley','Bakersfield',1198,'1983-11-09 08:04:44'),
(1811,'Hardwick','Tyler','1-854-822-5077','1980-10-28 13:47:16','Waite  Pass','Charlotte',983,'1977-03-14 11:07:09'),
(997,'Wright','Ethan','0-481-456-1173','2019-09-05 09:57:06','Coley  Crossroad','St. Louis',172,'1976-10-03 10:05:52'),
(2232,'Shields','Payton','4-060-321-2115','1995-02-21 09:53:36','Carpenter Boulevard','Tallahassee',1965,'1978-03-22 01:23:55'),
(2402,'Baker','Carmella','6-858-865-1137','1980-11-26 15:18:44','Cliff  Road','Boston',1911,'1995-05-12 02:50:56'),
(7551,'Nayler','Benjamin','8-113-735-3252','2008-03-24 13:51:45','Blake  Pass','Tulsa',523,'1985-01-31 17:17:27'),
(1045,'Emmott','Freya','5-700-161-5888','2022-04-29 13:05:53','Parkfield  Boulevard','Cincinnati',1102,'1987-01-07 18:19:20'),
(56,'Palmer','Eduardo','7-661-240-0415','1986-05-31 21:26:16','Cephas  Avenue','Houston',1091,'1995-08-14 04:50:46'),
(2041,'Hopkins','Celia','5-247-057-2827','2009-01-11 11:31:03','Coleman  Tunnel','Jacksonville',1165,'1994-04-22 21:30:32'),
(4509,'Thompson','Rocco','6-074-865-4703','2003-06-15 11:08:10','Bel   Grove','Los Angeles',149,'1978-02-16 02:08:28');



--closet TABLE

CREATE  TABLE closet (
    closetID int not null primary key,
	empety_statue BIT ,
	usable_statue BIT

);	

INSERT INTO closet VALUES 
(2823,1,1),
(1811,1,1),
(997,1,1),
(2232,1,1),
(2402,1,1),
(7551,1,1),
(1045,1,1),
(56,1,1),
(2041,1,1),
(4509,1,1);

--pay TABLE

CREATE  TABLE pays (
    payID int not null primary key,
	MemberID int NOT NULL ,
	payedAmount int NOT NULL,
	payDate DATETIME,
	CONSTRAINT FK_memberID FOREIGN KEY (MemberID) REFERENCES Member(MemberID)


);


--membership TABLE
CREATE  TABLE MemberShips (
		int not null primary key,
	MemberShipName varchar (255) ,
	MemberShipPrice int NOT NULL,
	MemberShipPeriod int
	


);
INSERT INTO MemberShips VALUES 
(1,'1day',10,1),
(2,'1week',30,3),
(3,'1month',120,12),
(4,'3month',360,36),
(5,'6month',740,74),
(6,'1year',1500,150),
(7,'1yearpermimume',2400,240);



--EnterExit TABLE

CREATE  TABLE EnterExit (
	EnterID int not null primary key,
    MemberId int not null ,
	closetID int not null,
	enterDate DATETIME,
	exitDate DATETIME,
	CONSTRAINT FK_memberID_enterexit FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
	CONSTRAINT FK_closetID_enterexit FOREIGN KEY (closetID) REFERENCES closet(closetID)


);


--Membership managment TABLE
CREATE  TABLE Membership_mangment (
    MemberId int not null primary key,
	MemberShipID int not null,
	RemainSession int not null,

	CONSTRAINT FK_memberID_Membership_mangment FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
	CONSTRAINT FK_membershipID_Membership_mangment FOREIGN KEY (MemberShipID) REFERENCES MemberShips(MemberShipID)


);























