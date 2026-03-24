# MongoDB Queries

## 1. Show all databases in the cluster

``` js
show dbs
```

## 2. Use a database

``` js
use <db_name>
```

## 3. Insert documents into a collection

### Insert many

``` js
db.students.insertMany([
  { name: "Bob", age: 30, section: "A" },
  { name: "Carol", age: 22, section: "B" },
  { name: "Dave", age: 28, section: "A" }
])
```

### Insert one

``` js
db.students.insertOne({ name: "Bron", age: 42, section: "B" })
```

## 4. Show all documents

``` js
db.students.find().pretty()
```

## 5. Show students older than 20

``` js
db.students.find({ age: { $gt: 20 } }).pretty()
```

## 6. Show students of section A

``` js
db.students.find({ section: "A" }).pretty()
```

## 7. Show students named Bron

``` js
db.students.find({ name: "Bron" }).pretty()
```

## 8. Update one document

``` js
db.students.updateOne(
  { name: "Bob" },
  { $set: { section: "C" } }
)
```

## 9. Update multiple documents

``` js
db.students.updateMany(
  { age: { $lt: 30 } },
  { $set: { grade: "D" } }
)
```

## 10. Delete one document

``` js
db.students.deleteOne({ name: "Bob" })
```

## 11. Delete multiple documents

``` js
db.students.deleteMany({ age: { $lt: 30 } })
```

## 12. Count total documents

``` js
db.students.countDocuments()
```

## 13. Count students of section A

``` js
db.students.countDocuments({ section: "A" })
```

## 14. Sort by age (ascending)

``` js
db.students.find().sort({ age: 1 }).pretty()
```

## 15. Sort by age (descending)

``` js
db.students.find().sort({ age: -1 }).pretty()
```

## 16. Add a new field "city" to all documents

``` js
db.students.updateMany(
  {},
  { $set: { city: "Kathmandu" } }
)
```

## 17. Delete students older than 21

``` js
db.students.deleteMany({ age: { $gt: 21 } })
```

## 18. Delete students between age 17 and 20

``` js
db.students.deleteMany({
  age: { $gte: 17, $lte: 20 }
})
```
