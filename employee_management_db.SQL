CREATE DATABASE EmployeeManagement;

USE EmployeeManagement;


-- Creating Tables

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20),
    HireDate DATE NOT NULL,
    JobTitle VARCHAR(50),
    Salary DECIMAL(10, 2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(15, 2)
);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    AssignedDate DATE NOT NULL,
    Role VARCHAR(50),
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);


-- Entering data

INSERT INTO Departments (DepartmentName, Location) VALUES
('Human Resources', 'New York'),
('Engineering', 'San Francisco'),
('Sales', 'Chicago'),
('Marketing', 'Boston');

INSERT INTO Employees (FirstName, LastName, Email, PhoneNumber, HireDate, JobTitle, Salary, DepartmentID) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', '2022-01-15', 'HR Manager', 75000.00, 1),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '2021-03-10', 'Software Engineer', 95000.00, 2),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-8765', '2023-06-01', 'Sales Executive', 65000.00, 3),
('Bob', 'Williams', 'bob.williams@example.com', '555-4321', '2022-09-20', 'Marketing Specialist', 70000.00, 4);

INSERT INTO Projects (ProjectName, StartDate, EndDate, Budget) VALUES
('Website Redesign', '2023-01-01', '2023-06-30', 50000.00),
('Product Launch', '2023-02-15', '2023-09-30', 120000.00),
('Employee Training', '2023-03-01', '2023-07-31', 20000.00);

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, AssignedDate, Role) VALUES
(1, 3, '2023-03-01', 'Coordinator'),
(2, 1, '2023-01-15', 'Lead Developer'),
(3, 2, '2023-02-20', 'Sales Lead'),
(4, 2, '2023-02-20', 'Marketing Analyst');


-- Updating data

USE EmployeeManagement;

UPDATE Projects
SET StartDate = '2023-01-10',
    EndDate = '2023-07-15'
WHERE ProjectID = 1;

UPDATE Projects
SET StartDate = '2023-02-20',
    EndDate = '2023-10-01'
WHERE ProjectID = 2;

UPDATE Projects
SET StartDate = '2023-03-05',
    EndDate = '2023-08-15'
WHERE ProjectID = 3;

UPDATE EmployeeProjects
SET Role = 'Project Coordinator'
WHERE EmployeeID = 1 AND ProjectID = 3;

UPDATE EmployeeProjects
SET Role = 'Senior Developer'
WHERE EmployeeID = 2 AND ProjectID = 1;

UPDATE EmployeeProjects
SET Role = 'Lead Sales Executive'
WHERE EmployeeID = 3 AND ProjectID = 2;

UPDATE EmployeeProjects
SET Role = 'Marketing Strategist'
WHERE EmployeeID = 4 AND ProjectID = 2;

