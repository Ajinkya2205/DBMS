Practical no:- 1 

MongoDB Queries: Design and Develop MongoDB Queries using CRUD operations. 
Create collection “student” and 
1. Insert entry of 10 or more students. 
2. select all documents from the collection "student" which satisfying the following condition - 
a. gender of student is male and 
b. class of the student is TE A or 
c. grd_point of the student is greater than equal to 31 with comparison operator. 
3. Select such a documents from the collection "student” who belongs to “Bangalore” and whose age is less than equal to 19. 
4. Update course to “MCA” from collection “student” whose first name is “ Bhakti” 
5. Delete the document from collection student where age is “18” and gender is “ male”. 
6. Delete the document from collection student where last name is Jadhav and belongs to class TE B. 
7. Make statement with nor and other arithmetic operator. 
8. Use save method 


  ANS:-

use schoolDatabase; // Use or create a new database

db.createCollection("student");

1.)	db.student.insertMany([
    { firstName: "John", lastName: "Doe", gender: "male", class: "TE A", age: 20, city: "Mumbai", grd_point: 32, course: "BSc" },
    { firstName: "Alice", lastName: "Smith", gender: "female", class: "TE B", age: 18, city: "Bangalore", grd_point: 28, course: "BSc" },
    { firstName: "Bhakti", lastName: "Patel", gender: "female", class: "TE C", age: 21, city: "Pune", grd_point: 30, course: "BSc" },
    { firstName: "Amit", lastName: "Jadhav", gender: "male", class: "TE B", age: 19, city: "Bangalore", grd_point: 35, course: "BSc" },
    { firstName: "Ravi", lastName: "Kumar", gender: "male", class: "TE A", age: 22, city: "Chennai", grd_point: 29, course: "BSc" },
    { firstName: "Sara", lastName: "Sharma", gender: "female", class: "TE B", age: 18, city: "Bangalore", grd_point: 33, course: "BSc" },
    { firstName: "Raj", lastName: "Singh", gender: "male", class: "TE C", age: 20, city: "Delhi", grd_point: 31, course: "BSc" },
    { firstName: "Priya", lastName: "Khan", gender: "female", class: "TE A", age: 17, city: "Mumbai", grd_point: 26, course: "BSc" },
    { firstName: "Rohan", lastName: "Gupta", gender: "male", class: "TE B", age: 18, city: "Bangalore", grd_point: 27, course: "BSc" },
    { firstName: "Anjali", lastName: "Mehta", gender: "female", class: "TE A", age: 19, city: "Bangalore", grd_point: 34, course: "BSc" }
]);

2.)	 db.student.find({
    $or: [
        { gender: "male", class: "TE A" },
        { grd_point: { $gte: 31 } }
    ]
});

3.)	db.student.find({
    city: "Bangalore",
    age: { $lte: 19 }
});

4.)	db.student.updateOne(
    { firstName: "Bhakti" },
    { $set: { course: "MCA" } }
);



5.)	db.student.deleteOne({
    age: 18,
    gender: "male"
});

6.)	db.student.deleteOne({
    lastName: "Jadhav",
    class: "TE B"
});

7.)	db.student.find({
    $nor: [
        { age: { $gt: 20 } },
        { grd_point: { $lt: 30 } }
    ]
});

8.)	db.student.save({
    _id: ObjectId("document_id_here"), // Use an existing document ID to update or omit for a new document
    firstName: "Maya",
    lastName: "Shah",
    gender: "female",
    class: "TE C",
    age: 20,
    city: "Ahmedabad",
    grd_point: 33,
    course: "BSc"
});


Practical no 2:- 

MongoDB Queries: Design and Develop MongoDB Queries using CRUD operations.
Create collection “student” and 
1.	Insert  entry of 10 or more students

2.	select all documents from the collection "student" which satisfying the following condition -
a.	 gender of student is female or
b.	Class of the student is TE B and
c.	grd_point of the student is greater than equal to 31 with comparison operator. 
3.	Update age to 20 from collection “student” whose first name is “ Riyansh”
4.	Update or save the city to nagpur and State to MH whose last name is “soniminde”
5.	Students have cancelled admission from the college who is belongs to state “KA”.
6.	Delete the document from collection student where First name is Evanshika and age is less than 18.
7.	Make statement with nor and other arithmetic operator.

ANS:- 

1.)	use schoolDatabase; // Use or create a new database

db.createCollection("student");

db.student.insertMany([
    { firstName: "Riya", lastName: "Sharma", gender: "female", class: "TE A", age: 20, city: "Mumbai", state: "MH", grd_point: 32 },
    { firstName: "Aarav", lastName: "Patel", gender: "male", class: "TE B", age: 21, city: "Bangalore", state: "KA", grd_point: 30 },
    { firstName: "Riyansh", lastName: "Verma", gender: "male", class: "TE C", age: 19, city: "Pune", state: "MH", grd_point: 29 },
    { firstName: "Sana", lastName: "Malik", gender: "female", class: "TE B", age: 18, city: "Bangalore", state: "KA", grd_point: 31 },
    { firstName: "Nisha", lastName: "Khan", gender: "female", class: "TE A", age: 20, city: "Chennai", state: "TN", grd_point: 28 },
    { firstName: "Raj", lastName: "Singh", gender: "male", class: "TE B", age: 22, city: "Delhi", state: "DL", grd_point: 31 },
    { firstName: "Evanshika", lastName: "Gupta", gender: "female", class: "TE C", age: 17, city: "Mumbai", state: "MH", grd_point: 25 },
    { firstName: "Priya", lastName: "SoniMinde", gender: "female", class: "TE B", age: 20, city: "Pune", state: "MH", grd_point: 34 },
    { firstName: "Rohit", lastName: "Desai", gender: "male", class: "TE A", age: 21, city: "Bangalore", state: "KA", grd_point: 30 },
    { firstName: "Ananya", lastName: "Mehta", gender: "female", class: "TE A", age: 19, city: "Mumbai", state: "MH", grd_point: 30 }
]);


2.)	db.student.find({
    $or: [
        { gender: "female" },
        { class: "TE B", grd_point: { $gte: 31 } }
    ]
});

3.)	db.student.updateOne(
    { firstName: "Riyansh" },
    { $set: { age: 20 } }
);

4.)	db.student.updateOne(
    { lastName: "SoniMinde" },
    { $set: { city: "Nagpur", state: "MH" } }
);


5.)	db.student.deleteMany({
    state: "KA"
});

6.)	db.student.deleteOne({
    firstName: "Evanshika",
    age: { $lt: 18 }
});

7.)	db.student.find({
    $nor: [
        { age: { $lt: 20 } },
        { grd_point: { $gt: 30 } }
    ]
});



Practical No:-3 

MongoDB - Aggregation and Indexing: Design and Develop MongoDB Queries using aggregation and indexing with suitable example using MongoDB. 
Create collection student{ Rollno ,Name, Class, Div, Subject,Marks, Address}and enter 6 entries or more. And perform the following: 
1. Find average of total marks in TOC. 
2. Find the number of students division wise. 
3. Find students of div B who scored min marks in DBMS. 
4. Find total sum of marks in SPOS of students staying pune 
5. Find the division wise count of students whose DBMS marks. 
6. Find the count of each city. 
7. Create the simple and compound Indexing on column.


Ans:-

1.)	use schoolDatabase;

db.createCollection("student");

db.student.insertMany([
    { Rollno: 1, Name: "Riya Sharma", Class: "TE", Div: "A", Subject: "TOC", Marks: 85, Address: { city: "Mumbai", state: "MH" } },
    { Rollno: 2, Name: "Aarav Patel", Class: "TE", Div: "B", Subject: "DBMS", Marks: 56, Address: { city: "Pune", state: "MH" } },
    { Rollno: 3, Name: "Sara Malik", Class: "TE", Div: "B", Subject: "TOC", Marks: 72, Address: { city: "Bangalore", state: "KA" } },
    { Rollno: 4, Name: "Rohan Gupta", Class: "TE", Div: "A", Subject: "SPOS", Marks: 68, Address: { city: "Pune", state: "MH" } },
    { Rollno: 5, Name: "Priya Soni", Class: "TE", Div: "B", Subject: "DBMS", Marks: 92, Address: { city: "Pune", state: "MH" } },
    { Rollno: 6, Name: "Raj Desai", Class: "TE", Div: "A", Subject: "TOC", Marks: 65, Address: { city: "Delhi", state: "DL" } }
]);

2.)	db.student.aggregate([
    { $match: { Subject: "TOC" } },
    { $group: { _id: "$Subject", averageMarks: { $avg: "$Marks" } } }
]);

db.student.aggregate([
    { $group: { _id: "$Div", studentCount: { $sum: 1 } } }
]);

db.student.aggregate([
    { $match: { Div: "B", Subject: "DBMS" } },
    { $group: { _id: "$Div", minMarks: { $min: "$Marks" }, students: { $push: "$Name" } } }
]);

db.student.aggregate([
    { $match: { Subject: "SPOS", "Address.city": "Pune" } },
    { $group: { _id: "$Address.city", totalMarks: { $sum: "$Marks" } } }
]);

db.student.aggregate([
    { $match: { Subject: "DBMS" } },
    { $group: { _id: "$Div", count: { $sum: 1 } } }
]);

db.student.aggregate([
    { $group: { _id: "$Address.city", cityCount: { $sum: 1 } } }
]);



3.)	db.student.createIndex({ Name: 1 });

db.student.createIndex({ Class: 1, Div: 1 });


Practical no:- 4 

MongoDB - Aggregation and Indexing: Design and Develop MongoDB Queries using aggregation and indexing with suitable example using MongoDB.

Create collection student{ Rollno ,Name, Class, Div, Subject, Marks, Address} and enter 6 entries or more. And perform the following:

1.	Find the maximum marks of student in DS who stay in the same city
2.	Calculates the average of given marks.
3.	Inserts the any value to an array in the resulting document.
4.	Create a simple and compound index on name and class.
5.	Delete index of name.
6.	Implement aggregation pipeline using pipeline operations(example : $sort, $ match ,$group etc in single statement)


ANS:-  

1.)	use schoolDatabase;

db.createCollection("student");

db.student.insertMany([
    { Rollno: 1, Name: "Riya Sharma", Class: "TE", Div: "A", Subject: "DS", Marks: 85, Address: { city: "Mumbai", state: "MH" } },
    { Rollno: 2, Name: "Aarav Patel", Class: "TE", Div: "B", Subject: "DS", Marks: 78, Address: { city: "Mumbai", state: "MH" } },
    { Rollno: 3, Name: "Sara Malik", Class: "TE", Div: "A", Subject: "DS", Marks: 92, Address: { city: "Pune", state: "MH" } },
    { Rollno: 4, Name: "Rohan Gupta", Class: "TE", Div: "A", Subject: "SPOS", Marks: 68, Address: { city: "Pune", state: "MH" } },
    { Rollno: 5, Name: "Priya Soni", Class: "TE", Div: "B", Subject: "DS", Marks: 89, Address: { city: "Pune", state: "MH" } },
    { Rollno: 6, Name: "Raj Desai", Class: "TE", Div: "A", Subject: "SPOS", Marks: 75, Address: { city: "Delhi", state: "DL" } }
]);


2.)	db.student.aggregate([
    { $match: { Subject: "DS" } },
    { $group: { _id: "$Address.city", maxMarks: { $max: "$Marks" } } }
]);
db.student.aggregate([
    { $group: { _id: null, averageMarks: { $avg: "$Marks" } } }
]);

db.student.aggregate([
    { $group: { _id: "$Div", students: { $push: "$Name" } } }
]);



3.)	db.student.createIndex({ Name: 1 });

db.student.createIndex({ Name: 1, Class: 1 });

db.student.dropIndex({ Name: 1 });


4.)	db.student.aggregate([
    { $match: { Class: "TE" } },
    { $group: { _id: "$Subject", maxMarks: { $max: "$Marks" } } },
    { $sort: { maxMarks: -1 } }
]);


Practical no 5:- 

Write mapreduce function on students info collection to find the number of students who scored more than 70 marks in DBMS as “ Highscores”,less than 70 marks but greater than 40 marks as “Average scores” and less than 40 marks as “Failed.
And also perform any other mapreduce fuction according to you.


ANS:-

db.students_info.insertMany([
    { Rollno: 1, Name: "Riya Sharma", Subject: "DBMS", Marks: 85 },
    { Rollno: 2, Name: "Aarav Patel", Subject: "DBMS", Marks: 56 },
    { Rollno: 3, Name: "Sara Malik", Subject: "DBMS", Marks: 92 },
    { Rollno: 4, Name: "Rohan Gupta", Subject: "DBMS", Marks: 68 },
    { Rollno: 5, Name: "Priya Soni", Subject: "DBMS", Marks: 33 },
    { Rollno: 6, Name: "Raj Desai", Subject: "DBMS", Marks: 75 },
    { Rollno: 7, Name: "Ananya Verma", Subject: "DBMS", Marks: 40 },
]);


var mapFunction = function() {
    if (this.Subject === "DBMS") {
        if (this.Marks > 70) {
            emit("Highscores", 1);
        } else if (this.Marks > 40 && this.Marks <= 70) {
            emit("Average scores", 1);
        } else {
            emit("Failed", 1);
        }
    }
};


var reduceFunction = function(key, values) {
    return Array.sum(values);
};

db.students_info.mapReduce(
    mapFunction,
    reduceFunction,
    { out: "dbms_score_categories" }
);

// Display the results
db.dbms_score_categories.find();

var mapFunctionTotalMarks = function() {
    emit(this.Subject, this.Marks);
};

var mapFunctionTotalMarks = function() {
    emit(this.Subject, this.Marks);
};


var reduceFunctionTotalMarks = function(key, values) {
    return Array.sum(values);
};

db.students_info.mapReduce(
    mapFunctionTotalMarks,
    reduceFunctionTotalMarks,
    { out: "total_marks_per_subject" }
);

// Display the results
db.total_marks_per_subject.find();

Practical no 6:- 

Create a collection City (cityname, area, population). Write a MapReduce function to find the number of  cities  having populationless than 10 Lakhs  and cities with poulation greater than 10 Lakhs  and categorize them into categories HIGHLY POPULATED AND LOW POPULATED.

ANS:-

db.City.insertMany([
    { cityname: "Mumbai", area: 603, population: 20000000 },
    { cityname: "Pune", area: 331, population: 3500000 },
    { cityname: "Nagpur", area: 217, population: 2400000 },
    { cityname: "Nasik", area: 259, population: 1480000 },
    { cityname: "Aurangabad", area: 139, population: 1170000 },
    { cityname: "Kolhapur", area: 66, population: 500000 },
    { cityname: "Solapur", area: 148, population: 970000 }
]);

var mapFunction = function() {
    if (this.population > 1000000) {
        emit("HIGHLY POPULATED", 1);
    } else {
        emit("LOW POPULATED", 1);
    }
};

var reduceFunction = function(key, values) {
    return Array.sum(values);
};

db.City.mapReduce(
    mapFunction,
    reduceFunction,
    { out: "city_population_categories" }
);

// Display the results
db.city_population_categories.find();


practical no 7:- 

Create Database SITS using MongoDB Create following Collections Teachers(Tname,dno,dname,experience,salary,date_of_joining ) Students(Sname,roll_no,class) 1. Display the department wise average salary 2. display the no. Of employees working in each department 3. Display the department wise total salary of departments having total salary greater than or equals to 50000/- 4. Write the queries using the different operators like max, min. Etc. 5. Create unique index on any field for above given collections 6. Create compound index on any fields for above given collections 7. Show all the indexes created in the database SITS


ANS:- 

1.)	// Switch to (or create) the SITS database
use SITS;

// Create the Teachers collection and insert sample data
db.Teachers.insertMany([
    { Tname: "Dr. Sharma", dno: 1, dname: "Computer Science", experience: 10, salary: 60000, date_of_joining: new Date("2015-08-01") },
    { Tname: "Dr. Verma", dno: 2, dname: "Mathematics", experience: 8, salary: 45000, date_of_joining: new Date("2016-09-01") },
    { Tname: "Dr. Gupta", dno: 1, dname: "Computer Science", experience: 5, salary: 40000, date_of_joining: new Date("2019-06-15") },
    { Tname: "Dr. Roy", dno: 3, dname: "Physics", experience: 15, salary: 70000, date_of_joining: new Date("2010-11-20") },
    { Tname: "Dr. Mehta", dno: 2, dname: "Mathematics", experience: 12, salary: 55000, date_of_joining: new Date("2013-05-10") },
]);

// Create the Students collection and insert sample data
db.Students.insertMany([
    { Sname: "Alice", roll_no: 1, class: "TE" },
    { Sname: "Bob", roll_no: 2, class: "SE" },
    { Sname: "Charlie", roll_no: 3, class: "TE" },
    { Sname: "Daisy", roll_no: 4, class: "BE" },
]);

2.)	db.Teachers.aggregate([
    { $group: { _id: "$dname", averageSalary: { $avg: "$salary" } } }
]);

db.Teachers.aggregate([
    { $group: { _id: "$dname", employeeCount: { $sum: 1 } } }
]);

db.Teachers.aggregate([
    { $group: { _id: "$dname", totalSalary: { $sum: "$salary" } } },
    { $match: { totalSalary: { $gte: 50000 } } }
]);

db.Teachers.aggregate([
    { $group: { _id: null, maxSalary: { $max: "$salary" } } }
]);

db.Teachers.aggregate([
    { $group: { _id: null, minExperience: { $min: "$experience" } } }
]);

db.Teachers.aggregate([
    { $group: { _id: "$dname", totalSalary: { $sum: "$salary" }, avgExperience: { $avg: "$experience" } } }
]);

3.)	db.Students.createIndex({ roll_no: 1 }, { unique: true });

db.Teachers.createIndex({ dname: 1, salary: -1 });


4.)	db.Teachers.getIndexes();
db.Students.getIndexes();




Practical no: 8

Design and Develop SQL DDL statements which demonstrate the use of SQL objects such as Table, View, Index, Sequence, Synonym, different constraints etc. 

1. Create tables Emp and dept with constraints(Primary key, Foreign key etc)
2. create views on any two tables using conditions.(with types of views)
3. Insert, Update and delete values from views
3. create index called EmployeeId for the deptment table. Entries should be in ascending order by department id and then by  employee id within each department.
4. create sequence on Employee id.
5. Delete index.

ANS:- 

1.)	-- Creating Department Table
CREATE TABLE Dept (
    DeptId INT PRIMARY KEY,  -- Primary Key
    DeptName VARCHAR(50) NOT NULL,
    Location VARCHAR(100)
);

-- Creating Employee Table with Foreign Key Constraint
CREATE TABLE Emp (
    EmpId INT PRIMARY KEY,  -- Primary Key
    EmpName VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) CHECK (Salary > 0),  -- Check Constraint
    DeptId INT,  -- Foreign Key to Dept table
    CONSTRAINT fk_Dept FOREIGN KEY (DeptId) REFERENCES Dept(DeptId) 
                       ON DELETE SET NULL  -- Foreign Key Constraint with ON DELETE behavior
);

2.)	-- Creating a Simple View to fetch employees with salary greater than 5000
CREATE VIEW HighEarningEmp AS
SELECT EmpId, EmpName, Salary
FROM Emp
WHERE Salary > 5000;

-- Creating a Complex View (Joining Emp and Dept)
CREATE VIEW EmpDeptDetails AS
SELECT E.EmpId, E.EmpName, E.Salary, D.DeptName, D.Location
FROM Emp E
JOIN Dept D ON E.DeptId = D.DeptId;

3.)	-- Inserting into HighEarningEmp View (would require instead adding directly to base table Emp)
INSERT INTO Emp (EmpId, EmpName, Salary, DeptId)
VALUES (1, 'John Doe', 6000, 1);

-- Updating data via HighEarningEmp View (if permitted by the database)
UPDATE HighEarningEmp
SET Salary = 7000
WHERE EmpId = 1;

-- Deleting data via HighEarningEmp View (if permitted by the database)
DELETE FROM HighEarningEmp
WHERE EmpId = 1;

4.)	-- Creating an Index for DeptId and EmpId
CREATE INDEX EmployeeId ON Emp (DeptId ASC, EmpId ASC);

5.)	I -- Creating a Sequence for Employee IDs
CREATE SEQUENCE EmpId_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

ii -- Inserting a new employee using the sequence
INSERT INTO Emp (EmpId, EmpName, Salary, DeptId)
VALUES (EmpId_seq.NEXTVAL, 'Alice', 5500, 1);

6.)	-- Deleting the index
DROP INDEX EmployeeId;




Practical no:9 


Create database propertydearalers
Branch(branchno, street, city, postcode)
Staff(Staffno, fname, lname, position, Sex, DOB, salary, branchno)
PropertyforRent(propertyNo, street, city, Postcode,Type, rooms,rent,ownerno,staffno, branchno)
Client(CUID, fName, lName, Rent)
PrivateOwner(OUID, fName, lName, address)

1.	Insert the data as shown in the above tables
2.	Update the lname of the staff with staffno. 106  to shinde
3.	Delete the branch with postcode 411041
4.	List the emplyoyee who have atleast 2 A’s in their name.
5.	List the maximum salary from each branch  of the staff members from highest to lowest 
6.	Find the clients who have also owners
7.	Find the owners who are not clients
8.	Find the owners who have C as the third alphabet in their name

ANS:-

CREATE DATABASE propertydealers;
USE propertydealers;

CREATE TABLE Branch (
    branchno INT PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50),
    postcode VARCHAR(10)
);

CREATE TABLE Staff (
    staffno INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    position VARCHAR(50),
    sex CHAR(1),
    DOB DATE,
    salary DECIMAL(10, 2),
    branchno INT,
    FOREIGN KEY (branchno) REFERENCES Branch(branchno)
);

CREATE TABLE PropertyforRent (
    propertyNo INT PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50),
    postcode VARCHAR(10),
    type VARCHAR(20),
    rooms INT,
    rent DECIMAL(10, 2),
    ownerno INT,
    staffno INT,
    branchno INT,
    FOREIGN KEY (staffno) REFERENCES Staff(staffno),
    FOREIGN KEY (branchno) REFERENCES Branch(branchno)
);

CREATE TABLE Client (
    CUID INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    rent DECIMAL(10, 2)
);

CREATE TABLE PrivateOwner (
    OUID INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    address VARCHAR(100)
);




INSERT INTO Branch VALUES (1, 'MG Road', 'Pune', '411001');
-- Add other rows as needed

INSERT INTO Staff VALUES (106, 'John', 'Doe', 'Manager', 'M', '1985-04-12', 50000, 1);
-- Add other rows as needed

INSERT INTO PropertyforRent VALUES (201, 'Baker St', 'Pune', '411001', 'Apartment', 3, 20000, 1, 106, 1);
-- Add other rows as needed

INSERT INTO Client VALUES (301, 'Alice', 'Brown', 12000);
-- Add other rows as needed

INSERT INTO PrivateOwner VALUES (401, 'Alice', 'Smith', '45 Park Ave');
-- Add other rows as needed


UPDATE Staff
SET lname = 'Shinde'
WHERE staffno = 106;


DELETE FROM Branch
WHERE postcode = '411041';


SELECT *
FROM Staff
WHERE fname REGEXP '.*A.*A.*' OR lname REGEXP '.*A.*A.*';


SELECT branchno, MAX(salary) AS max_salary
FROM Staff
GROUP BY branchno
ORDER BY max_salary DESC;


SELECT CUID, fname, lname
FROM Client
WHERE (fname, lname) IN (SELECT fname, lname FROM PrivateOwner);

SELECT OUID, fname, lname
FROM PrivateOwner
WHERE (fname, lname) NOT IN (SELECT fname, lname FROM Client);

SELECT OUID, fname, lname
FROM PrivateOwner
WHERE fname LIKE '__C%';


Practical no 10:- 

Create database propertydearalers
Branch(branchno, street, city, postcode)
Staff(Staffno, fname, lname, position, Sex, DOB, salary, branchno)
PropertyforRent(propertyNo, street, city, Postcode,Type, rooms,rent,ownerno,staffno, branchno)
Client(CUID, fName, lName, Rent)
PrivateOwner(OUID, fName, lName, address)

1.	Insert the data as shown in the above tables
2.	Update the street of branchNo 1001 to MG
3.	Delete the owner who has fname as ‘AMIT’
4.	List the clients who pay Rent more than 10000
5.	List the name of staff who have salary greater than average salary of all staff.
6.	Find the type and rooms of properties in pune 
7.	Find the name of staffs who work as salesman or saleswomen
8.	Find the no. of properties which are of type flat. 

ANS:- 

1.)	-- Create database
CREATE DATABASE propertydearalers;
USE propertydearalers;

-- Create Branch table
CREATE TABLE Branch (
    branchno INT PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50),
    postcode VARCHAR(10)
);

-- Create Staff table
CREATE TABLE Staff (
    Staffno INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    position VARCHAR(50),
    Sex CHAR(1),
    DOB DATE,
    salary DECIMAL(10, 2),
    branchno INT,
    FOREIGN KEY (branchno) REFERENCES Branch(branchno)
);

-- Create PropertyforRent table
CREATE TABLE PropertyforRent (
    propertyNo INT PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50),
    Postcode VARCHAR(10),
    Type VARCHAR(20),
    rooms INT,
    rent DECIMAL(10, 2),
    ownerno INT,
    staffno INT,
    branchno INT,
    FOREIGN KEY (staffno) REFERENCES Staff(Staffno),
    FOREIGN KEY (branchno) REFERENCES Branch(branchno)
);

-- Create Client table
CREATE TABLE Client (
    CUID INT PRIMARY KEY,
    fName VARCHAR(50),
    lName VARCHAR(50),
    Rent DECIMAL(10, 2)
);

-- Create PrivateOwner table
CREATE TABLE PrivateOwner (
    OUID INT PRIMARY KEY,
    fName VARCHAR(50),
    lName VARCHAR(50),
    address VARCHAR(100)
);


-- Insert data into Branch table
INSERT INTO Branch (branchno, street, city, postcode) VALUES
(1001, 'Park Street', 'Mumbai', '400001'),
(1002, 'MG Road', 'Pune', '411001');

-- Insert data into Staff table
INSERT INTO Staff (Staffno, fname, lname, position, Sex, DOB, salary, branchno) VALUES
(101, 'John', 'Doe', 'Manager', 'M', '1980-05-10', 50000, 1001),
(102, 'Jane', 'Smith', 'Saleswoman', 'F', '1990-08-15', 40000, 1002),
(103, 'Mark', 'Johnson', 'Salesman', 'M', '1985-12-20', 45000, 1001),
(104, 'Sara', 'Williams', 'Assistant', 'F', '1992-09-12', 30000, 1002);

-- Insert data into PropertyforRent table
INSERT INTO PropertyforRent (propertyNo, street, city, Postcode, Type, rooms, rent, ownerno, staffno, branchno) VALUES
(201, 'High Street', 'Pune', '411001', 'Flat', 3, 15000, 301, 102, 1002),
(202, 'Beach Road', 'Mumbai', '400001', 'House', 4, 25000, 302, 101, 1001),
(203, 'Garden Road', 'Pune', '411001', 'Flat', 2, 12000, 303, 103, 1002);

-- Insert data into Client table
INSERT INTO Client (CUID, fName, lName, Rent) VALUES
(401, 'Alice', 'Brown', 11000),
(402, 'Bob', 'Davis', 9000),
(403, 'Charlie', 'Miller', 15000);

-- Insert data into PrivateOwner table
INSERT INTO PrivateOwner (OUID, fName, lName, address) VALUES
(301, 'AMIT', 'Kumar', 'Address 1'),
(302, 'Suresh', 'Patel', 'Address 2'),
(303, 'Rita', 'Sharma', 'Address 3');



2.)	UPDATE Branch
SET street = 'MG'
WHERE branchno = 1001;


3.)	DELETE FROM PrivateOwner
WHERE fName = 'AMIT';


4.)	SELECT fName, lName
FROM Client
WHERE Rent > 10000;


5.)	SELECT fname, lname
FROM Staff
WHERE salary > (SELECT AVG(salary) FROM Staff);


6.)	SELECT Type, rooms
FROM PropertyforRent
WHERE city = 'Pune';


7.)	SELECT fname, lname
FROM Staff
WHERE position IN ('Salesman', 'Saleswoman');

8.)	SELECT COUNT(*) AS number_of_flats
FROM PropertyforRent
WHERE Type = 'Flat';




Practical no 11:- 

Create a db called company consist of the following tables. 
1.Emp (eno,ename, job,hiredate,salary,commission,deptno,) 
2.dept(deptno,deptname,location) eno is primary key in emp deptno is primary key in dept 
Solve Queries by SQL 

1. List the maximum salary paid to salesman 
2. List name of emp whose name start with ‘I’ 
3. List details of emp who have joined before ’30-sept-81’ 
4. List the emp details in the descending order of their basic salary
 5. List of no. of emp & avg salary for emp in the dept no ‘20’ 
6. List the avg salary, minimum salary of the emp hiredatewise for dept no ‘10’. 
7. List emp name and its department 
8. List total salary paid to each department 
9. List details of employee working in ‘Dev’ department 
10. Update salary of all employees in deptno 10 by 5 %


ANS:- 

-- Create the database
CREATE DATABASE company;
USE company;

-- Create dept table
CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    deptname VARCHAR(50),
    location VARCHAR(50)
);

-- Create emp table with a foreign key reference to deptno
CREATE TABLE emp (
    eno INT PRIMARY KEY,
    ename VARCHAR(50),
    job VARCHAR(50),
    hiredate DATE,
    salary DECIMAL(10, 2),
    commission DECIMAL(10, 2),
    deptno INT,
    FOREIGN KEY (deptno) REFERENCES dept(deptno)
);

-- Insert data into dept table
INSERT INTO dept (deptno, deptname, location) VALUES
(10, 'Finance', 'New York'),
(20, 'Sales', 'Chicago'),
(30, 'Dev', 'San Francisco');

-- Insert data into emp table
INSERT INTO emp (eno, ename, job, hiredate, salary, commission, deptno) VALUES
(1, 'Alice', 'Salesman', '1981-02-20', 50000, 3000, 20),
(2, 'Bob', 'Manager', '1981-05-01', 75000, NULL, 10),
(3, 'Charlie', 'Analyst', '1982-06-15', 62000, NULL, 20),
(4, 'Dave', 'Developer', '1983-09-01', 55000, NULL, 30),
(5, 'Ian', 'Salesman', '1980-12-05', 52000, 2500, 20),
(6, 'Isaac', 'Developer', '1981-08-23', 48000, NULL, 30);



1.)	SELECT MAX(salary) AS max_salary_salesman
FROM emp
WHERE job = 'Salesman';

2.)	SELECT ename
FROM emp
WHERE ename LIKE 'I%';

3.)	SELECT *
FROM emp
WHERE hiredate < '1981-09-30';
4.)	SELECT *
FROM emp
ORDER BY salary DESC;

5.)	SELECT COUNT(*) AS num_employees, AVG(salary) AS avg_salary
FROM emp
WHERE deptno = 20;

6.)	SELECT hiredate, AVG(salary) AS avg_salary, MIN(salary) AS min_salary
FROM emp
WHERE deptno = 10
GROUP BY hiredate;

7.)	SELECT e.ename, d.deptname
FROM emp e
JOIN dept d ON e.deptno = d.deptno;

8.)	SELECT d.deptname, SUM(e.salary) AS total_salary
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.deptname;

9.)	SELECT e.*
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE d.deptname = 'Dev';

10.)	UPDATE emp
SET salary = salary * 1.05
WHERE deptno = 10;


Practical no 12:- 

Create the following tables. And Solve following queries by SQL
1.	Deposit (actno,cname,bname,amount,adate) 
2.	Branch (bname,city) 
3.	Customers (cname, city) 
4.	Borrow (loanno, cname, bname, amount) Add primary key and foreign key wherever applicable.

 Insert data into the above created tables.
 a. Display names of all branches located in city Bombay.
 b. Display account no. and amount of depositors. 
c. Update the city of customers Anil from Pune to Mumbai
d. Find the number of depositors in the bank 
e. Calculate Min,Max amount of customers. 
f. Create an index on deposit table g. 
g. Create View on Borrow table.


ANS:- 


-- Create Deposit table
CREATE TABLE Deposit (
    actno INT PRIMARY KEY,
    cname VARCHAR(50),
    bname VARCHAR(50),
    amount DECIMAL(10, 2),
    adate DATE,
    FOREIGN KEY (cname) REFERENCES Customers(cname),
    FOREIGN KEY (bname) REFERENCES Branch(bname)
);

-- Create Branch table
CREATE TABLE Branch (
    bname VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50)
);

-- Create Customers table
CREATE TABLE Customers (
    cname VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50)
);

-- Create Borrow table
CREATE TABLE Borrow (
    loanno INT PRIMARY KEY,
    cname VARCHAR(50),
    bname VARCHAR(50),
    amount DECIMAL(10, 2),
    FOREIGN KEY (cname) REFERENCES Customers(cname),
    FOREIGN KEY (bname) REFERENCES Branch(bname)
);


-- Insert data into Branch table
INSERT INTO Branch (bname, city) VALUES
('MainBranch', 'Bombay'),
('NorthBranch', 'Delhi'),
('WestBranch', 'Bombay'),
('EastBranch', 'Pune');

-- Insert data into Customers table
INSERT INTO Customers (cname, city) VALUES
('Anil', 'Pune'),
('Rita', 'Delhi'),
('Suresh', 'Bombay'),
('Neha', 'Bombay');

-- Insert data into Deposit table
INSERT INTO Deposit (actno, cname, bname, amount, adate) VALUES
(1001, 'Anil', 'EastBranch', 20000, '2023-01-10'),
(1002, 'Rita', 'NorthBranch', 50000, '2023-02-20'),
(1003, 'Suresh', 'WestBranch', 75000, '2023-03-15'),
(1004, 'Neha', 'MainBranch', 60000, '2023-04-01');

-- Insert data into Borrow table
INSERT INTO Borrow (loanno, cname, bname, amount) VALUES
(2001, 'Anil', 'EastBranch', 30000),
(2002, 'Rita', 'NorthBranch', 45000),
(2003, 'Suresh', 'WestBranch', 50000),
(2004, 'Neha', 'MainBranch', 25000);



a.)	SELECT bname
FROM Branch
WHERE city = 'Bombay';

b.)	SELECT actno, amount
FROM Deposit;

c.)	UPDATE Customers
SET city = 'Mumbai'
WHERE cname = 'Anil';

d.)	SELECT COUNT(*) AS number_of_depositors
FROM Deposit;

e.)	SELECT MIN(amount) AS min_amount, MAX(amount) AS max_amount
FROM Deposit;

f.)	CREATE INDEX idx_deposit_amount ON Deposit(amount);

g.)	CREATE VIEW BorrowView AS
SELECT loanno, cname, bname, amount
FROM Borrow;


Practicalno:- 13

Create the following tables: 
Orders(Order_no, cust, product, Quantity, amount, Disc) 
Customers(Cust_No, Company, Cust_Rep, Credit_Limit) 
Sales_Representative (Rep_no,Name, Re_office,Quota, sales) 
Note: Orders (cust –foreign key for cust_no from Customer ) 
Customers(Cust_Rep foreign key for Rep_no from Sales_Representative ) 
Write a query for following: 
1. List for each customer: customer name, their rep’s name, their rep’s office number. 
2. List orders over $25,000 including the name of the salesperson who took the order and the name of the customer who placed it. 
3. Find the products which have been sold to TCS. 
4. Find company which has been offered maximum discount
5. Find the sales representatives who work in the same office. 
6. Find the credit limit of company and the discount it has received 


ANS:-  


-- Create Customers table
CREATE TABLE Customers (
    Cust_No INT PRIMARY KEY,
    Company VARCHAR(50),
    Cust_Rep INT,
    Credit_Limit DECIMAL(10, 2),
    FOREIGN KEY (Cust_Rep) REFERENCES Sales_Representative(Rep_no)
);

-- Create Sales_Representative table
CREATE TABLE Sales_Representative (
    Rep_no INT PRIMARY KEY,
    Name VARCHAR(50),
    Re_office INT,
    Quota DECIMAL(10, 2),
    Sales DECIMAL(10, 2)
);

-- Create Orders table with foreign key reference to Customers
CREATE TABLE Orders (
    Order_no INT PRIMARY KEY,
    cust INT,
    product VARCHAR(50),
    Quantity INT,
    amount DECIMAL(10, 2),
    Disc DECIMAL(10, 2),
    FOREIGN KEY (cust) REFERENCES Customers(Cust_No)
);


-- Insert data into Sales_Representative table
INSERT INTO Sales_Representative (Rep_no, Name, Re_office, Quota, Sales) VALUES
(1, 'Alice', 101, 100000, 50000),
(2, 'Bob', 101, 150000, 120000),
(3, 'Charlie', 102, 130000, 110000),
(4, 'Diana', 103, 90000, 80000);

-- Insert data into Customers table
INSERT INTO Customers (Cust_No, Company, Cust_Rep, Credit_Limit) VALUES
(1, 'TCS', 1, 50000),
(2, 'Infosys', 2, 75000),
(3, 'Wipro', 3, 100000),
(4, 'TechM', 4, 120000);

-- Insert data into Orders table
INSERT INTO Orders (Order_no, cust, product, Quantity, amount, Disc) VALUES
(101, 1, 'Product A', 10, 30000, 1000),
(102, 2, 'Product B', 5, 40000, 2000),
(103, 1, 'Product C', 7, 20000, 500),
(104, 3, 'Product D', 20, 25000, 1500),
(105, 4, 'Product A', 15, 15000, 700);




a.)	SELECT c.Company AS customer_name, sr.Name AS rep_name, sr.Re_office AS rep_office
FROM Customers c
JOIN Sales_Representative sr ON c.Cust_Rep = sr.Rep_no;

b.)	SELECT o.Order_no, o.amount, c.Company AS customer_name, sr.Name AS salesperson_name
FROM Orders o
JOIN Customers c ON o.cust = c.Cust_No
JOIN Sales_Representative sr ON c.Cust_Rep = sr.Rep_no
WHERE o.amount > 25000;

c.)	SELECT o.product
FROM Orders o
JOIN Customers c ON o.cust = c.Cust_No
WHERE c.Company = 'TCS';

d.)	SELECT c.Company, MAX(o.Disc) AS max_discount
FROM Orders o
JOIN Customers c ON o.cust = c.Cust_No
GROUP BY c.Company
ORDER BY max_discount DESC
LIMIT 1;

e.)	SELECT sr1.Name AS rep_name1, sr2.Name AS rep_name2, sr1.Re_office
FROM Sales_Representative sr1
JOIN Sales_Representative sr2 ON sr1.Re_office = sr2.Re_office AND sr1.Rep_no <> sr2.Rep_no
GROUP BY sr1.Name, sr2.Name, sr1.Re_office;

f.)	SELECT c.Company, c.Credit_Limit, o.Disc AS discount
FROM Customers c
JOIN Orders o ON c.Cust_No = o.cust;
Pratical no 14:- 


Create the following tables: Orders(Order_no, cust, product, Quantity, amount, Disc) Customers(Cust_No, Company, Cust_Rep, Credit_Limit) Sales_Representative (Rep_no,Name, Re_office,Quota, sales) Note: Orders (cust –foreign key for cust_no from Customer ) Customers(Cust_Rep foreign key for Rep_no from Sales_Representative ) 
Write a query for following:
 1. List for each customer : customer name, credit limit, rep name serving the customer and rep sales.
 2. List all orders showing number and amount, and name and credit limit of customer. 
3. Find the product wise sale amount of products which exceeds $12000. 
4. Find the names of amount, names of customers and names of representatives who have been involved in the sale of software.
 5. Find the credit limit of company and the discount it has received
 6. Find the sales representatives who work in the same office


ANS:- 

-- Create Customers table
CREATE TABLE Customers (
    Cust_No INT PRIMARY KEY,
    Company VARCHAR(50),
    Cust_Rep INT,
    Credit_Limit DECIMAL(10, 2),
    FOREIGN KEY (Cust_Rep) REFERENCES Sales_Representative(Rep_no)
);

-- Create Sales_Representative table
CREATE TABLE Sales_Representative (
    Rep_no INT PRIMARY KEY,
    Name VARCHAR(50),
    Re_office INT,
    Quota DECIMAL(10, 2),
    Sales DECIMAL(10, 2)
);

-- Create Orders table with foreign key reference to Customers
CREATE TABLE Orders (
    Order_no INT PRIMARY KEY,
    cust INT,
    product VARCHAR(50),
    Quantity INT,
    amount DECIMAL(10, 2),
    Disc DECIMAL(10, 2),
    FOREIGN KEY (cust) REFERENCES Customers(Cust_No)
);


-- Insert data into Sales_Representative table
INSERT INTO Sales_Representative (Rep_no, Name, Re_office, Quota, Sales) VALUES
(1, 'Alice', 101, 100000, 50000),
(2, 'Bob', 101, 150000, 120000),
(3, 'Charlie', 102, 130000, 110000),
(4, 'Diana', 103, 90000, 80000);

-- Insert data into Customers table
INSERT INTO Customers (Cust_No, Company, Cust_Rep, Credit_Limit) VALUES
(1, 'TCS', 1, 50000),
(2, 'Infosys', 2, 75000),
(3, 'Wipro', 3, 100000),
(4, 'TechM', 4, 120000);

-- Insert data into Orders table
INSERT INTO Orders (Order_no, cust, product, Quantity, amount, Disc) VALUES
(101, 1, 'Software', 10, 13000, 1000),
(102, 2, 'Hardware', 5, 40000, 2000),
(103, 1, 'Software', 7, 20000, 500),
(104, 3, 'Hardware', 20, 25000, 1500),
(105, 4, 'Software', 15, 15000, 700);


1.)	SELECT c.Company AS customer_name, c.Credit_Limit, sr.Name AS rep_name, sr.Sales AS rep_sales
FROM Customers c
JOIN Sales_Representative sr ON c.Cust_Rep = sr.Rep_no;

2.)	SELECT o.Order_no, o.amount, c.Company AS customer_name, c.Credit_Limit
FROM Orders o
JOIN Customers c ON o.cust = c.Cust_No;

3.)	SELECT o.product, SUM(o.amount) AS total_sales
FROM Orders o
GROUP BY o.product
HAVING total_sales > 12000;

4.)	SELECT o.amount, c.Company AS customer_name, sr.Name AS rep_name
FROM Orders o
JOIN Customers c ON o.cust = c.Cust_No
JOIN Sales_Representative sr ON c.Cust_Rep = sr.Rep_no
WHERE o.product = 'Software';



5.)	SELECT c.Company, c.Credit_Limit, o.Disc AS discount
FROM Customers c
JOIN Orders o ON c.Cust_No = o.cust;

6.)	SELECT sr1.Name AS rep_name1, sr2.Name AS rep_name2, sr1.Re_office
FROM Sales_Representative sr1
JOIN Sales_Representative sr2 ON sr1.Re_office = sr2.Re_office AND sr1.Rep_no <> sr2.Rep_no
GROUP BY sr1.Name, sr2.Name, sr1.Re_office;


Practical No 15:-

Create the following tables. 
1) PUBLISHER( PID , PNAME ,ADDRESS ,STATE ,PHONE ,EMAILID ); 
2) BOOK( ISBN ,BOOK_TITLE , CATEGORY , PRICE , COPYRIGHT_DATE , YEAR ,PAGE_COUNT ,PID ); 
3) AUTHOR(AID,ANAME,STATE,CITY ,ZIP,PHONE,URL ) 
4) AUTHOR_BOOK(AID,ISBN); 
5) REVIEW(RID,ISBN,RATING);
 Solve following queries by SQL 
1. Retrieve city, phone, url of author whose name is ‘CHETAN BHAGAT’. 
2. Retrieve book title, reviewable id and rating of all books.
 3. Retrieve book title, price, author name and url for publishers ‘MEHTA’ 
4. In a PUBLISHER relation change the phone number of ‘MEHTA’ to 123456 
5. Calculate and display the average, maximum, minimum price of each publisher.
 6. Delete details of all books having a page count less than 100. 
7. Retrieve details of all authors residing in city Pune and whose name begins with character ‘C’.
 8. Retrieve details of authors residing in same city as ‘Korth’

ANS:-  

-- Create PUBLISHER table
CREATE TABLE PUBLISHER (
    PID INT PRIMARY KEY,
    PNAME VARCHAR(50),
    ADDRESS VARCHAR(100),
    STATE VARCHAR(50),
    PHONE VARCHAR(15),
    EMAILID VARCHAR(50)
);

-- Create BOOK table with foreign key to PUBLISHER
CREATE TABLE BOOK (
    ISBN INT PRIMARY KEY,
    BOOK_TITLE VARCHAR(100),
    CATEGORY VARCHAR(50),
    PRICE DECIMAL(10, 2),
    COPYRIGHT_DATE DATE,
    YEAR INT,
    PAGE_COUNT INT,
    PID INT,
    FOREIGN KEY (PID) REFERENCES PUBLISHER(PID)
);

-- Create AUTHOR table
CREATE TABLE AUTHOR (
    AID INT PRIMARY KEY,
    ANAME VARCHAR(100),
    STATE VARCHAR(50),
    CITY VARCHAR(50),
    ZIP VARCHAR(10),
    PHONE VARCHAR(15),
    URL VARCHAR(100)
);

-- Create AUTHOR_BOOK table with foreign keys to AUTHOR and BOOK
CREATE TABLE AUTHOR_BOOK (
    AID INT,
    ISBN INT,
    PRIMARY KEY (AID, ISBN),
    FOREIGN KEY (AID) REFERENCES AUTHOR(AID),
    FOREIGN KEY (ISBN) REFERENCES BOOK(ISBN)
);

-- Create REVIEW table with foreign key to BOOK
CREATE TABLE REVIEW (
    RID INT PRIMARY KEY,
    ISBN INT,
    RATING DECIMAL(2, 1),
    FOREIGN KEY (ISBN) REFERENCES BOOK(ISBN)
);

1.)	SELECT CITY, PHONE, URL
FROM AUTHOR
WHERE ANAME = 'CHETAN BHAGAT';

2.)	SELECT b.BOOK_TITLE, r.RID, r.RATING
FROM BOOK b
JOIN REVIEW r ON b.ISBN = r.ISBN;

3.)	SELECT b.BOOK_TITLE, b.PRICE, a.ANAME, a.URL
FROM BOOK b
JOIN PUBLISHER p ON b.PID = p.PID
JOIN AUTHOR_BOOK ab ON b.ISBN = ab.ISBN
JOIN AUTHOR a ON ab.AID = a.AID
WHERE p.PNAME = 'MEHTA';

4.)	UPDATE PUBLISHER
SET PHONE = '123456'
WHERE PNAME = 'MEHTA';

5.)	SELECT p.PNAME, AVG(b.PRICE) AS avg_price, MAX(b.PRICE) AS max_price, MIN(b.PRICE) AS min_price
FROM BOOK b
JOIN PUBLISHER p ON b.PID = p.PID
GROUP BY p.PNAME;

6.)	DELETE FROM BOOK
WHERE PAGE_COUNT < 100;

7.)	SELECT *
FROM AUTHOR
WHERE CITY = 'Pune' AND ANAME LIKE 'C%';

8.)	SELECT a2.*
FROM AUTHOR a1
JOIN AUTHOR a2 ON a1.CITY = a2.CITY
WHERE a1.ANAME = 'Korth' AND a2.ANAME <> 'Korth';


Practical no 16:- 

Write a Stored Procedure namely proc_Grade for the categorization of student. If marks scored by students in examination is <=1500 and marks>=990 then student will be placed in distinction category if marks scored are between 989 and 900 category is first class, if marks 899 and 825 category is Higher Second Class
ANS:-  


DELIMITER //

CREATE PROCEDURE proc_Grade(IN student_marks INT, OUT grade_category VARCHAR(50))
BEGIN
    IF student_marks >= 990 AND student_marks <= 1500 THEN
        SET grade_category = 'Distinction';
    ELSEIF student_marks >= 900 AND student_marks <= 989 THEN
        SET grade_category = 'First Class';
    ELSEIF student_marks >= 825 AND student_marks <= 899 THEN
        SET grade_category = 'Higher Second Class';
    ELSE
        SET grade_category = 'No Category';
    END IF;
END //

DELIMITER ;


CALL proc_Grade(920, @grade_category);
SELECT @grade_category AS Grade_Category;


Practical no 17:- 

Unnamed PL/SQL code block: Use of Control structure and Exception handling is mandatory. 
Suggested Problem statement: Consider Tables: 
1. Borrower(Roll_no, Name, DateofIssue, NameofBook, Status) 
2. Fine(Roll_no,Date,Amt) 

• Accept Roll_no and NameofBook from user. 
• Check the number of days (from date of issue).
• If days are between 15 to 30 then fine amount will be Rs 5per day.
• If no. of days>30, per day fine will be Rs 50 per day and for days less than 30, Rs. 5 per day. 
• After submitting the book, status will change from I to R. 
• If condition of fine is true, then details will be stored into fine table. 
• Also handles the exception by named exception handler or user define exception handler


ANS:- 


DECLARE
    v_Roll_no       Borrower.Roll_no%TYPE;
    v_NameofBook    Borrower.NameofBook%TYPE;
    v_DateofIssue   Borrower.DateofIssue%TYPE;
    v_Status        Borrower.Status%TYPE;
    v_Today         DATE := SYSDATE;
    v_Days          NUMBER;
    v_FineAmt       NUMBER := 0;
    
    -- Custom exception for book not found or already returned
    ex_BookNotIssued EXCEPTION;
    
BEGIN
    -- Accept Roll_no and NameofBook from user
    v_Roll_no := &Roll_no;
    v_NameofBook := '&NameofBook';

    -- Fetch DateofIssue and Status for the given Roll_no and NameofBook
    SELECT DateofIssue, Status INTO v_DateofIssue, v_Status
    FROM Borrower
    WHERE Roll_no = v_Roll_no AND NameofBook = v_NameofBook;
    
    -- Check if the book is already returned
    IF v_Status = 'R' THEN
        RAISE ex_BookNotIssued;
    END IF;

    -- Calculate the number of days since DateofIssue
    v_Days := v_Today - v_DateofIssue;

    -- Calculate fine based on the number of days
    IF v_Days > 15 THEN
        IF v_Days > 30 THEN
            v_FineAmt := 5 * 15 + 50 * (v_Days - 30);  -- Rs 5 per day for first 15 days and Rs 50 per day after 30 days
        ELSE
            v_FineAmt := 5 * v_Days;  -- Rs 5 per day for days between 15 and 30
        END IF;
    ELSE
        v_FineAmt := 0;  -- No fine if days are 15 or less
    END IF;

    -- Update the status to 'R' (Returned) in the Borrower table
    UPDATE Borrower
    SET Status = 'R'
    WHERE Roll_no = v_Roll_no AND NameofBook = v_NameofBook;

    -- If fine amount is greater than 0, insert record into Fine table
    IF v_FineAmt > 0 THEN
        INSERT INTO Fine (Roll_no, Date, Amt) VALUES (v_Roll_no, v_Today, v_FineAmt);
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Book returned successfully.');
    DBMS_OUTPUT.PUT_LINE('Total fine amount: ' || v_FineAmt);

EXCEPTION
    -- Handle when no record found or book already returned
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No record found for the given Roll_no and NameofBook.');
    WHEN ex_BookNotIssued THEN
        DBMS_OUTPUT.PUT_LINE('Error: The book has already been returned.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/


Practical no 18:- 

Named PL/SQL Block: PL/SQL Stored Procedure and Stored Function.
 Write a Stored Procedure namely proc_Grade for the categorization of student. If marks scoredby students in examination is <=1500 and marks>=990 then student will be placed in distinction category if marks scored are between 989 and 900 category is first class, if marks 899 and 825 category is Higher Second Class. Write a PL/SQL block to use procedure created with above requirement. Stud_Marks(name, total_marks) Result(Roll,Name, Class)

ANS:- 

CREATE TABLE Stud_Marks (
    name VARCHAR2(50),
    total_marks NUMBER
);

CREATE TABLE Result (
    Roll NUMBER GENERATED BY DEFAULT AS IDENTITY,
    Name VARCHAR2(50),
    Class VARCHAR2(20)
);


CREATE OR REPLACE PROCEDURE proc_Grade (
    p_name IN VARCHAR2,
    p_total_marks IN NUMBER
) AS
    v_class VARCHAR2(20);
BEGIN
    -- Determine category based on total_marks
    IF p_total_marks <= 1500 AND p_total_marks >= 990 THEN
        v_class := 'Distinction';
    ELSIF p_total_marks BETWEEN 900 AND 989 THEN
        v_class := 'First Class';
    ELSIF p_total_marks BETWEEN 825 AND 899 THEN
        v_class := 'Higher Second Class';
    ELSE
        v_class := 'No Category';
    END IF;

    -- Insert the student name and class into Result table
    INSERT INTO Result (Name, Class)
    VALUES (p_name, v_class);

    DBMS_OUTPUT.PUT_LINE('Student ' || p_name || ' categorized as ' || v_class);
END;
/


DECLARE
    v_name Stud_Marks.name%TYPE;
    v_total_marks Stud_Marks.total_marks%TYPE;
BEGIN
    -- Cursor to loop through all students in Stud_Marks
    FOR student_rec IN (SELECT name, total_marks FROM Stud_Marks) LOOP
        -- Assign values
        v_name := student_rec.name;
        v_total_marks := student_rec.total_marks;
        
        -- Call the procedure with the student's name and marks
        proc_Grade(v_name, v_total_marks);
    END LOOP;
END;
/


INSERT INTO Stud_Marks (name, total_marks) VALUES ('John', 1450);
INSERT INTO Stud_Marks (name, total_marks) VALUES ('Alice', 980);
INSERT INTO Stud_Marks (name, total_marks) VALUES ('Bob', 920);
INSERT INTO Stud_Marks (name, total_marks) VALUES ('Charlie', 860);
INSERT INTO Stud_Marks (name, total_marks) VALUES ('Eve', 810);

COMMIT;

SELECT * FROM Result;





Practical no 20:- 

CREATE TABLE Library (
    Book_ID NUMBER PRIMARY KEY,
    Title VARCHAR2(100),
    Author VARCHAR2(100),
    Published_Date DATE,
    Genre VARCHAR2(50)
);

CREATE TABLE Library_Audit (
    Audit_ID NUMBER PRIMARY KEY,
    Book_ID NUMBER,
    Title VARCHAR2(100),
    Author VARCHAR2(100),
    Published_Date DATE,
    Genre VARCHAR2(50),
    Action VARCHAR2(10),
    Action_Date DATE
);

CREATE OR REPLACE TRIGGER library_update_audit
BEFORE UPDATE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit (
        Audit_ID, Book_ID, Title, Author, Published_Date, Genre, Action, Action_Date
    ) VALUES (
        Library_Audit_seq.NEXTVAL,  -- Assuming you have a sequence for Audit_ID
        :OLD.Book_ID,
        :OLD.Title,
        :OLD.Author,
        :OLD.Published_Date,
        :OLD.Genre,
        'UPDATE',
        SYSDATE
    );
END;
/

CREATE OR REPLACE TRIGGER library_delete_audit
BEFORE DELETE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit (
        Audit_ID, Book_ID, Title, Author, Published_Date, Genre, Action, Action_Date
    ) VALUES (
        Library_Audit_seq.NEXTVAL,  -- Assuming you have a sequence for Audit_ID
        :OLD.Book_ID,
        :OLD.Title,
        :OLD.Author,
        :OLD.Published_Date,
        :OLD.Genre,
        'DELETE',
        SYSDATE
    );
END;
/

CREATE OR REPLACE TRIGGER library_statement_audit
AFTER UPDATE OR DELETE ON Library
BEGIN
    INSERT INTO Library_Audit (
        Audit_ID, Book_ID, Title, Author, Published_Date, Genre, Action, Action_Date
    ) VALUES (
        Library_Audit_seq.NEXTVAL,
        NULL,  -- NULL because it's a statement-level trigger
        NULL,
        NULL,
        NULL,
        NULL,
        CASE 
            WHEN UPDATING THEN 'STATEMENT_UPDATE'
            WHEN DELETING THEN 'STATEMENT_DELETE'
        END,
        SYSDATE
    );
END;
/



Practical no 21:- 
Database Trigger (All Types: Row level and Statement level triggers, Before and After Triggers). 

Write a database trigger on Library table. The System should keep track of the records that are being updated or deleted. The old value of updated or deleted records should be added in Library_Audit table


ANS:- (Follow practical no 20 )




Practical no 22:- 

SQL Queries - all types of Join, Sub-Query and View: Create two to three tables and perform all types of join. Write at least 10 SQL queries for suitable database application using SQL DML statements


ANS:- 

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    dept_id INT
);


INSERT INTO Employees (emp_id, emp_name, dept_id, salary) VALUES
(1, 'Alice', 101, 60000),
(2, 'Bob', 102, 50000),
(3, 'Charlie', 101, 70000),
(4, 'Daisy', 103, 55000);

INSERT INTO Departments (dept_id, dept_name, location) VALUES
(101, 'IT', 'New York'),
(102, 'HR', 'San Francisco'),
(103, 'Finance', 'Chicago');

INSERT INTO Projects (project_id, project_name, dept_id) VALUES
(1, 'Project A', 101),
(2, 'Project B', 102),
(3, 'Project C', 103),
(4, 'Project D', NULL); -- No department assigned


SELECT e.emp_name, d.dept_name
FROM Employees e
INNER JOIN Departments d ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM Employees e
FULL OUTER JOIN Departments d ON e.dept_id = d.dept_id;
SELECT e1.emp_name AS Employee1, e2.emp_name AS Employee2, e1.dept_id
FROM Employees e1
JOIN Employees e2 ON e1.dept_id = e2.dept_id AND e1.emp_id != e2.emp_id;

SELECT dept_name
FROM Departments
WHERE dept_id = (SELECT dept_id FROM Employees ORDER BY salary DESC LIMIT 1);

SELECT emp_name, salary
FROM Employees e
WHERE salary > (SELECT AVG(salary) FROM Employees WHERE dept_id = e.dept_id);

SELECT project_name
FROM Projects
WHERE dept_id IN (SELECT dept_id FROM Employees WHERE salary > 60000);

CREATE VIEW EmployeeDept AS
SELECT e.emp_name, e.salary, d.dept_name, d.location
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

SELECT emp_name, salary
FROM EmployeeDept
WHERE dept_name = 'IT' AND salary > 55000;


