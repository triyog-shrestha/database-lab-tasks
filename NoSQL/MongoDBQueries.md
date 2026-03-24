**# MongoDB Queries**



**## 1. Show all databases in the cluster**



**```**

**show dbs**

**```**



**## 2. Use a database**



**```**

**use <db\_name>**

**```**



**## 3. Insert documents into a collection**



**```**

**db.students.insertMany(\[**

&#x20; **{ name: "Bob", age: 30, section: "A" },**

&#x20; **{ name: "Carol", age: 22, section: "B" },**

&#x20; **{ name: "Dave", age: 28, section: "A" }**

**])**

**```**



**```**

**db.students.insertOne({ name: "Bron", age: 42, section: "B" })**

**```**



**## 4. Show documents**



**```**

**db.students.find().pretty()**

**```**



**## 5. Show students older than 20**



**```**

**db.students.find({ age: { $gt: 20 } }).pretty()**

**```**



**## 6. Show students of section A**



**```**

**db.students.find({ section: "A" }).pretty()**

**```**



**## 7. Show students of name Bron**



**```**

**db.students.find({ name: "Bron" }).pretty()**

**```**



**## 8. Update one**



**```**

**db.students.updateOne({ name: "Bob" }, { $set: { section: "C" } })**

**```**



**## 9. Update many**



**```**

**db.students.updateMany({ age: { $lt: 30 } }, { $set: { grade: "D" } })**

**```**



**## 10. Delete one**



**```**

**db.students.deleteOne({ name: "Bob" })**

**```**



**## 11. Delete many**



**```**

**db.students.deleteMany({ age: { $lt: 30 } })**

**```**



**## 12. Count number of documents in a collection**



**```**

**db.students.countDocuments()**

**```**



**## 13. Count students of section A**



**```**

**db.students.countDocuments({ section: "A" })**

**```**



**## 14. Display by sorting in ascending order**



**```**

**db.students.find().sort({ age: 1 }).pretty()**

**```**



**## 15. Display by sorting in descending order**



**```**

**db.students.find().sort({ age: -1 }).pretty()**

**```**



**## 16. Add a new field "city" with value "Kathmandu" to all documents**



**```**

**db.students.updateMany({}, { $set: { city: "Kathmandu" } })**

**```**



**## 17. Delete students older than 21**



**```**

**db.students.deleteMany({ age: { $gt: 21 } })**

**```**





**## 18. Delete students between the age of 17 and 20**

**```**

**db.students.deleteMany({age: {$gte: 17, $lte: 20}})**

**```**

