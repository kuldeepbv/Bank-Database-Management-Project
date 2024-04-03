CREATE TABLE Manager (
    Manager_Id INTEGER PRIMARY KEY NOT NULL,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL
);

Create Table Branch(
	Branch_Id INTEGER PRIMARY KEY NOT NULL,
	Branch_name VARCHAR(50) NOT NULL,
	Address TEXT,
	Phone_number VARCHAR(50),
	Manager_Id INTEGER NOT NULL,
	FOREIGN KEY (Manager_Id) REFERENCES Manager(Manager_Id)
);


CREATE TABLE Customer (
    Customer_ID INTEGER PRIMARY KEY NOT NULL,
    First_name VARCHAR(50)NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Address TEXT ,
    Branch_ID INTEGER NOT NULL,
    Date_of_birth DATE,
    Phone_number VARCHAR(50),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_Id)
);

CREATE TABLE Loan (
    Loan_Id INTEGER PRIMARY KEY,
    Loan_Amount BIGINT NOT NULL DEFAULT 0,
    Customer_ID INTEGER NOT NULL,
    Interest_rate REAL,
    Status VARCHAR(50),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Account_info (
    Account_Number BIGINT PRIMARY KEY NOT NULL,
    Customer_ID INTEGER NOT NULL,
    Account_type VARCHAR(50),
    Account_Status VARCHAR(50),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Account_balance (
    Account_Number BIGINT NOT NULL,
    Balance BIGINT NOT NULL DEFAULT 500,
    FOREIGN KEY (Account_Number) REFERENCES Account_info(Account_Number)
);

ALTER TABLE Account_balance
ADD CONSTRAINT CHK_Balance CHECK (Balance >= 0);


CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
SELECT * FROM pg_extension WHERE extname = 'uuid-ossp';

CREATE TABLE TRANSACTIONS (
    Transaction_ID UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    Self_acc_num BIGINT,
    Receiver_acc_num BIGINT,
    Amount BIGINT NOT NULL,
    Transaction_type VARCHAR(255) NOT NULL
);

CREATE TABLE Employee_pos (
    Position TEXT PRIMARY KEY ,
    Salary BIGINT
);


CREATE TABLE Employee_info (
    Employee_ID INTEGER PRIMARY KEY NOT NULL,
    First_name VARCHAR(50) ,
    Last_name VARCHAR(50),
    Salary BIGINT,
    Position_name TEXT,
    Branch_ID INTEGER NOT NULL,
    FOREIGN KEY (Position_name) REFERENCES Employee_pos(Position_name),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_Id)
);