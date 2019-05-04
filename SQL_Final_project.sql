--LIBRARY PROJECT--

--CREATE TABLES--
CREATE TABLE Card(
  cardID NUMBER,
  status VARCHAR2(1) CHECK ((status = 'A') OR (status = 'B')),
  fines NUMBER,
  CONSTRAINT Card_PK PRIMARY KEY (cardID));

CREATE TABLE Customer(
  customerID NUMBER,
  name VARCHAR2(40),
  customerAddress VARCHAR2(50),
  phone NUMBER(9),
  password VARCHAR2(20),
  userName VARCHAR2(10),
  dateSignUp DATE,
  cardNumber NUMBER,
  CONSTRAINT Customer_PK PRIMARY KEY (customerID));

CREATE TABLE Employee(
  employeeID NUMBER,
  name VARCHAR2(40),
  employeeAddress VARCHAR2(50),
  phone NUMBER(9),
  password VARCHAR2(20),
  userName VARCHAR2(10),
  paycheck NUMBER (8, 2),
  branchName VARCHAR2(40),
  cardNumber NUMBER,
  CONSTRAINT Employee_PK PRIMARY KEY (employeeID));

CREATE TABLE Branch(
  name VARCHAR2(40),
  address VARCHAR2(50),
  phone NUMBER(9),
  CONSTRAINT Branch_PK PRIMARY KEY (name));
  
CREATE TABLE Location(
  address VARCHAR2(50),
  CONSTRAINT Location_PK PRIMARY KEY (address));
  
CREATE TABLE Rent(
  cardID NUMBER,
  itemID VARCHAR2(6),
  apporpriationDate DATE,
  returnDate DATE,
  CONSTRAINT Rent_PK PRIMARY KEY (cardID,itemID));
 
CREATE TABLE Book(
  ISBN VARCHAR2(4),
  bookID VARCHAR2(6),
  state VARCHAR2(10),
  avalability VARCHAR2(1) CHECK ((avalability = 'A') OR (avalability = 'O')),
  debyCost NUMBER(10,2),
  lostCost NUMBER(10,2),
  address VARCHAR2(50),
  CONSTRAINT Book_PK PRIMARY KEY (ISBN,bookID));

CREATE TABLE Video(
  title VARCHAR2(50),
  year INT,
  videoID VARCHAR2(6),
  state VARCHAR2(10),
  avalability VARCHAR2(1) CHECK ((avalability = 'A') OR (avalability = 'O')),
  debyCost NUMBER(10,2),
  lostCost NUMBER(10,2),
  address VARCHAR(50),
  CONSTRAINT Video_PK PRIMARY KEY (title,year,videoID));


--SELECT--
SELECT * FROM Card;
SELECT * FROM Customer;
SELECT * FROM Employee;
SELECT * FROM Branch;
SELECT * FROM Location;
SELECT * FROM Book;
SELECT * FROM Video;
SELECT * FROM Rent;


--FOREIGN KEYS--
ALTER TABLE Customer
ADD CONSTRAINT Customer_FK
FOREIGN KEY (cardNumber)
REFERENCES Card(cardID);

ALTER TABLE Employee
ADD CONSTRAINT Employee_FK_Card
FOREIGN KEY (cardNumber)
REFERENCES Card(cardID);

ALTER TABLE Employee
ADD CONSTRAINT Employee_FK_Branch
FOREIGN KEY (branchName)
REFERENCES Branch(name);

ALTER TABLE Branch
ADD CONSTRAINT Branch_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE Book
ADD CONSTRAINT Book_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE Video
ADD CONSTRAINT Video_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE Rent
ADD CONSTRAINT Rent_FK_Card
FOREIGN KEY (cardID)
REFERENCES Card(cardID);


--INSERTS--
INSERT INTO Card VALUES (101,'A',0);
INSERT INTO Card VALUES (102,'A',0);
INSERT INTO Card VALUES (103,'A',0);
INSERT INTO Card VALUES (104,'A',0);
INSERT INTO Card VALUES (105,'A',0);
INSERT INTO Card VALUES (106,'A',0);
INSERT INTO Card VALUES (107,'B',50);
INSERT INTO Card VALUES (108,'B',10);
INSERT INTO Card VALUES (109,'B',25.5);
INSERT INTO Card VALUES (110,'B',15.25);
INSERT INTO Card VALUES (151,'A',0);
INSERT INTO Card VALUES (152,'A',0);
INSERT INTO Card VALUES (153,'A',0);
INSERT INTO Card VALUES (154,'A',0);
INSERT INTO Card VALUES (155,'A',0);

INSERT INTO Location VALUES ('ARCHEOLOGY ROAD');
INSERT INTO Location VALUES ('CHEMISTRY ROAD');
INSERT INTO Location VALUES ('COMPUTING ROAD');
INSERT INTO Location VALUES ('PHYSICS ROAD');



INSERT INTO Branch VALUES ('ARCHEOLOGY', 'ARCHEOLOGY ROAD', 645645645);
INSERT INTO Branch VALUES ('CHEMISTRY', 'CHEMISTRY ROAD', 622622622);
INSERT INTO Branch VALUES ('COMPUTING', 'COMPUTING ROAD', 644644644);
INSERT INTO Branch VALUES ('PHYSICS', 'PHYSICS ROAD', 666666666);


INSERT INTO Customer VALUES (1, 'ALFRED', 'BACON STREET', 623623623, 'alfred123', 'al1', TO_DATE('12-05-2018', 'dd-mm-yyyy'), 101);
INSERT INTO Customer VALUES (2, 'JAMES', 'DOWNTOWN ABBEY', 659659659, 'james123', 'ja2', TO_DATE('10-05-2018', 'dd-mm-yyyy'), 102);
INSERT INTO Customer VALUES (3, 'GEORGE', 'DETROIT CITY', 654654654, 'george123', 'ge3', TO_DATE('21-06-2017','dd-mm-yyyy'), 103);
INSERT INTO Customer VALUES (4, 'TOM', 'WASHINGTON DC.', 658658658, 'tom123', 'tom4', TO_DATE('05-12-2016','dd-mm-yyyy'), 104);
INSERT INTO Customer VALUES (5, 'PETER', 'CASTERLY ROCK', 652652652, 'peter123', 'pe5', TO_DATE('09-08-2016','dd-mm-yyyy'), 105);
INSERT INTO Customer VALUES (6, 'JENNY', 'TERRAKOTA', 651651651, 'jenny123', 'je6', TO_DATE('30-04-2017','dd-mm-yyyy'), 106);
INSERT INTO Customer VALUES (7, 'ROSE', 'SWEET HOME ALABAMA', 657657657, 'rose123', 'ro7', TO_DATE('28-02-2018','dd-mm-yyyy'), 107);
INSERT INTO Customer VALUES (8, 'MONICA', 'FAKE STREET 123', 639639639, 'monica123', 'mo8', TO_DATE('15-01-2016','dd-mm-yyyy'), 108);
INSERT INTO Customer VALUES (9, 'PHOEBE', 'CENTRAL PERK', 678678678, 'phoebe123', 'pho9', TO_DATE('25-03-2016','dd-mm-yyyy'), 109);
INSERT INTO Customer VALUES (10, 'RACHEL', 'WHEREVER', 687687687, 'rachel123', 'ra10', TO_DATE('01-09-2017','dd-mm-yyyy'), 110);


INSERT INTO Employee VALUES (211, 'ROSS', 'HIS HOUSE', 645645645, 'ross123', 'ro11', 1200, 'ARCHEOLOGY', 101);
INSERT INTO Employee VALUES (212, 'CHANDLER', 'OUR HEARTHS',645645645, 'chandler123', 'chand12', 1150.50, 'ARCHEOLOGY', 102);
INSERT INTO Employee VALUES (213, 'JOEY', 'LITTLE ITAYLY', 645645645, 'joey123', 'jo13', 975.75, 'ARCHEOLOGY', 103);
INSERT INTO Employee VALUES (214, 'VICTOR', 'SANTA FE', 644644644, 'victor123', 'vic14', 2200, 'COMPUTING', 104);
INSERT INTO Employee VALUES (215, 'JAIRO', 'ARMILLA', 622622622, 'jairo123', 'ja15', 2200.50, 'CHEMISTRY', 105);

INSERT INTO Book VALUES ('A123', 'B1A123', 'GOOD', 'A', 5, 20, 'ARCHEOLOGY ROAD');
INSERT INTO Book VALUES ('A123', 'B2A123', 'NEW', 'O', 6, 30, 'ARCHEOLOGY ROAD');
INSERT INTO Book VALUES ('B234', 'B1B234', 'NEW', 'A', 2, 15, 'CHEMISTRY ROAD');
INSERT INTO Book VALUES ('C321', 'B1C321', 'BAD', 'A', 1, 10, 'PHYSICS ROAD');
INSERT INTO Book VALUES ('H123', 'B1H123', 'GOOD', 'A', 3, 15, 'CHEMISTRY ROAD');
INSERT INTO Book VALUES ('Z123', 'B1Z123', 'GOOD', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO Book VALUES ('L321', 'B1L321', 'NEW', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO Book VALUES ('P321', 'B1P321', 'USED', 'A', 2, 12, 'CHEMISTRY ROAD');

INSERT INTO Video VALUES ('CHEMISTRY FOR DUMMIES', 2016, 'V1CH16', 'NEW', 'O', 10, 50, 'CHEMISTRY ROAD');
INSERT INTO Video VALUES ('CHEMISTRY FOR DUMMIES', 2016, 'V2CH16', 'BAD', 'A', 5, 20, 'CHEMISTRY ROAD');
INSERT INTO Video VALUES ('COMPUTING MANAGER', 2014, 'V1CO14', 'GOOD', 'A', 4, 20, 'COMPUTING ROAD');
INSERT INTO Video VALUES ('JAVA LANGUAGE', 2015, 'V1JA15', 'USED', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO Video VALUES ('DINOSAURS', 2000, 'V1DI00', 'GOOD', 'O', 5, 25, 'ARCHEOLOGY ROAD');
INSERT INTO Video VALUES ('T-REX, DEADLY KING', 1992, 'V1TR92', 'USED', 'A', 10, 50, 'ARCHEOLOGY ROAD');
INSERT INTO Video VALUES ('ANCESTORS OF THE HUMANITY', 1998, 'V1AN98', 'BAD', 'A', 3, 15, 'ARCHEOLOGY ROAD');
INSERT INTO Video VALUES ('PHYSICS, MOST BORING SH*T', 2018, 'V1PH18', 'NEW', 'A', 1, 5, 'PHYSICS ROAD');


INSERT INTO Rent VALUES (101, 'B2A123', TO_DATE('10-05-2018', 'DD-MM-YYYY'), TO_DATE('20-05-2018, 'DD-MM-YYYY'));
INSERT INTO Rent VALUES (102, 'B1Z123', TO_DATE('10-05-2018','DD-MM-YYYY'),  TO_DATE('25-05-2018', 'DD-MM-YYYY'));
INSERT INTO Rent VALUES (104, 'V1JA15', TO_DATE('01-05-2018', 'DD-MM-YYYY'), TO_DATE('21-05-2018', 'DD-MM-YYYY'));
INSERT INTO Rent VALUES (105, 'V1DI00', TO_DATE('02-05-2018', 'DD-MM-YYYY'), TO_DATE('25-05-2018', 'DD-MM-YYYY'));
INSERT INTO Rent VALUES (154, 'B1L321', TO_DATE('04-05-2018', 'DD-MM-YYYY'), TO_DATE('26-05-2018', 'DD-MM-YYYY'));
INSERT INTO Rent VALUES (155, 'V1CH16', TO_DATE('29-04-2018', 'DD-MM-YYYY'), TO_DATE('29-05-2018', 'DD-MM-YYYY'));


--FUNCTIONS--
--1--
--CUSTOMER--

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE loginCustomer_library(user IN VARCHAR2, pass IN VARCHAR2)
IS
  passAux customer.password%TYPE;
BEGIN
  SELECT password INTO passAux
  FROM customer
  WHERE username LIKE user;
  
  IF passAux LIKE pass THEN
    DBMS_OUTPUT.PUT_LINE('User ' || user || ' loging succesfull');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Password incorrect');
  END IF;
  
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('User incorrect');
END;
/

DECLARE
  user customer.username%TYPE;
  pass customer.password%TYPE;
BEGIN
  user := &Customer_Username;
  pass := &Customer_Password;
  loginCustomer_library(user,pass);
END;
/

--EMPLOYEE-
CREATE OR REPLACE PROCEDURE loginEmployee_library(user IN VARCHAR2, pass IN VARCHAR2)
IS
  passAux employee.password%TYPE;
BEGIN
  SELECT password INTO passAux
  FROM employee
  WHERE username LIKE user;
  
  IF passAux LIKE pass THEN
    DBMS_OUTPUT.PUT_LINE('User ' || user || ' loging succesfull');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Password incorrect');
  END IF;
  
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('User incorrect');
END;
/

DECLARE
  user employee.username%TYPE;
  pass employee.password%TYPE;
BEGIN
  user := &Employee_Username;
  pass := &Employee_Password;
  loginEmployee_library(user,pass);
END;
/

--2--
CREATE OR REPLACE PROCEDURE viewItem_library(auxItemID IN VARCHAR2)
IS
  auxISBN VARCHAR2(4);
  auxTitle VARCHAR2(50);
  auxYear NUMBER;
  auxState VARCHAR2(10);
  auxDebyCost NUMBER(10,2);
  auxLostCost NUMBER(10,2);
  auxAddress VARCHAR2(50);
  auxAbala VARCHAR2(1);
  auxVideo NUMBER;
  auxBook NUMBER;
BEGIN
  
  SELECT COUNT(*) INTO auxBook
  FROM book
  WHERE bookid LIKE auxItemID;
  
  SELECT COUNT(*) INTO auxVideo
  FROM video
  WHERE videoid LIKE auxItemID;
  
  IF auxBook > 0 THEN
    SELECT isbn, state, avalability, debycost, lostcost, address
    INTO auxISBN, auxState, auxAbala, auxDebyCost, auxLostCost, auxAddress
    FROM book
    WHERE bookid LIKE auxItemID;
  
    DBMS_OUTPUT.PUT_LINE('BOOK ' || auxItemID || ' INFO');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('ISBN: ' || auxISBN);
    DBMS_OUTPUT.PUT_LINE('STATE: ' || auxState);
    DBMS_OUTPUT.PUT_LINE('AVALABILITY: ' || auxAbala);
    DBMS_OUTPUT.PUT_LINE('DEBY COST: ' || auxDebyCost);
    DBMS_OUTPUT.PUT_LINE('LOST COST: ' || auxLostCost);
    DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || auxAddress);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  ELSIF auxVideo > 0 THEN
    SELECT title, year, state, avalability, debycost, lostcost, address
    INTO auxTitle, auxYear, auxState, auxAbala, auxDebyCost, auxLostCost, auxAddress
    FROM video
    WHERE videoid LIKE auxItemID;
  
    DBMS_OUTPUT.PUT_LINE('VIDEO ' || auxItemID || ' INFO');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('TITLE: ' || auxTitle);
    DBMS_OUTPUT.PUT_LINE('YEAR: ' || auxYear);
    DBMS_OUTPUT.PUT_LINE('STATE: ' || auxState);
    DBMS_OUTPUT.PUT_LINE('AVALABILITY: ' || auxAbala);
    DBMS_OUTPUT.PUT_LINE('DEBY COST: ' || auxDebyCost);
    DBMS_OUTPUT.PUT_LINE('LOST COST: ' || auxLostCost);
    DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || auxAddress);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  END IF;
END;
/

/* Item_ID = 2nd column Book and Video Table.
	BookID starts with B (e.g.: 'B1A123')
	VideoId starts with V (e.g. : 'V1CH16')
*/

DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID := &Item_ID;
  viewItem_library(auxItemID);
END;
/

--3--
--CUSTOMER--
CREATE OR REPLACE PROCEDURE customerAccount_library(custoID IN customer.customerid%TYPE)
IS
  auxCard NUMBER;
  auxFines NUMBER;
  auxItem VARCHAR(6);
  rented number := 0;
BEGIN
  SELECT cardnumber INTO auxCard
  FROM customer
  WHERE customerid LIKE custoID;
  
  SELECT COUNT(*) INTO rented
  FROM rent
  WHERE rent.cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user card is ' || auxCard);  
  IF (rented > 0) THEN
    SELECT rent.itemid INTO auxItem
    FROM rent,card
    WHERE card.cardid = rent.cardid
    AND card.cardid LIKE auxCard;    
    
    DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem || ' rented');
  ELSE    
    DBMS_OUTPUT.PUT_LINE('This user has no rents'); 
  END IF;
  
  SELECT fines INTO auxFines
  FROM card
  WHERE cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines);
    
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
END;
/

DECLARE
  custoID customer.customerID%TYPE;
BEGIN
  custoID := &Customer_ID;
  customerAccount_library(custoID);
END;
/

--EMPLOYEE--
CREATE OR REPLACE PROCEDURE employeeAccount_library(emploID IN employee.employeeid%TYPE)
IS
  auxCard NUMBER;
  auxFines NUMBER;
  auxItem VARCHAR(6);
  rented number := 0;
BEGIN
  SELECT cardnumber INTO auxCard
  FROM employee
  WHERE employeeid LIKE emploID;
  
  SELECT COUNT(*) INTO rented
  FROM rent
  WHERE rent.cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user card is ' || auxCard);  
  IF (rented > 0) THEN
    SELECT rent.itemid INTO auxItem
    FROM rent,card
    WHERE card.cardid = rent.cardid
    AND card.cardid LIKE auxCard;    
    
    DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem || ' rented');
  ELSE    
    DBMS_OUTPUT.PUT_LINE('This user has no rents'); 
  END IF;
  
  SELECT fines INTO auxFines
  FROM card
  WHERE cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines);
    
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
END;
/

DECLARE
  emploID employee.employeeID%TYPE;
BEGIN
  emploID := &Employee_ID;
  employeeAccount_library(emploID);
END;
/

--4--
CREATE OR REPLACE PROCEDURE rentItem_library(auxCard IN NUMBER, auxItemID IN VARCHAR2, itemType IN VARCHAR2, auxDate IN VARCHAR2)
IS
  statusAux VARCHAR2(1);
  itemStatus VARCHAR2(1);
BEGIN
  
  SELECT status INTO statusAux
  FROM card
  WHERE cardid LIKE auxCard;
  
  IF statusAux LIKE 'A' THEN
    IF itemType LIKE 'book' THEN
      SELECT avalability INTO itemStatus
      FROM book
      WHERE bookid LIKE auxItemID;
      
      IF itemStatus LIKE 'A' THEN
        UPDATE book
        SET avalability = 'O'
        WHERE bookid LIKE auxItemID;
        
        INSERT INTO rent
        VALUES (auxCard,auxItemID,sysdate,TO_DATE(auxDate, 'DD-MON-RR'));
        DBMS_OUTPUT.PUT_LINE('Item ' || auxItemID || ' rented');
      ELSE
        DBMS_OUTPUT.PUT_LINE('The item is already rented');
      END IF;
      
    ELSIF itemType LIKE 'video' THEN
     
      SELECT avalability INTO itemStatus
      FROM video
      WHERE videoid LIKE auxItemID;
      
      IF itemStatus LIKE 'A' THEN
        UPDATE video
        SET avalability = 'O'
        WHERE videoid LIKE auxItemID;
        
        INSERT INTO rent
        VALUES (auxCard,auxItemID,sysdate,TO_DATE(auxDate, 'DD-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Item ' || auxItemID || ' rented');
      ELSE
        DBMS_OUTPUT.PUT_LINE('The item is already rented');
      END IF;
    END IF;
    
  ELSE
    DBMS_OUTPUT.PUT_LINE('The user is blocked');
  END IF;    
END;
/

/*
if Problem to INSERT Return DATE, check this command without quotes 'show parameters nls_date_format;' for your system's DATE format
*/
DECLARE
  auxCard NUMBER;
  auxItemID VARCHAR2(10);
  itemType VARCHAR2(20);
  auxDate VARCHAR2(20);
BEGIN
  auxCard := &Card_ID;
  itemType := &Item_Type_book_or_video;  
  auxItemID := &ID_Item;  
  auxDate := &Return_date;
  rentItem_library(auxCard,auxItemID,itemType,auxDate);
END;
/

--5--
CREATE OR REPLACE PROCEDURE payFines_library(auxCard IN card.cardID%TYPE, money IN NUMBER)
IS
  finesAmount NUMBER;
  total NUMBER;
BEGIN
  SELECT fines INTO finesAmount
  FROM card
  WHERE cardID LIKE auxCard;
  
  IF finesAmount < money THEN
    total := money - finesAmount;
    DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES AND YOU HAVE ' || total || ' MONEY BACK');
    
    UPDATE card
    SET status = 'A', fines = 0
    WHERE cardid = auxCard;
    
  ELSIF finesAmount = money THEN
    total := money - finesAmount;
    DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES');
    
    UPDATE card
    SET status = 'A', fines = 0
    WHERE cardid = auxCard;
  
  ELSE
    total := finesAmount - money;
    DBMS_OUTPUT.PUT_LINE('YOU WILL NEED TO PAY ' || total || ' MORE DOLLARS TO UNLOCK YOUR CARD');
    
    UPDATE card
    SET fines = total
    WHERE cardid = auxCard;
  END IF;
END;
/

DECLARE
  auxCard card.cardid%TYPE;
  money NUMBER;
BEGIN
  auxCard := &Card_ID;
  money := &Money_To_Pay;
  payFines_library(auxCard,money);
END;
/

