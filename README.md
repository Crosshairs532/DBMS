# DBMS

### What is PostgreSQL?

```md
PostgreSql is a object oriented open source relational database management system.  
Using object-oriented features of PostgreSQL, programmers can:

- Communicate with the database servers using objects in their code.
- Define complex custom data types.
- Define functions that work with their own data types.
- Define inheritance, or parent-child relationships, between tables.
```

### What is the purpose of a database schema in PostgreSQL?

```md
A database schema is the structure or blueprint that defines the organization of data in a database. It outlines how the database is constructed, including tables, relationships, fields, and the constraints that define the type of data that can be stored.

The purpose of the schema are :

- Data Organization and Structure: A schema ensures that the data is organized systematically, making it easier to store, retrieve, and manipulate.
- Data Integrity and Consistency: By enforcing constraints a schema ensures the accuracy and consistency of data across tables.
- A well defined schema serves as a guide for the stakeholders. to make them understand.
- with proper relationship between tables can make query more flexible and less complex.
```

### Explain the primary key and foreign key concepts in PostgreSQL.

```md
- #### Primary key
  - A primary key is a column or a group of columns used to uniquely identify a row in a table.
  - A table can have zero or one primary key. It cannot have more than one primary key.
  - a primary key constraint is the combination of a not-null constraint and a UNIQUE constraint.
- #### Foreign Key
  - a foreign key is a column or a group of columns in a table that uniquely identifies a row in another table.
  - The table containing a foreign key is referred to as the referencing table or child table.Conversely, the table referenced by a foreign key is known as the referenced table or parent table.
  - The main purpose of foreign keys is to maintain referential integrity in a relational database, ensuring that relationships between the parent and child tables are valid.
  - a foreign key maintains consistency by automatically updating or deleting related rows in the child table when changes occur in the parent table
  - a table can contain multiple foreign key.
```

### What is the difference between the VARCHAR and CHAR data types?

| VARCHAR                                                                                |                            CHAR                             |
| -------------------------------------------------------------------------------------- | :---------------------------------------------------------: |
| VARCHAR data type is used to store variable-length character strings                   |      ‘CHAR' for storing fixed-length character strings      |
| VARCHAR(n)                                                                             |                           CHAR(n)                           |
| n defines the maximum length a variable length upto                                    |     n defines the maximum length a variable length upto     |
| it takes the space according to the variable length even it is specified to max length | whatever variable your store it always takes the max length |

### Explain the purpose of the WHERE clause in a SELECT statement.

```md
The WHERE clause is used to filter the records in a table based on a specified condition.
```

### What are the LIMIT and OFFSET clauses used for?

```md
- #### LIMIT
  - Specifies the maximum number of records to return.
  - Often used to paginate results, allowing you to display a subset of data.
- #### OFFSET
  - Specifies the number of records to skip before starting to return records.
  - Used in conjunction with LIMIT for pagination, allowing you to fetch records starting from a specific point.

`SELECT * FROM customers LIMIT 10 OFFSET 20;`
```

### How can you perform data modification using UPDATE statements?

Syntax

```md
UPDATE table_name
SET column1 = value1,
column2 = value2,
WHERE condition;
```

```md
table_name : selects the table i want to modify
set - what is want to change
where condition - where i want to change.
```

### How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?

1. The `COUNT` function counts the number of rows that match a specified condition.

   `SELECT SUM(column_name) FROM table_name WHERE condition;`

2. The `SUM` function calculates the total sum of a numeric column.
   `SELECT SUM(column_name) FROM table_name WHERE condition;`
3. The `AVG` function computes the average value of a numeric column.
   `SELECT AVG(column_name) FROM table_name WHERE condition;`

### What is the significance of the JOIN operation, and how does it work in PostgreSQL?

```md
- Data Integration: JOINs enable the integration of data from different tables, allowing for more comprehensive queries and insights.
- Normalization: They support database normalization, where data is organized into separate tables to reduce redundancy.

SELECT columns
FROM table1
INNER JOIN table2 ON table1.common_column = table2.common_column;
```

### Explain the GROUP BY clause and its role in aggregation operations.

The GROUP BY a clause in PostgreSQL is a powerful tool used to divide rows returned by a ‘SELECT' statement into different groups. it is basically used with `aggregate` functions.

Syntax

```md
SELECT
column_1,
column_2,
computing_function(column_3)
FROM
table_name
GROUP BY
column_1,
column_2;
```
