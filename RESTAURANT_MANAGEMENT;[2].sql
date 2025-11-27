CREATE DATABASE RESTAURANT_MANAGEMENT;
USE RESTAURANT_MANAGEMENT;

CREATE TABLE CUSTOMER_RECORD (
    CUSTOMER_ID INT AUTO_INCREMENT PRIMARY KEY,
    FIRST_NAME VARCHAR(50) NOT NULL,
    LAST_NAME VARCHAR(50) NOT NULL,
    GENDER VARCHAR(50) NOT NULL,
    DATE_OF_BIRTH DATE NOT NULL,
    CUSTOMER_ORDER VARCHAR(100) NOT NULL
);

CREATE TABLE LINK_SIGNUP(
    LINK_SIGNUP_ID INT AUTO_INCREMENT PRIMARY KEY,
    EMAIL VARCHAR(50) NOT NULL,
    PASSWORD INT(20) NOT NULL,
    CONFIRM_PASSWORD INT NOT NULL
);

CREATE TABLE LINK_SURVEY(
    LINK_SURVEY_ID INT AUTO_INCREMENT PRIMARY KEY,
    MEAT VARCHAR(10) NOT NULL,
    PICKY VARCHAR(10) NOT NULL,
    DIET VARCHAR(10) NOT NULL,
    COMPLEXION VARCHAR(20) NOT NULL,
    GLUCOSE VARCHAR(10) NOT NULL,
    ALLEGY VARCHAR(50) NOT NULL
);

CREATE TABLE LINK_STAFF_SIGNUP(
    LINK_STAFF_SIGNUP_ID INT AUTO_INCREMENT PRIMARY KEY,
    EMAIL VARCHAR(50) NOT NULL,
    PASSWORD INT(20) NOT NULL,
    CONFIRM_PASSWORD INT NOT NULL
);

CREATE TABLE MENU (
    MENU_ID INT AUTO_INCREMENT PRIMARY KEY,
    FOOD_NAME VARCHAR(50) NOT NULL,
    FOOD_COURSE_MEAL VARCHAR(50) NOT NULL,
    SLIP_EXPIRY_DATE DATE NOT NULL,
    ALLERGENS VARCHAR(50) NOT NULL,
    PRICE INT(10) NOT NULL
);

CREATE TABLE BEVERAGE (
    BEVERAGE_ID VARCHAR(50) PRIMARY KEY,
    BEVERAGE_NAME_PG13 VARCHAR(50) NOT NULL,
    BEVERAGE_NAME_PG18 VARCHAR(50) NOT NULL,
    BEVERAGE_WEIGHT VARCHAR(50) NOT NULL, 
    MAXIMUM_BEVERAGE_PER_CUSTOMER INT NOT NULL,
    PRICE INT(10) NOT NULL
);

CREATE TABLE STAFF_INFORMATION (
    STAFF_ID VARCHAR(50) PRIMARY KEY,
    STAFF_NAME VARCHAR(50) NOT NULL,
    STAFF_SURNAME VARCHAR(50) NOT NULL,
    STAFF_DATE_OF_BIRTH DATE NOT NULL,
    FIELD VARCHAR(100) NOT NULL,
    STAFF_SHIFT TIME NOT NULL,
    STAFF_BREAK TIME NOT NULL
);

CREATE TABLE BILLING_DATA (
    BILLING_DATA_ID VARCHAR(25) PRIMARY KEY,
    BILLING_DATA_DATE DATE NOT NULL,
    BILLING_PRICE FLOAT NOT NULL,
    DATE_OF_ORDER DATE NOT NULL
);

CREATE TABLE BOOKING_SCHEDULE (
    BOOKING_SCHEDULE_ID VARCHAR(30) PRIMARY KEY,
    CUSTOMER_ID INT NOT NULL,
    MENU_ID INT NOT NULL,
    BEVERAGE_ID VARCHAR(50) NOT NULL,
    STAFF_ID VARCHAR(50) NOT NULL,
    BILLING_DATA_ID VARCHAR(25) NOT NULL,
    LINK_SIGNUP_ID INT NOT NULL,
    LINK_SURVEY_ID INT NOT NULL,
    LINK_STAFF_SIGNUP INT NOT NULL,
    REVIEW INT(10) NOT NULL,
    BOOKING_DATE DATE,
    KEY (CFOREIGN USTOMER_ID) REFERENCES CUSTOMER_RECORD(CUSTOMER_ID),
    FOREIGN KEY (MENU_ID) REFERENCES MENU(MENU_ID),
    FOREIGN KEY (BEVERAGE_ID) REFERENCES BEVERAGE(BEVERAGE_ID),
    FOREIGN KEY (STAFF_ID) REFERENCES STAFF(STAFF_ID),
    FOREIGN KEY (BILLING_DATA_ID) REFERENCES BILLING_DATA(BILLING_DATA_ID)
    FOREIGN KEY (LINK_SIGNUP_ID) REFERENCES LINK_SIGNUP(LINK_SIGNUP_ID),
    FOREIGN KEY (LINK_SURVEY_ID) REFERENCES LINK_SURVEY(LINK_SURVEY_ID),
    FOREIGN KEY (LINK_STAFF_SIGNUP_ID) REFERENCES LINK_STAFF_SIGNUP(LINK_STAFF_SIGNUP_ID)
);

INSERT INTO CUSTOMER_RECORD (FIRST_NAME, LAST_NAME, GENDER, DATE_OF_BIRTH, CUSTOMER_ORDER) VALUES
('John', 'Smith', 'Male', '1990-05-12', 'Pancakes'),
('Mary', 'Johnson', 'Female', '1988-09-21', 'French Toast'),
('David', 'Brown', 'Male', '1995-02-10', 'Steak and Fries'),
('Linda', 'Taylor', 'Female', '2000-04-08', 'Greek Salad'),
('James', 'Anderson', 'Male', '1987-07-15', 'Fish and Chips'),
('Patricia', 'Thomas', 'Female', '1993-01-11', 'Beef Burger& Chips'),
('Michael', 'Jackson', 'Male', '1982-03-09', 'Chicken Curry & Rice'),
('Sarah', 'White', 'Female', '1999-11-23', 'Margerita Pizza'),
('Robert', 'Harris', 'Male', '1991-06-30', 'Chicken Schnitzel'),
('Jessica', 'Clark', 'Female', '1998-10-14', 'Breakfast Wrap'),
('William', 'Lewis', 'Male', '1994-09-02', 'Omellette & fillings'),
('Nancy', 'Hall', 'Female', '1989-12-19', 'Spaghetti Bolognese'),
('Christopher', 'Young', 'Male', '1992-08-16', 'Roast Beef'),
('Karen', 'Allen', 'Female', '1997-03-22', 'Muesli Yorgurt& fruit'),
('Joshua', 'King', 'Male', '1996-07-05', 'Vegetarian Pizza'),
('Ashley', 'Scott', 'Female', '1993-11-09', 'Easy Crunch'),
('Andrew', 'Green', 'Male', '1985-10-25', 'Pap & Wors'),
('Donna', 'Adams', 'Female', '1991-01-17', 'Bacon & Avocado Sandwich'),
('Steven', 'Nelson', 'Male', '1999-06-11', 'Prawn Pasta'),
('Emily', 'Baker', 'Female', '2001-09-29', 'Avocado Toast');

INSERT INTO MENU (FOOD_NAME, FOOD_COURSE_MEAL, SLIP_EXPIRY_DATE, ALLERGENS,PRICE) VALUES
('Beef Burger & Chips', 'Meal', '2025-12-31', 'Gluten',245.00),
('Chicken Schnitzel', 'Meal', '2025-12-31', 'Gluten',345.00),
('Margherita Pizza', 'Meal', '2025-12-31', 'Dairy',210.00),
('Fish & Chips', 'Meal', '2025-12-31', 'Fish',190.00),
('Greek Salad', 'Meal', '2025-12-31', 'None',295.00),
('Bacon and Avocado Sandwich', 'Meal', '2025-12-31', 'Gluten',185.00),
('Spaghetti Bolognese', 'Meal', '2025-12-31', 'Gluten',165.00),
('Chicken Curry and Rice', 'Meal', '2025-12-31', 'None',145.00),
('Omelette & Fillings', 'Breakfast', '2025-12-31', 'Eggs',200.00),
('Pancakes', 'Breakfast', '2025-12-31', 'Gluten',184.00),
('French Toast', 'Breakfast', '2025-12-31', 'Eggs',176.00),
('Pap & Wors', 'Breakfast', '2025-12-31', 'None',150.00),
('Avocado Toast', 'Breakfast', '2025-12-31', 'Gluten',145.00),
('Muesli Yogurt & Fruit', 'Breakfast', '2025-12-31', 'Dairy',120.00),
('Breakfast Wrap', 'Breakfast', '2025-12-31', 'Gluten',140.00),
('Easy Crunch', 'Breakfast', '2025-12-31', 'Dairy',189.00),
('Vegetarian Pizza', 'Main Course', '2025-12-31', 'Gluten',123.00),
('Seafood Platter', 'Main Course', '2025-12-31', 'Shellfish',170.00),
('Cheeseburger', 'Snack', '2025-12-31', 'Dairy',130.00),
('Prawn Pasta', 'Main Course', '2025-12-31', 'Shellfish'180.00);

INSERT INTO STAFF_INFORMATION (EMPLOYEE_ID, EMPLOYEE_NAME, EMPLOYEE_SURNAME, EMPLOYEE_DATE_OF_BIRTH, FIELD, EMPLOYEE_SHIFT, EMPLOYEE_BREAK,PRICE) VALUES
('E001', 'Chantell', 'Malepe', '2006-07-05', 'Founder', '08:00:00', '12:00:00'),
('E002', 'lesego', 'Moatlhodi', '1990-04-09', 'Head Chef', '10:00:00', '14:00:00'),
('E003', 'Jose', 'katie', '1988-09-23', 'Head Manager', '09:00:00', '13:00:00'),
('E004', 'Nonjabulo', 'Ndlovu', '1992-05-10', 'Staff Manager', '12:00:00', '16:00:00'),
('E005', 'Lucky', 'Sithole', '1991-07-19', 'Chaufer', '07:00:00', '11:00:00'),
('E006', 'Brandon', 'Peterson', '1989-08-25', 'Technical Support', '10:00:00', '14:00:00'),
('E007', 'Rocky', 'Langa', '1994-02-11', 'Waiter', '08:00:00', '12:00:00'),
('E008', 'Katlego', 'Meletsi', '1993-11-30', 'Recepionist', '07:00:00', '11:00:00'),
('E009', 'William', 'Adams', '1986-01-15', 'Dishwasher', '11:00:00', '15:00:00'),
('E010', 'Patricia', 'Young', '1990-03-05', 'Waitress', '09:00:00', '13:00:00'),
('E011', 'Andrew', 'Lewis', '1984-12-18', 'Chef', '08:00:00', '12:00:00'),
('E012', 'Donna', 'Clark', '1996-10-20', 'Hostess', '10:00:00', '14:00:00'),
('E013', 'Joshua', 'Nelson', '1992-07-07', 'Bartender', '12:00:00', '16:00:00'),
('E014', 'Ashley', 'Allen', '1998-11-11', 'Server', '09:00:00', '13:00:00'),
('E015', 'Karen', 'Thomas', '1991-09-01', 'Cashier', '10:00:00', '14:00:00'),
('E016', 'Christopher', 'Baker', '1987-04-29', 'Cook', '07:00:00', '11:00:00'),
('E017', 'Emily', 'Harris', '1995-08-03', 'Cleaner', '13:00:00', '17:00:00'),
('E018', 'Steven', 'Anderson', '1989-06-09', 'Manager', '09:00:00', '13:00:00'),
('E019', 'Nancy', 'Jackson', '1997-12-22', 'Waitress', '08:00:00', '12:00:00'),
('E020', 'David', 'Mitchell', '1988-02-14', 'Chef', '07:00:00', '11:00:00');

INSERT INTO BILLING_DATA (BILLING_DATA_ID, BILLING_DATA_DATE, BILLING_PRICE, DATE_OF_ORDER) VALUES
('BD001', '2025-10-10', 250.50, '2025-10-10'),
('BD002', '2025-10-11', 300.00, '2025-10-11'),
('BD003', '2025-10-09', 180.75, '2025-10-09'),
('BD004', '2025-10-08', 520.20, '2025-10-08'),
('BD005', '2025-10-07', 110.00, '2025-10-07'),
('BD006', '2025-10-06', 260.60, '2025-10-06'),
('BD007', '2025-10-05', 340.40, '2025-10-05'),
('BD008', '2025-10-04', 170.25, '2025-10-04'),
('BD009', '2025-10-03', 295.90, '2025-10-03'),
('BD010', '2025-10-02', 410.10, '2025-10-02'),
('BD011', '2025-10-01', 250.50, '2025-10-01'),
('BD012', '2025-09-30', 380.00, '2025-09-30'),
('BD013', '2025-09-29', 420.00, '2025-09-29'),
('BD014', '2025-09-28', 275.25, '2025-09-28'),
('BD015', '2025-09-27', 150.00, '2025-09-27'),
('BD016', '2025-09-26', 320.80, '2025-09-26'),
('BD017', '2025-09-25', 500.10, '2025-09-25'),
('BD018', '2025-09-24', 260.60, '2025-09-24'),
('BD019', '2025-09-23', 180.20, '2025-09-23'),
('BD020', '2025-09-22', 310.00, '2025-09-22');

INSERT INTO BEVERAGE (BEVERAGE_ID, BEVERAGE_NAME_PG13, BEVERAGE_NAME_PG18, BEVERAGE_WEIGHT, MAXIMUM_BEVERAGE_PER_CUSTOMER,PRICE) VALUES
('B001', 'Apple Juice', 'Beer', '500ml', 3,142.00),
('B002', 'Orange Juice', 'Wine', '350ml', 2,135.00),
('B003', 'Lemonade', 'Whiskey', '400ml', 6,248.00),
('B004', 'Iced Tea', 'Vodka', '300ml', 2,138.00,124.00),
('B005', 'Cola', 'Cider', '500ml', 3,140.00),
('B006', 'Milkshake', 'Gin', '400ml', 4,125.00),
('B007', 'Smoothie', 'Brandy', '450ml', 2,350.00),
('B008', 'Water', 'Rum', '500ml', 2,127.00),
('B009', 'Energy Drink', 'Cocktail', '350ml', 2,165.00),
('B010', 'Caned Drink', 'Tequila', '330ml', 2,143.00),
('B011', 'Fruit Punch', 'Beer', '500ml', 3,170.00),
('B012', 'Mango Juice', 'Champagne', '350ml', 4,135.00),
('B013', 'Berry Smoothie', 'Cognac', '400ml', 2,128.00),
('B014', 'Iced Coffee', 'Red Wine', '400ml', 5,150.00),
('B015', 'Lemon Water', 'White Wine', '500ml', 2,100.00),
('B016', 'Chocolate Milk', 'Rum', '300ml', 2,145.00),
('B017', 'Vanilla Shake', 'Whiskey', '400ml', 2,250.00),
('B018', 'Herbal Tea', 'Beer', '350ml', 3,200.00),
('B019', 'Soda Water', 'Gin', '500ml', 2,100.00),
('B020', 'Coconut Water', 'Cider', '450ml', 3,129.00);

INSERT INTO BOOKING_SCHEDULE (BOOKING_SCHEDULE_ID, CUSTOMER_ID, MENU_ID, BEVERAGE_ID, EMPLOYEE_ID, BILLING_DATA_ID, REVIEW, BOOKING_DATE) VALUES
('BS001', 1, 1, 'B001', 'E001', 'BD001', 5, '2025-10-10'),
('BS002', 2, 2, 'B002', 'E002', 'BD002', 4, '2025-10-11'),
('BS003', 3, 3, 'B003', 'E003', 'BD003', 3, '2025-10-09'),
('BS004', 4, 4, 'B004', 'E004', 'BD004', 5, '2025-10-08'),
('BS005', 5, 5, 'B005', 'E005', 'BD005', 4, '2025-10-07'),
('BS006', 6, 6, 'B006', 'E006', 'BD006', 5, '2025-10-06'),
('BS007', 7, 7, 'B007', 'E007', 'BD007', 3, '2025-10-05'),
('BS008', 8, 8, 'B008', 'E008', 'BD008', 4, '2025-10-04'),
('BS009', 9, 9, 'B009', 'E009', 'BD009', 5, '2025-10-03'),
('BS010', 10, 10, 'B010', 'E010', 'BD010', 4, '2025-10-02'),
('BS011', 11, 11, 'B011', 'E011', 'BD011', 5, '2025-10-01'),
('BS012', 12, 12, 'B012', 'E012', 'BD012', 3, '2025-09-30'),
('BS013', 13, 13, 'B013', 'E013', 'BD013', 5, '2025-09-29'),
('BS014', 14, 14, 'B014', 'E014', 'BD014', 4, '2025-09-28'),
('BS015', 15, 15, 'B015', 'E015', 'BD015', 3, '2025-09-27'),
('BS016', 16, 16, 'B016', 'E016', 'BD016', 5, '2025-09-26'),
('BS017', 17, 17, 'B017', 'E017', 'BD017', 4, '2025-09-25'),
('BS018', 18, 18, 'B018', 'E018', 'BD018', 5, '2025-09-24'),
('BS019', 19, 19, 'B019', 'E019', 'BD019', 4, '2025-09-23'),
('BS020', 20, 20, 'B020', 'E020', 'BD020', 5, '2025-09-22');

INSERT INTO LINK_SIGNUP (EMAIL, PASSWORD, CONFIRM_PASSWORD) VALUES
('john.smith@gmail.com', '12345678', '12345678'),
('mary.johnson@gmail.com', '23456789', '23456789'),
('david.brown@gmail.com', '34567890', '34567890'),
('linda.taylor@gmail.com', '45678901', '45678901'),
('james.anderson@gmail.com', '56789012', '56789012'),
('patricia.thomas@gmail.com', '67890123', '67890123'),
('michael.jackson@gmail.com', '78901234', '78901234'),
('sarah.white@gmail.com', '89012345', '89012345'),
('robert.harris@gmail.com', '90123456', '90123456'),
('jessica.clark@gmail.com', '11223344', '11223344'),
('william.lewis@gmail.com', '22334455', '22334455'),
('nancy.hall@gmail.com', '33445566', '33445566'),
('christopher.young@gmail.com', '44556677', '44556677'),
('karen.allen@gmail.com', '55667788', '55667788'),
('joshua.king@gmail.com', '66778899', '66778899'),
('ashley.scott@gmail.com', '77889900', '77889900'),
('andrew.green@gmail.com', '88990011', '88990011'),
('donna.adams@gmail.com', '99001122', '99001122'),
('steven.nelson@gmail.com', '10111213', '10111213'),
('emily.baker@gmail.com', '12131415','12131415');

INSERT INTO LINK_STAFF_SIGNUP (EMAIL, PASSWORD, CONFIRM_PASSWORD) VALUES
('chantell@gmail.com', 458291, 458291),
('lesego@gmail.com', 937264, 937264),
('jose@gmail.com', 529184, 529184),
('nonjabulo@gmail.com', 840621, 840621),
('lucky@gmail.com', 290873, 290873),
('brandon@gmail.com', 615904, 615904),
('rocky@gmail.com', 384217, 384217),
('katlego@gmail.com', 910562, 910562),
('william@gmail.com', 746802, 746802),
('patricia@gmail.com', 239615, 239615),
('andrew@gmail.com', 873902, 873902),
('donna@gmail.com', 695143, 695143),
('joshua@gmail.com', 918407, 918407),
('ashley@gmail.com', 207536, 207536),
('karen@gmail.com', 380941, 380941),
('christopher@gmail.com', 742019, 742019),
('emily@gmail.com', 561872, 561872),
('steven@gmail.com', 896204, 896204),
('nancy@gmail.com', 314908, 314908),
('david@gmail.com', 627195,627195);