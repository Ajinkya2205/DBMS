MongoDB Queries: Design and Develop MongoDB Queries using CRUD operations.
Create collection “student” and
1. Insert entry of 10 or more students.
2. select all documents from the collection &quot;student&quot; which satisfying the following condition -
a.  gender of student is male and
b. class of the student is TE A or
c. grd_point of the student is greater than equal to 31 with comparison operator.
3. Select such a documents from the collection &quot;student” who belongs to “Bangalore” and whose age is less
than equal to 19.
4. Update course to “MCA” from collection “student” whose first name is “ Bhakti”
5. Delete the document from collection student where age is “18” and gender is “ male”.
6. Delete the document from collection student where last name is Jadhav and belongs to class TE B.
7. Make statement with nor and other arithmetic operator.
8. Use save method

ans: 
db.createCollection("student");

db.student.insertMany([
    { firstName: "Rahul", lastName: "Sharma", gender: "male", class: "TE A", grd_point: 33, city: "Mumbai", age: 20, course: "BCA" },
    { firstName: "Bhakti", lastName: "Patil", gender: "female", class: "TE B", grd_point: 30, city: "Pune", age: 22, course: "BCA" },
    { firstName: "Amit", lastName: "Verma", gender: "male", class: "TE A", grd_point: 25, city: "Bangalore", age: 19, course: "BBA" },
    { firstName: "Priya", lastName: "Jadhav", gender: "female", class: "TE B", grd_point: 35, city: "Mumbai", age: 18, course: "BSc" },
    { firstName: "Suresh", lastName: "Patel", gender: "male", class: "TE B", grd_point: 28, city: "Bangalore", age: 17, course: "BCA" },
    { firstName: "Raj", lastName: "Mehta", gender: "male", class: "TE A", grd_point: 40, city: "Pune", age: 21, course: "BSc" },
    { firstName: "Sunita", lastName: "Kumar", gender: "female", class: "TE C", grd_point: 29, city: "Mumbai", age: 20, course: "BBA" },
    { firstName: "Vikas", lastName: "Singh", gender: "male", class: "TE C", grd_point: 27, city: "Bangalore", age: 20, course: "BSc" },
    { firstName: "Sahil", lastName: "Jadhav", gender: "male", class: "TE B", grd_point: 26, city: "Bangalore", age: 18, course: "BBA" },
    { firstName: "Meera", lastName: "Sharma", gender: "female", class: "TE A", grd_point: 31, city: "Pune", age: 19, course: "BSc" }
]);

db.student.find({
    $and: [
        { gender: "male" },
        { $or: [{ class: "TE A" }, { grd_point: { $gte: 31 } }] }
    ]
});

db.student.find({
    city: "Bangalore",
    age: { $lte: 19 }
});

db.student.updateOne(
    { firstName: "Bhakti" },
    { $set: { course: "MCA" } }
);

db.student.deleteOne({
    age: 18,
    gender: "male"
});

db.student.deleteOne({
    lastName: "Jadhav",
    class: "TE B"
});

db.student.find({
    $nor: [
        { gender: "male" },
        { grd_point: { $gt: 30 } }
    ]
});

db.student.save({
    _id: ObjectId("..."), // existing _id to update or omit to insert new
    firstName: "Pooja",
    lastName: "Kapoor",
    gender: "female",
    class: "TE A",
    grd_point: 34,
    city: "Mumbai",
    age: 20,
    course: "BCA"
});


2.MongoDB Queries: Design and Develop MongoDB Queries using CRUD operations.
Create collection “student” and
1. Insert entry of 10 or more students
2. select all documents from the collection &quot;student&quot; which satisfying the following condition -
a.  gender of student is female or
b. Class of the student is TE B and
c. grd_point of the student is greater than equal to 31 with comparison operator.
3. Update age to 20 from collection “student” whose first name is “ Riyansh”
4. Update or save the city to nagpur and State to MH whose last name is “soniminde”
5. Students have cancelled admission from the college who is belongs to state “KA”.
6. Delete the document from collection student where First name is Evanshika and age is less than 18.
7. Make statement with nor and other arithmetic operator.


ans: db.createCollection("student");

db.student.insertMany([
    { firstName: "Anushka", lastName: "Verma", gender: "female", class: "TE A", grd_point: 34, city: "Mumbai", age: 20, state: "MH" },
    { firstName: "Riyansh", lastName: "Singh", gender: "male", class: "TE B", grd_point: 29, city: "Pune", age: 19, state: "MH" },
    { firstName: "Bhavika", lastName: "Patil", gender: "female", class: "TE B", grd_point: 32, city: "Bangalore", age: 21, state: "KA" },
    { firstName: "Sonali", lastName: "Mishra", gender: "female", class: "TE C", grd_point: 30, city: "Delhi", age: 22, state: "DL" },
    { firstName: "Raghav", lastName: "Sharma", gender: "male", class: "TE A", grd_point: 27, city: "Bangalore", age: 20, state: "KA" },
    { firstName: "Sana", lastName: "Rathore", gender: "female", class: "TE B", grd_point: 35, city: "Mumbai", age: 18, state: "MH" },
    { firstName: "Evanshika", lastName: "Gupta", gender: "female", class: "TE C", grd_point: 28, city: "Chennai", age: 17, state: "TN" },
    { firstName: "Rakesh", lastName: "Soniminde", gender: "male", class: "TE A", grd_point: 26, city: "Pune", age: 20, state: "MH" },
    { firstName: "Meera", lastName: "Desai", gender: "female", class: "TE B", grd_point: 33, city: "Hyderabad", age: 21, state: "TS" },
    { firstName: "Samarth", lastName: "Patil", gender: "male", class: "TE C", grd_point: 27, city: "Nagpur", age: 20, state: "MH" }
]);

db.student.find({
    $or: [
        { gender: "female" },
        { $and: [{ class: "TE B" }, { grd_point: { $gte: 31 } }] }
    ]
});

db.student.updateOne(
    { firstName: "Riyansh" },
    { $set: { age: 20 } }
);

db.student.updateOne(
    { lastName: "Soniminde" },
    { $set: { city: "Nagpur", state: "MH" } }
);

db.student.deleteMany({
    state: "KA"
});

db.student.deleteOne({
    firstName: "Evanshika",
    age: { $lt: 18 }
});

db.student.find({
    $nor: [
        { class: "TE A" },
        { grd_point: { $lt: 30 } }
    ]
});

3. MongoDB - Aggregation and Indexing: Design and Develop MongoDB Queries using aggregation and
indexing with suitable example using MongoDB.

Create collection student{ Rollno ,Name, Class, Div, Subject,Marks, Address}and enter 6 entries or
more. And perform the following:
1. Find average of total marks in TOC.
2. Find the number of students division wise.
3. Find students of div B who scored min marks in DBMS.
4. Find total sum of marks in SPOS of students staying pune
5. Find the division wise count of students whose DBMS marks.
6. Find the count of each city.
7. Create the simple and compound Indexing on column.

ans: 
db.createCollection("student");

db.student.insertMany([
    { Rollno: 1, Name: "Amit", Class: "TE", Div: "A", Subject: "TOC", Marks: 80, Address: { city: "Pune" } },
    { Rollno: 2, Name: "Sara", Class: "TE", Div: "B", Subject: "DBMS", Marks: 45, Address: { city: "Mumbai" } },
    { Rollno: 3, Name: "Ravi", Class: "TE", Div: "B", Subject: "SPOS", Marks: 75, Address: { city: "Pune" } },
    { Rollno: 4, Name: "Mona", Class: "TE", Div: "A", Subject: "DBMS", Marks: 60, Address: { city: "Nashik" } },
    { Rollno: 5, Name: "Raj", Class: "TE", Div: "B", Subject: "TOC", Marks: 65, Address: { city: "Pune" } },
    { Rollno: 6, Name: "Sita", Class: "TE", Div: "A", Subject: "SPOS", Marks: 85, Address: { city: "Mumbai" } }
]);

db.student.aggregate([
    { $match: { Subject: "TOC" } },
    { $group: { _id: "$Subject", averageMarks: { $avg: "$Marks" } } }
]);

db.student.aggregate([
    { $group: { _id: "$Div", studentCount: { $sum: 1 } } }
]);

db.student.aggregate([
    { $match: { Div: "B", Subject: "DBMS" } },
    { $group: { _id: "$Div", minMarks: { $min: "$Marks" }, student: { $first: "$Name" } } }
]);

db.student.aggregate([
    { $match: { Subject: "SPOS", "Address.city": "Pune" } },
    { $group: { _id: null, totalMarks: { $sum: "$Marks" } } }
]);

db.student.aggregate([
    { $match: { Subject: "DBMS" } },
    { $group: { _id: "$Div", count: { $sum: 1 } } }
]);

db.student.aggregate([
    { $group: { _id: "$Address.city", cityCount: { $sum: 1 } } }
]);

db.student.createIndex({ Rollno: 1 });

db.student.createIndex({ Class: 1, Div: 1 });



