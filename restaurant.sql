create database Jujurestaurant;
  
  -- Create a SQL table called customer that stores customer_ID, last_name, first_name, address, area_code, phone,discount_percent.
  CREATE TABLE Jujurestaurant.customer(
customer_ID INT auto_increment,
last_name VARCHAR(20),
first_name VARCHAR(20),
address VARCHAR(200),
area_code VARCHAR(20),
phone Int,
discount_percent VARCHAR(10) DEFAULT '0',
PRIMARY KEY (customer_ID)
);

  -- Create a SQL table called catalog that stores product_id, price, product_name, prodcut_type,descriptions.
  CREATE TABLE Jujurestaurant.catalog(
product_id INT auto_increment,
price VARCHAR(20),
descriptions VARCHAR(500),
product_name VARCHAR(20),
prodcut_type VARCHAR(20),
product_img BLOB,
PRIMARY KEY (product_id)
);

  -- Create a SQL table called deliver_boy that stores boy_name, area_code, boy_phone.
  CREATE TABLE Jujurestaurant.deliver_boy(
boy_name VARCHAR(20),
area_code VARCHAR(20),
boy_phone VARCHAR(20),
PRIMARY KEY (area_code)
);


-- Create onlineorder table that stores order_id, customer_id, product_id,order_date,quantity,area_code,address.
  CREATE TABLE Jujurestaurant.onlineorder(
order_id INT auto_increment,
order_date DATE,
customer_id INT,
product_id INT,
area_code VARCHAR(20),
address VARCHAR(200),
quantity INT,
PRIMARY KEY (order_id),
foreign key (area_code) references deliver_boy(area_code)
);

-- Create OnPremisesOrder table that stores order_id, customer_id, product_id,order_date,quantity,table_number,Number_of_ppl.
  CREATE TABLE Jujurestaurant.OnPremisesOrder(
order_id INT auto_increment,
customer_id INT,
order_date DATE,
product_id INT,
quantity INT,
table_number INT,
Number_of_ppl INT,
PRIMARY KEY (order_id
);

-- Insert the data into the table customer
INSERT INTO customer(`customer_ID`,`last_name`,`first_name`,`address`,`area_code`,`phone`)
VALUES 
(5,	'Huong','Thu','Duong Ba Trac','B01',12465436),
(10,'Thanh','Manh','Nguyen Thi Thap','B01',124654487),
(11,'Nam','Phuong','Nguyen Thi Thap','B01',753644362),
(15,'Nhu','Phuong','Nguyen Thi Thap','B01',124654444),
(17,'Van','khanh','Nguyen Trai','C01',124685246),
(18,'Phung','Nguyen','Nguyen Van Linh','A01',303054362),
(21,'Hoa','Vuong','Nguyen Van Linh','A01',156487529),
(22,'Thai','Vu','Nguyen Thi Thap','B01',257986456),
(24,'Khuong','Vuong','Ba Dinh','D01',254385148),
(1,'Chu','Tuan','Nguyen Van Linh','A01',592509949),
(6,'Linh','Hoang','Tran Hung Dao','C01',224654362),
(16,'Phu','Nguyen','Ba Dinh','D01',935424362),
(25,'Son','Vuong','Nguyen Thi Thap','B01',598756420),
(8,'Ong','Du','Nguyen Van Linh','A01',124324362),
(13,'Ngo','Vy','Ba Dinh','D01',156989313),
(3,'Tran','Hoang','Tran Hung Dao','C01',543508345),
(7,'Vuong','Pham','Nguyen Thi Thap','B01',624654362),
(23,'Khang','Huynh','Nguyen Trai','C01',129635478),
(26,'Nhung','Nguyen','Nguyen Thi Thap','B01',564732163),
(2,'Trung','Manh','Duong Ba Trac','B01',129308453),
(4,'Hai','Lam','Tran Hung Dao','C01',384934484),
(19,'Hien','Nguyen','Tran Hung Dao','C01',697654362),
(20,'Nhi','Nguyen','Ba Dinh','D01',302424362),
(27,'Thuy','Thai','Nguyen Van Linh','A01',745986369);

-- Insert the data into the table deliver_boy
INSERT INTO deliver_boy (`boy_name`,`boy_phone`,`area_code`)
VALUES 
('Charlie', 0132993435,'A01'),
( 'Hitle', 03434995956,'B01'),
( 'Momotato', 04039045055,'C01'),
( 'Bingchili', 02384787385,'D01');

-- Insert the data into the table catalog
INSERT INTO catalog (`product_id`, `price`, `product_name`, `product_type`, `descriptions`, `product_img`)
VALUES 
(2, '15$', 'Ramen', 'Food', 'Rramen is a Japanese noodle soup, with a combination of a rich flavoured broth, one of a variety of types of noodle and a selection of meats or vegetables, often topped with a boiled egg.', load_file('img\\ramen.png')),
(7, '7$', 'Cappuccino', 'Beverage', 'The traditional cappuccino consists of a single espresso, on which the barista pours the hot foamed milk.', load_file('img\\Cappuccino.png')),
(6, '13$', 'Katsudon', 'Food', 'Katsudon is a popular Japanese food, a bowl of rice topped with a deep-fried breaded pork cutlet, egg, vegetables, and condiments.', load_file('img\\katsudon.png')),
(4, '75$', 'Coca-Cola', 'Beverage', 'Sugar – Coca-Cola Classic sweet taste (and also some of its mouthfeel) comes from sugar. Coca-Cola Zero Sugar and Diet Coke are sugar free.', load_file('img\\coca.png')),
(8, '13$', 'Tempura', 'Food', 'Tempura is a typical Japanese dish usually consisting of seafood, meat and vegetables that have been battered and deep fried.', load_file('img\\Tempura.png')),
(1, '10$', 'Sushi', 'Food', 'Sushi, a staple rice dish of Japanese cuisine, consisting of cooked rice flavoured with vinegar and a variety of vegetable, egg, or raw seafood garnishes and served cold.', load_file('img\\shushi.png')),
(3, '10$', 'Takoyaki', 'Food', 'a ball-shaped Japanese snack made of a wheat flour-based batter and cooked in a special molded pan. It is typically filled with minced or diced octopus (tako), tempura scraps.', load_file('img\\Takoyaki.png')),
(10, '20$', 'Unadon', 'Food', 'Unadon is a beloved Japanese dish consisting of steamed rice topped with grilled eels that are glazed with a sweetened soy-based sauce (called tare) and caramelized.', load_file('img\\Unadon.png')),
(11, '5$', 'Matcha', 'Beverage', 'Matcha is a type of powdered green tea. It is very high in antioxidants and has numerous health benefits for your body and brain.', load_file('img\\Matcha.png')),
(5, '17$', 'Okonomiyaki', 'Food', 'Okonomiyaki is a Japanese Teppanyaki, savoury pancake dish consisting of wheat flour batter and other ingredients cooked on a teppan. Common additions include cabbage, meat, and seafood, and toppings.', load_file('img\\Okonomiyaki.png')),
(9, '16$', 'Yakisoba', 'Food', 'Yakisoba is a classic Japanese stir-fried noodle dish that’s seasoned with a sweet and savory sauce similar to Worcestershire sauce.', load_file('img\\Yakisoba.png'));

-- Insert the data into the table onlineorder
INSERT INTO onlineorder(order_date,customer_id,product_id,area_code,address,quantity)
VALUES
('2023-4-3',2,12,'B01','Duong Ba Trac',1),
('2023-4-11',8,10,'A01','Nguyen Van Linh',1),
('2023-4-13',17,2,'C01','Nguyen Trai',1),
('2023-4-14',24,5,'D01','Ba Dinh',1),
('2023-4-15',19,3,'C01','Tran Hung Dao',1),
('2023-4-7',3,2,'C01','Tran Hung Dao',1),
('2023-4-9',9,8,'C01','Nguyen Trai',2),
('2023-4-10',6,6,'C01','Tran Hung Dao',1),
('2023-4-14',14,6,'D01','Ba Dinh',2),
('2023-4-16',23,9,'C01','Nguyen Trai',1),
('2023-4-9',9,9,'C01','Nguyen Trai',3),
('2023-4-9',11,6,'B01','Nguyen Thi Thap',3),
('2023-4-16',4,5,'C01','Tran Hung Dao',2),
('2023-4-15',20,3,'D01','Ba Dinh',1),
('2023-4-3',2,5,'B01','Duong Ba Trac',1),
('2023-4-15',11,5,'B01','Nguyen Thi Thap',5);

-- Insert the data into the table OnPremisesOrder
INSERT INTO OnPremisesOrder(`order_date`,`customer_id`,`product_id`,`quantity`,`table_number`,`Number_of_ppl`)
VALUES 
('2023-4-9',2,7,2,2,2),
('2023-6-1',1,1,6,2,1),
('2023-4-8',2,4,10,2,4),
('2023-4-9',1,1,6,6,1),
('2023-4-10',1,15,6,5,1),
('2023-4-11',1,16,1,2,1),
('2023-4-12',4,18,5,1,4),
('2023-4-12',2,3,6,1,2),
('2023-4-13',1,21,3,1,2),
('2023-4-13',2,11,5,3,2),
('2023-4-14',2,25,6,3,2),
('2023-4-15',5,9,12,1,5),
('2023-4-16',2,14,6,3,2),
('2023-4-5',2,3,2,3,2),
('2023-4-6',2,3,3,1,2);
