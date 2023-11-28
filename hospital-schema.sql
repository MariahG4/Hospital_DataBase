DROP DATABASE IF EXISTS hospital; 
CREATE DATABASE hospital; 
USE hospital; 
 
CREATE TABLE Patient( 
    Patient_ID INT PRIMARY KEY, 
    Name VARCHAR(100), 
    Address VARCHAR(100), 
    Phone_Number VARCHAR(20), 
    Room_Number INT 
); 


CREATE TABLE Physician( 
    Physician_ID INT PRIMARY KEY, 
    Name VARCHAR(100), 
    Certification_Number INT, 
    Expertise_Field VARCHAR(100), 
    Address VARCHAR(100), 
    Phone_Number VARCHAR(20) 
); 

CREATE TABLE Nurse( 
    Nurse_ID INT PRIMARY KEY, 
    Name VARCHAR(100), 
    Certification_Number INT, 
    Address VARCHAR(100), 
    Phone_Number VARCHAR(20) 
); 

CREATE TABLE Room( 
    Room_Number INT PRIMARY KEY, 
    Capacity INT, 
    Fee DECIMAL(10, 2) 
); 

CREATE TABLE Instruction( 
    Instruction_Code INT PRIMARY KEY, 
    Description TEXT, 
    Fee DECIMAL(10, 2) 
); 

CREATE TABLE Orders( 
    Date DATE, 
    Instruction_Code INT, 
    Patient_ID INT, 
    Physician_ID INT, 
    FOREIGN KEY (Physician_ID) REFERENCES Physician(Physician_ID), 
    FOREIGN KEY (Instruction_Code) REFERENCES Instruction(Instruction_Code), 
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) 
); 

CREATE TABLE Monitored_By( 
    Physician_ID INT, 
    Patient_ID INT, 
    FOREIGN KEY (Physician_ID) REFERENCES Physician(Physician_ID), 
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) 
); 

CREATE TABLE Hospitalized_In( 
    Admission_Date DATE, 
    Discharge_Date DATE, 
    Room_Number INT, 
    Patient_ID INT, 
    FOREIGN KEY (Room_Number) REFERENCES Room(Room_Number), 
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) 
); 

CREATE TABLE Health_Record( 
    Record_ID INT PRIMARY KEY, 
    Patient_ID INT, 
    Disease VARCHAR(100), 
    Date DATE, 
    Status VARCHAR(100), 
    Description TEXT, 
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) 
); 

CREATE TABLE Medication( 
    Medication_ID INT PRIMARY KEY, 
    Patient_ID INT, 
    Amount_Daily INT, 
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) 
); 

CREATE TABLE Invoice( 
    Invoice_ID INT PRIMARY KEY, 
    Patient_ID INT, 
    Total_Amount DECIMAL(10, 2), 
    Date_Issued DATE, 
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) 
); 

CREATE TABLE Payment( 
    Payment_ID INT PRIMARY KEY, 
    Invoice_ID INT, 
    Amount DECIMAL(10, 2), 
    Date_Paid DATE, 
    FOREIGN KEY (Invoice_ID) REFERENCES Invoice(Invoice_ID) 
); 

CREATE TABLE Payable ( 
    Payable_ID INT PRIMARY KEY, 
    Patient_ID INT, 
    Invoice_ID INT, 
    Item_Description TEXT, 
    Amount DECIMAL(10, 2), 
    Date_Issued DATE, 
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID), 
    FOREIGN KEY (Invoice_ID) REFERENCES Invoice(Invoice_ID) 
); 

