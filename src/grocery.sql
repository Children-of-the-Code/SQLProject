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

INSERT INTO FOODTYPE(FoodTypeID, FoodTypeName, CanEat) VALUES (0, 'Fruit', 1);
INSERT INTO FOODTYPE(FoodTypeID, FoodTypeName, CanEat) VALUES (1, 'Meat', 1);

INSERT INTO Grocery
VALUES
    (1, 'Chimkin', 1),
    (2, 'Banana', 0),
    (3, 'Beef', 1);

SELECT * FROM FoodType;
SELECT * FROM Grocery;