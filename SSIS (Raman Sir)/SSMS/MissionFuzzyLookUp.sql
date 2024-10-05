
---Create the source table
CREATE TABLE CUSTOMERSX
(CUSTOMERID INT PRIMARY KEY,
CUSTOMERNAME NVARCHAR(100)
)

--Insert sample data with variations
INSERT INTO CUSTOMERSX VALUES
(1,'JON SMITH'),
(2,'JOHN SMIITH'),
(3,'JON SMYTH'),
(4, 'ROBERT BROWN'),
(5,'ROBBERT BROWNE'),
(6,'ROBER BROWN')


-- Create the reference table/Fuzzy Lookup table
CREATE TABLE STANDARDCUSTOMERS (
    STANDARDCUSTOMERID INT PRIMARY KEY,
    STANDARDCUSTOMERNAME NVARCHAR(100)
);

-- Insert standardized customer names
INSERT INTO STANDARDCUSTOMERS VALUES
(1, 'JON SMITH'),
(2, 'ROBERT BROWN');


SELECT *FROM MATCHEDCUSTOMERS

--TRUNCATE TABLE MATCHEDCUSTOMERS

-----------------------------------------------------------------------------------------------------------------------------------
-- Create the product reviews table
CREATE TABLE ProductReviews (
    ReviewID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    ReviewText NVARCHAR(500)
);

-- Insert sample data with variations in product names
INSERT INTO ProductReviews (ReviewID, ProductName, ReviewText) VALUES
(1, 'iPhone 12', 'Great product!'),
(2, 'iPhone12', 'Amazing phone with excellent features.'),
(3, 'i-Phone 12', 'Worth every penny.'),
(4, 'Galaxy S21', 'Fantastic phone.'),
(5, 'Galaxy S 21', 'Love the camera on this phone.'),
(6, 'iPhone 12', 'Battery life could be better.');

SELECT *FROM PRODUCTREVIEWS

SELECT *FROM GROUPEDPRODUCTREVIEWS




SELECT *FROM CUSTOMERSX

SELECT *FROM STANDARDCUSTOMERS