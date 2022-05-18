/*
 * numeric:
 * int
 * bigint
 * float
 * money
 *
 * character:
 * char
 * varchar(n) like a string where n is the number of characters
 *
 * binary:
 * bit
 * blob
 * clob
 * file
 *
 * date
 * datetime
 *
 * refresher: a primary key is unique to the table and is used to indentify a value
 * (it's also used to physically order items on the storage disk, so searching for a primary key
 * is very fast)
 *
 * a foreign key *must reference a primary key*
 *
 * Refresh in dbeaver by pressing f5
 */
DROP TABLE Grocery;
DROP TABLE FoodType;
DROP TABLE Availability;
DROP TABLE Supermarket ;

CREATE TABLE FoodType(
                         FoodTypeID int primary key,
                         FoodTypeName varchar(255),
                         CanEat bit
);

CREATE TABLE Grocery(
                        GroceryID int primary key,
                        GroceryName varchar(255),
                        FoodType int,
                        FOREIGN KEY (FoodType) references FoodType(FoodTypeID)
);

CREATE TABLE Supermarket(
                            SupermarketID int primary key,
                            SupermarketName varchar(255),
);
CREATE TABLE Availability(
                             SupermarketID int,
                             GroceryID int,
                             Price money,
                             PRIMARY KEY(SupermarketID, GroceryID),
                             FOREIGN KEY (SupermarketID) references Supermarket(SupermarketID),
                             FOREIGN KEY (GroceryID) references Grocery(GroceryID),
                             CHECK (Price>0)
);

INSERT INTO FOODTYPE(FoodTypeID, FoodTypeName, CanEat) VALUES (0, 'Fruit', 1);
INSERT INTO FOODTYPE(FoodTypeID, FoodTypeName, CanEat) VALUES (1, 'Meat', 1);

INSERT INTO Grocery
VALUES
    (1, 'Chimkin', 1),
    (2, 'Banana', 0),
    (3, 'Beef', 1);

INSERT INTO Supermarket
VALUES
    (1, 'Aldi'),
    (2, 'Publix');

INSERT INTO Availability
(SupermarketID, GroceryID, Price)
VALUES
    (1, 1, 5.99),
    (1, 2, 0.69),
    (1, 3, 7.99),
    (2, 1, 6.99),
    (2, 2, 1.69),
    (2, 3, 8.99);

--select
SELECT * FROM FoodType;
SELECT * FROM Grocery;
--select all groceries with foodtype 1
SELECT * From Grocery WHERE FoodType = 1;
--select all groceries together with their food type
SELECT * FROM GROCERY INNER JOIN FoodType ON FoodType = FoodTypeID;
--select all groceries (the nested select doesnt do anything)
SELECT * FROM (SELECT * FROM Grocery) as x;
--select the amount of rows generated from selecting groceries together with food type when food type is meat
SELECT count(*) FROM
    (SELECT * FROM GROCERY INNER JOIN FoodType ON FoodType = FoodTypeID WHERE FoodTypeName = 'meat') as x;
-- count is an example of an aggregate query, like max, min, avg, sum


/*
 * There are what we call 'sublanguages' in sql
 * DDL Data definition language (creating, altering tables)
 * DQL Data query language (selects)
 * DML Data modification language (updates, inserts)
 * TCL Transaction control language (commit)
 * DCL Data control language (permissions)
 *
 */

SELECT * FROM Availability;
SELECT * FROM Availability INNER JOIN Supermarket on Availability.SupermarketID = Supermarket.SupermarketID;

SELECT GroceryName, Price, SupermarketName FROM GROCERY INNER JOIN
                                                (SELECT Availability.SupermarketID, Price, SupermarketName, GroceryID
                                                 FROM Availability INNER JOIN Supermarket on Availability.SupermarketID = Supermarket.SupermarketID) as n
                                                ON GROCERY.GroceryID = n.GroceryID;

CREATE VIEW Price_Comparison AS
SELECT GroceryName, Price, SupermarketName FROM GROCERY INNER JOIN
                                                (SELECT Availability.SupermarketID, Price, SupermarketName, GroceryID
                                                 FROM Availability INNER JOIN Supermarket on Availability.SupermarketID = Supermarket.SupermarketID) as n
                                                ON GROCERY.GroceryID = n.GroceryID;

Select * From Price_Comparison;

UPDATE Availability SET Price = 13.99 where GroceryID = 1;

INSERT INTO Supermarket
(SupermarketID, SupermarketName)
Values(3, 'Whole Foods');

DELETE FROM Supermarket Where SupermarketName = 'Whole Foods';

SELECT GroceryName, AVG(Price) From Price_Comparison GROUP BY GroceryName;

SELECT * from Grocery
EXCEPT
SELECT * from Grocery where GroceryName = 'Chimkin';

/*
 * Set operations like Except, intersect, union
 * Scalar queries like uppercase, lowercase, floor, ceiling
 *  aggregate query, like max, min, avg, sum
 *
 * Scalar and aggregate queries? aggregates combine data into a single result, scalar queries are applied
 * to all data (linearly)
 */

/*
 * What's a table?
 * Nas: One part of database schema that we create in order to interact with database.. so that it's
 * not hard to read, gives integrity, makes it easier to do queries, lets you do queries
 *
 * Tables are the structure of data without our database
 *
 * Multiplicity?
 * Multiple tables, specifically when they are related to each other in a relationship that is
 * one-to-many (food type can be many foods)
 * many-to-many (many groceries at many supermarkets)
 * one-to-one (one supermarket has one parking lot)
 *
 * Primary/foreign keys?
 * primary is a unique identifier for a row in a table..
 * a foreign key is a reference to another table (to a primary key)
 *
 * Normalization?
 * Normalization is all about reducing redundancy while still maintaining all relationships present in
 * our table - 1nf, 2nf, 3nf
 *
 * 1nf - all values are atomic (single value no lists)
 * 2nf - no composite keys (all keys are a single value)
 * 3nf - no transitory relationships (all keys directly related to pkey)
 * this process usually results in us splitting up large tables into small tables that are related
 *
 * Join?
 * Combining tables (typically we say something like table1 join table2 on condition
 * Inner/outer (left/right) join
 *
 * Set operations - combine the "same table" (we can add, subtract two queries with matching columns)
 *
 * Docker
 * kind of like a virtual machine engine.. but not quite (it's not fully virtual)
 * Docker is all about creating standarding environments
 *
 * What's a view?
 * Kind of like saving a query so I can use it later...
 *
 */
























