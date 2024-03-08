CREATE DATABASE bakeryDB
CREATE TABLE Account
(
  UserName VARCHAR(100) NOT NULL,
  FullName VARCHAR(200) NOT NULL,
  Address VARCHAR(500) NOT NULL,
  Phone VARCHAR(50) NOT NULL,
  Role VARCHAR(50) NOT NULL,
  Password NVARCHAR(100) NOT NULL,
  PRIMARY KEY (UserName)
);

CREATE TABLE Invoice
(
  InvoiceID VARCHAR(50) NOT NULL,
  Date DATE NOT NULL,
  CusAddress VARCHAR(500) NOT NULL,
  Total FLOAT NOT NULL,
  CustomerName VARCHAR(200) NOT NULL,
  CusPhone VARCHAR(50) NOT NULL,
  UserName VARCHAR(100) NOT NULL,
  PRIMARY KEY (InvoiceID)
);



CREATE TABLE Product
(
  ProductID VARCHAR(50) NOT NULL,
  Price FLOAT NOT NULL,
  Quantity INT NOT NULL,
  ProName VARCHAR(200) NOT NULL,
  ProImage VARCHAR(500) NOT NULL,
  Describe VARCHAR(1000) NOT NULL,
  TypeName VARCHAR(200) NOT NULL,
  PRIMARY KEY (ProductID),
  
);

CREATE TABLE Cart
(
  QuantityTB INT NOT NULL,
  ProductID VARCHAR(50) NOT NULL,
  UserName VARCHAR(100) NOT NULL,
  Primary key(UserName, ProductID)
);

CREATE TABLE InvoiceDetail
(
  Quantity INT NOT NULL,
  Price FLOAT NOT NULL,
  InvoiceID VARCHAR(50) NOT NULL,
  ProductID VARCHAR(50) NOT NULL,
  PRIMARY KEY (InvoiceID, ProductID)
);
INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (1, 2, 100, 'Croissant', 'img/PRODUCT/Bread/Croissant.png', 'Delicious Significant WorldClass Wonderful', 'Bread');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (2, 3.5, 100, 'Golden Lava Bun', 'img/PRODUCT/Bread/Golden Lava Bun.png', 'Addictive Bread', 'Bread');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (3, 2.5, 100, 'Gourment Fruit Loaf', 'img/PRODUCT/Bread/Gourment Fruit Loaf.png', 'Fresh and healthy as eat fruits', 'Bread');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (4, 3, 100, 'Sausage Standard', 'img/PRODUCT/Bread/Sausage Standard.png', 'The best of choice when you are hungry', 'Bread');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (5, 2.5, 100, 'Spring In The City', 'img/PRODUCT/Bread/Spring In The City.png', 'Like flowers in Spring of the year', 'Bread');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (6, 3, 100, 'Berry Choco', 'img/PRODUCT/Cake slice/Berry Choco.png', 'Sweet like your smile', 'Cake slice');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (7, 3.5, 100, 'Brownie Cheese', 'img/PRODUCT/Cake slice/Brownie Cheese Sliced.jpg', 'Dark like your Eye', 'Cake slice');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (8, 4, 100, 'Bunny', 'img/PRODUCT/Cake slice/Bunny.png', 'Beautiful like your love', 'Cake slice');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (9, 5, 100, 'Chocolate Peanut Mousse', 'img/PRODUCT/Cake slice/Chocolate Peanut Mousse.png', 'Expensive like your me', 'Cake slice');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (10, 3, 100, 'Les Opera Sliced', 'img/PRODUCT/Cake slice/Les Opera Sliced.png', 'Recommendation of Sweeters', 'Cake slice');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (11, 5, 100, 'Oreo Chocolate Cheese', 'img/PRODUCT/Cake slice/Oreo Chocolate Cheese.png', 'Good for fan of Oreo', 'Cake slice');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (12, 8, 100, 'Les Opera', 'img/PRODUCT/Special/Les Opera.png', 'A lot of chocolate', 'Special');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (13, 7, 100, 'MangoCoCo Cake', 'img/PRODUCT/Special/MangoCoCo Cake.png', 'Eat mango and healing', 'Special');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (14, 7.3, 100, 'Party Pink', 'img/PRODUCT/Special/Party Pink.png', 'Pink Pink Pink Pink Pink Pink Pink Pink Pink', 'Special');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (15, 8.8, 100, 'Passion Cheese', 'img/PRODUCT/Special/Passion Cheese.png', 'Fresh and healthy for your health', 'Special');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (16, 10.5, 100, 'Rainbow', 'img/PRODUCT/Special/Rainbow.png', 'After eat this cake, you can fly', 'Special');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (17, 9.2, 100, 'Snowy Fruity', 'img/PRODUCT/Special/Snowy Fruity.png', 'Fruit Fruit Fresh and healthy for your health', 'Special');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (18, 7.5, 100, 'Tiramisu', 'img/PRODUCT/Special/Tiramisu.png', 'Special if you have seen the Tiem Banh Hoang Tu Be Movie', 'Special');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (19, 4.5, 100, 'Chocolate Donut', 'img/PRODUCT/Sweet/Chocolate Donut.png', 'Make you hungry hahahahahahaha', 'Sweet');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (20, 6.5, 100, 'Croffle Chocolate Black', 'img/PRODUCT/Sweet/Croffle Chocolate Black.png', 'Are you ready to eat the best Croffle in the World', 'Sweet');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (21, 6.5, 100, 'Croffle Chocolate White', 'img/PRODUCT/Sweet/Croffle Chocolate White.png', 'It is the same with the Croffle Chocolate Black', 'Sweet');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (22, 4, 100, 'Flan Cake', 'img/PRODUCT/Sweet/Flan Cake.png', 'This cake is the tranditional sweet cake of Viet Nam.', 'Sweet');

INSERT INTO Product (ProductID, Price, Quantity, ProName, ProImage, Describe, TypeName)
VALUES (23, 6.7, 100, 'Japan Light Cheese', 'img/PRODUCT/Sweet/Japan Light Cheese.png', 'I promise that you can speak Japanese very well after eating this cake', 'Sweet');
