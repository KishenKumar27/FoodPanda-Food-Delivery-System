-- Creation of Tables and Data insertion

Drop Table Rider;

Create Table Rider
(
    Rider_ID VARCHAR2(10) NOT NULL,
    Rider_Name VARCHAR2(30),
    Rider_Age NUMBER(5),
    Rider_Vehicle VARCHAR2(10),
    PRIMARY KEY (Rider_ID)
);

INSERT INTO Rider values('FP0001', 'Lisa', 25, 'Car');
INSERT INTO Rider values('FP0002', 'Ming', 20, 'Motorbike');
INSERT INTO Rider values('FP0003', 'Yusof', 30, 'Car');
INSERT INTO Rider values('FP0004', 'Kumar', 23, 'Car');
INSERT INTO Rider values('FP0005', 'Naquib', 27, 'Motorbike');

SELECT * FROM Rider;

Drop Table Customer;

CREATE TABLE Customer
(
Customer_ID varchar2(10) NOT NULL,
Customer_Name varchar2(30),
Customer_Address varchar2(50),
Customer_Order varchar2(100),
Customer_Phone number(30),
Customer_Email varchar2(30),
PRIMARY KEY (Customer_ID)
);

INSERT INTO Customer values ('CS-0001', 'Sally', '15, Rose Park, Shah Alam', 'cust order', 60197630287, 'sally123@gmail.com');
INSERT INTO Customer values ('CS-0002', 'Noah', 'Lot 7, Taman Mahkota, Subang Jaya', 'cust order', 60172397183, 'n0ah_3@gmail.com');
INSERT INTO Customer values ('CS-0003', 'Ron', '9, Flat A, Presint 9, Putrajaya', 'cust order', 60106501230, 'ronw3asley@gmail.com');
INSERT INTO Customer values ('CS-0004', 'Luna', 'No 01-19, Jalan Pertama, Cheras', 'cust order', 60137650189, 'lovegood30@gmail.com');
INSERT INTO Customer values ('CS-0005', 'Ginny', '05, Seksyen 23, Damansara', 'cust order', 60123458970, 'g_ny650@gmail.com');

SELECT * from Customer;

Drop Table Ordr;

Create Table Ordr
(
   Order_ID VARCHAR2(10) PRIMARY KEY NOT NULL,
   Order_Date DATE,
   Order_Price NUMBER(7,2),
   Order_Timeframe CHAR(10),
   Customer_ID VARCHAR2(10),
   Rider_ID VARCHAR2(10),
   FOREIGN KEY (Customer_ID) REFERENCES Customer,
   FOREIGN KEY (Rider_ID) REFERENCES Rider
);

INSERT INTO Ordr values('#b1bx-2pd8','01-Jan-2021',9.76,'11:50:32','CS-0001', 'FP0001');
INSERT INTO Ordr values('#k3fy-5fg3','03-Jan-2021',11.80,'10:47:34','CS-0002','FP0002');
INSERT INTO Ordr values('#m3kz-7zl5','05-Jan-2021',8.30,'09:23:55','CS-0003','FP0003');
INSERT INTO Ordr values('#r3nf-9ew9','07-Jan-2021',7.75,'12:30:42','CS-0004','FP0004');
INSERT INTO Ordr values('#q3ar-1hj2','11-Jan-2021',5.50,'07:13:27','CS-0005','FP0005');
INSERT INTO Ordr VALUES('#m4tv-9jt4', '12-FEB-2021', 16.80, '13:30:45', 'CS-0002','FP0001');
INSERT INTO Ordr VALUES('#f3ku-0rd7', '24-FEB-2021', 20.20, '15:00:30', 'CS-0003','FP0005');
INSERT INTO Ordr VALUES('#h1qw-7vg8', '09-MAR-2021', 16.30, '11:23:44', 'CS-0004','FP0003');
INSERT INTO Ordr VALUES('#n7rs-3ju6', '21-MAR-2021', 12.90, '18:45:53', 'CS-0002','FP0001');

SELECT * FROM Ordr;

Drop Table Restaurant;

CREATE TABLE Restaurant
(
    Restaurant_ID VARCHAR2(10) NOT NULL,
    Restaurant_Name VARCHAR2(30),
    Restaurant_Rate NUMBER(5,1) CHECK (Restaurant_Rate BETWEEN 0.0 AND 5.0),
    Restaurant_Type VARCHAR2(20),
    Restaurant_Address VARCHAR(50),
    PRIMARY KEY (Restaurant_ID)
);

INSERT INTO Restaurant values('FRP 1101', 'McDonalds', 4.8, 'Fast Food',
                                'Bandar Sri Damansara, Kuala Lumpur');
INSERT INTO Restaurant values('FRP 1102', 'Dominos Pizza', 4.8, 'Pizza',
                                'Cyberjaya, Selangor');
INSERT INTO Restaurant values('FRP 1103', 'Secret Recipe', 2.5, 'Dessert', 
                                'Tesco Semenyih, Selangor');
INSERT INTO Restaurant values('FRP 1104', 'Sushi Zanmai', 3.0, 'Asian', 
                                'NU Sentral, Kuala Lumpur');
INSERT INTO Restaurant values('FRP 1105', 'KFC', 4.0, 'Fast Food', 
                                'The Curve, Selangor');
INSERT INTO Restaurant values('FRP 1106', 'Tealive', 3.9, 'Beverage', 
                                'IOI City Mall, Selangor');
INSERT INTO Restaurant values('FRP 1107', 'Starbucks', 4.0, 'Beverage', 
                                'TTDI, Kuala Lumpur');


SELECT * FROM Restaurant;

Drop Table Payment;

CREATE TABLE Payment
(
  Payment_ID VARCHAR2(10) PRIMARY KEY NOT NULL,
  Payment_Method VARCHAR2(20),
  Payment_Date DATE,
  Order_ID VARCHAR2(10),
  Amount_Paid NUMBER(7,2),
  FOREIGN KEY (Order_ID) REFERENCES Ordr
);

INSERT INTO Payment VALUES('P-15011','Cash On Delivery','01-Jan-2021','#b1bx-2pd8',9.76);
INSERT INTO Payment VALUES('P-15012','Debit Card','03-Jan-2021','#k3fy-5fg3',11.80);
INSERT INTO Payment VALUES('P-15013','Paypal','05-Jan-2021','#m3kz-7zl5',8.30);
INSERT INTO Payment VALUES('P-15014','Credit Card','07-Jan-2021','#r3nf-9ew9',7.75);
INSERT INTO Payment VALUES('P-15015','Cash On Delivery','11-Jan-2021','#q3ar-1hj2',5.50);

SELECT * FROM Payment;

Drop Table Feedback

CREATE TABLE Feedback
(
  Feedback_ID number(5) PRIMARY KEY NOT NULL,
  Feedback_Rating NUMBER(5,1) CHECK (Feedback_Rating BETWEEN 0.0 AND 5.0),
  Order_ID VARCHAR2(10),
  FOREIGN KEY (Order_ID) REFERENCES Ordr
);

Drop Sequence seq_feedback;

CREATE SEQUENCE seq_feedback
MINVALUE 100
START WITH 100
INCREMENT BY 1
CACHE 10;

INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID) Values(seq_feedback.nextval,4.5,'#b1bx-2pd8');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID) Values(seq_feedback.nextval,4.2,'#k3fy-5fg3');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID) Values(seq_feedback.nextval,3.5,'#m3kz-7zl5');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID) Values(seq_feedback.nextval,3.1,'#r3nf-9ew9');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID) Values(seq_feedback.nextval,2.0,'#q3ar-1hj2');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID) Values(seq_feedback.nextval,4.4,'#m4tv-9jt4');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID) Values(seq_feedback.nextval,3.2,'#f3ku-0rd7');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID) Values(seq_feedback.nextval,2.5,'#h1qw-7vg8');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID) Values(seq_feedback.nextval,4.0,'#n7rs-3ju6');

SELECT * FROM Feedback;

Drop Table Promotion;

CREATE TABLE Promotion
(
    Promotion_ID VARCHAR2(10) PRIMARY KEY NOT NULL,
    Promotion_Feature VARCHAR2(100),
    Promotion_Expiry DATE
);

INSERT INTO Promotion VALUES('PFP 9001', '20% Off on chicken type vendor', 
                                '15-Sep-2021');
INSERT INTO Promotion VALUES('PFP 9002', 'Buy 1 Free 1 in Tealive', 
                                '30-Mar-2021');
INSERT INTO Promotion VALUES('PFP 9003', '50% Off for buying more than RM 100', 
                                '28-Feb-2021');
INSERT INTO Promotion VALUES('PFP 9004', '50% Off for celebrating the festive season', 
                                '20-May-2021');
INSERT INTO Promotion VALUES('PFP 9005', '20% Off for buying food from any fast food restaurant', 
                                '31-Aug-2021');
                                
SELECT * FROM Promotion;

Drop Table Menu;

CREATE TABLE Menu
(
  Menu_ID VARCHAR2(10) PRIMARY KEY NOT NULL,
  Restaurant_ID VARCHAR2(10),
  Menu_Name VARCHAR2(30),
  Menu_Price NUMBER(7,2),
  FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant
);

INSERT INTO Menu VALUES ('MFP 1000', 'FRP 1107', 'Green Tea Creme Frappuchino', 18.55);
INSERT INTO Menu VALUES ('MFP 1010', 'FRP 1101', 'Spicy Chicken McDeluxe', 9.95);
INSERT INTO Menu VALUES ('MFP 1020', 'FRP 1106', 'Original Pearl Milk Tea', 8.55);
INSERT INTO Menu VALUES ('MFP 1030', 'FRP 1105', 'Snack Plate Combo', 15.30);
INSERT INTO Menu VALUES ('MFP 1040', 'FRP 1103', 'Marble Cheese Cake', 11.30);
INSERT INTO Menu VALUES ('MFP 1050', 'FRP 1102', 'Beef Pepperoni Pizza', 20.20);
INSERT INTO Menu VALUES ('MFP 1060', 'FRP 1103', 'Kimchi Fried Rice With Egg', 12.90);
INSERT INTO Menu VALUES ('MFP 1070', 'FRP 1107', 'Very Berry Strawberry', 11.55);
INSERT INTO Menu VALUES ('MFP 1080', 'FRP 1104', 'Salmon Mentai Roll', 16.80);
INSERT INTO Menu VALUES ('MFP 1090', 'FRP 1105', '3-PC Chicken Combo Set', 16.30);

SELECT * FROM Menu;

Drop Table Order_Menu

CREATE TABLE Order_Menu (
   OrderMenu_ID VARCHAR2(10) PRIMARY KEY NOT NULL,
   Order_ID VARCHAR2(10),
   Menu_ID VARCHAR2(10),
   FOREIGN KEY (Order_ID) REFERENCES Ordr,
   FOREIGN KEY (Menu_ID) REFERENCES Menu   
);

INSERT INTO Order_Menu VALUES('OM 5000','#b1bx-2pd8','MFP 1000');
INSERT INTO Order_Menu VALUES('OM 5001','#k3fy-5fg3','MFP 1010');
INSERT INTO Order_Menu VALUES('OM 5002','#m3kz-7zl5','MFP 1020');
INSERT INTO Order_Menu VALUES('OM 5003','#r3nf-9ew9','MFP 1030');
INSERT INTO Order_Menu VALUES('OM 5004','#q3ar-1hj2','MFP 1040');
INSERT INTO Order_Menu VALUES('OM 5005','#m4tv-9jt4','MFP 1080');
INSERT INTO Order_Menu VALUES('OM 5006','#f3ku-0rd7','MFP 1050');
INSERT INTO Order_Menu VALUES('OM 5007','#h1qw-7vg8','MFP 1090');
INSERT INTO Order_Menu VALUES('OM 5008','#n7rs-3ju6','MFP 1060');


SELECT * FROM Order_Menu;

Drop Table Promo_Order

CREATE TABLE Promo_Order(
   Promotion_ID VARCHAR2(10) NOT NULL,
   Order_ID VARCHAR2(10) NOT NULL,
   Discount NUMBER(5,2),
   PRIMARY KEY(Promotion_ID,Order_ID),
   FOREIGN KEY (Promotion_ID) REFERENCES Promotion,
   FOREIGN KEY (Order_ID) REFERENCES Ordr
);

INSERT INTO Promo_Order VALUES ('PFP 9001','#b1bx-2pd8',0.20);
INSERT INTO Promo_Order VALUES ('PFP 9002','#k3fy-5fg3',0.50);
INSERT INTO Promo_Order VALUES ('PFP 9003','#m3kz-7zl5',0.50);
INSERT INTO Promo_Order VALUES ('PFP 9004','#r3nf-9ew9',0.50);
INSERT INTO Promo_Order VALUES ('PFP 9005','#q3ar-1hj2',0.20);

SELECT * FROM Promo_Order;

-- Data Manipulation
-- Aggregate Function

-- To display the description of the most expensive menu in the list
SELECT Menu_ID, Menu_Name, Menu_Price
FROM Menu                     
WHERE Menu_Price 
BETWEEN (SELECT MIN(Menu_Price) FROM Menu) AND 22 
AND Menu_Price = (SELECT MAX(Menu_Price) FROM Menu)

-- To display the payment id and the number of times it has been used to pay a minimum
--amount of money where the amount of money has been found in a subset of listed
--values.
SELECT Payment_ID, COUNT(PAYMENT_ID), MIN(Amount_Paid)
FROM Payment
GROUP BY Payment_ID
HAVING MIN(Amount_Paid) IN(5.50,7.75,8.30)

-- To display the vehicle type with the number of usage by the riders respectively.
SELECT Rider_Vehicle, COUNT(*) AS Total
FROM Rider
GROUP BY Rider_Vehicle
HAVING COUNT(*) > 2;


-- Query with a group by and having clauses
-- To display the number of deliveries that must be more than 1 which has been made by
-- some riders and also it is counted in ascending order.
SELECT
    Rider_Name,
    COUNT(*) AS num_deliveries
FROM
    Rider r INNER JOIN Ordr o 
    ON r.Rider_ID = o.Rider_ID
GROUP BY
    Rider_Name
HAVING
    COUNT(*) > 1
ORDER BY 
    num_deliveries;

-- To display the number of orders that must be more than 1 which has been made by
--some customers and the date of order must be in the range of 2-Jan-2021 till
--25-Feb-2021

SELECT Customer.Customer_Name, COUNT(Ordr.Order_ID) AS NumberOfOrders
FROM Ordr
LEFT JOIN Customer ON Ordr.Customer_ID = Customer.Customer_ID
WHERE Order_Date BETWEEN '2-Jan-2021' AND '25-Feb-2021'
GROUP BY Customer_Name
HAVING COUNT(Ordr.Order_ID) > 1;


-- To display the total price of the orders made by the customers respectively, The total
-- price must be less than RM20 and also the customer name must contain the character
-- ‘n’.

SELECT c.Customer_Name, SUM (o.Order_Price)
FROM Customer c, Ordr o
WHERE c.Customer_ID = o.Customer_ID
AND Customer_Name LIKE '%n%' 
AND Order_Price IS NOT NULL 
Group By c.Customer_Name
Having SUM(o.Order_Price) < 20


-- Not covered in lecture

--Auto-incrementing number data type will be used when we create the sequence and it
--will start the value as 100 for Feedback_ID and it automatically increments the value
--by 1 after the insertion of new data.

CREATE SEQUENCE seq_feedback
MINVALUE 100
START WITH 100
INCREMENT BY 1
CACHE 10;

INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID)
Values(seq_feedback.nextval,4.5,'#b1bx-2pd8');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID)
Values(seq_feedback.nextval,4.2,'#k3fy-5fg3');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID)
Values(seq_feedback.nextval,3.5,'#m3kz-7zl5');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID)
Values(seq_feedback.nextval,3.1,'#r3nf-9ew9');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID)
Values(seq_feedback.nextval,2.0,'#q3ar-1hj2');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID)
Values(seq_feedback.nextval,4.4,'#m4tv-9jt4');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID)
Values(seq_feedback.nextval,3.2,'#f3ku-0rd7');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID)
Values(seq_feedback.nextval,2.5,'#h1qw-7vg8');
INSERT INTO Feedback (Feedback_ID, Feedback_Rating, Order_ID)
Values(seq_feedback.nextval,4.0,'#n7rs-3ju6');
