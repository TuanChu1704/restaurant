create database Jujurestaurant;
  
  -- Create a SQL table called customer that stores customer_ID, last_name, first_name, address, area_code, phone
  CREATE TABLE Jujurestaurant.customer(
customer_ID INT,
last_name VARCHAR(20),
first_name VARCHAR(20),
address VARCHAR(200),
area_code VARCHAR(20),
phone Int,
PRIMARY KEY (customer_ID)
);

-- Create premiumcustomer table
  CREATE TABLE Jujurestaurant.premiumcustomer(
customer_ID INT,
discount_percent VARCHAR(20),
PRIMARY KEY (customer_ID),
foreign key (cusromer_ID) references customer(customer_ID)
);

-- Create normalcustomer table
  CREATE TABLE Jujurestaurant.normalcustomer(
customer_ID INT,
PRIMARY KEY (customer_ID),
foreign key (cusromer_ID) references customer(customer_ID)
);

  -- Create a SQL table called catalog that stores product_id, price, product_name, prodcut_type,quantity.
  CREATE TABLE Jujurestaurant.catalog(
product_id INT,
price VARCHAR(20),
product_name VARCHAR(20),
prodcut_type VARCHAR(200),
PRIMARY KEY (product_id)
);

  -- Create a SQL table called deliver_boy that stores boy_id, boy_name, area_code, boy_phone.
  CREATE TABLE Jujurestaurant.deliver_boy(
boy_id INT,
boy_name VARCHAR(20),
area_code VARCHAR(20),
boy_phone VARCHAR(20),
PRIMARY KEY (boy_id),
foreign key (area_code) references customer(area_code)
);

 -- Create a SQL table called orders that stores order_id, customer_id, product_id,boy_id,order_date,quantity.
  CREATE TABLE Jujurestaurant.orders(
order_id INT,
customer_id INT,
order_date DATE,
PRIMARY KEY (order_id),
foreign key (customer_id) references customer(customer_id)
);

-- Create onlineorder table
  CREATE TABLE Jujurestaurant.onlineorder(
order_id INT,
boy_id INT,
product_id INT,
quantity INT,
PRIMARY KEY (order_id),
foreign key (boy_id) references deliver_boy(boy_id),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references catalog(product_id)
);

-- Create OnPremisesOrder table
  CREATE TABLE Jujurestaurant.OnPremisesOrder(
order_id INT,
table_number INT,
product_id INT,
quantity INT,
PRIMARY KEY (order_id),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references catalog(product_id)
);

-- Create delivery table
  CREATE TABLE Jujurestaurant.delivery(
delivery_id INT, 
order_id INT,
boy_id INT,
area_code VARCHAR(20),
PRIMARY KEY (delivery_id),
foreign key (order_id) references onlineorder(order_id),
foreign key (boy_id) references deliver_boy(boy_id)
);

-- Insert the data into the table deliver_boy
INSERT INTO deliver_boy (`boy_id`,`boy_name`,`boy_phone`,`area_code`)
VALUES 
(01, 'Charlie', 0132993435,'A01'),
(02, 'Hitle', 03434995956,'B01'),
(03, 'Momotato', 04039045055,'C01'),
(04, 'Bingchili', 02384787385,'D01');

-- Insert the data into the table catalog
INSERT INTO catalog (`product_id`,`price`,`product_name`,`prodcut_type`)
VALUES 
(01, '10$', 'Goodnight my love', 'food'),
(02, '12$', 'See you tomorrow', 'food'),
(03, '6$', 'Have a nice day', 'beverage'),
(04, '19$', 'Power of money', 'food');

-- Insert the data into the table normalcustomer
INSERT INTO normalcustomer(`customer_ID`,`last_name`,`first_name`,`address`,`area_code`,`phone`)
VALUES 
(0001, 'Yamamoto', 'Asahi', '112 Le Loi, Q7', 'A01', 0123556677),
(0002, 'Nguyen', 'Akatsuki', '11/4 Ha Huy Tap, Q7', 'A02', 0288844485),
(0003, 'Uzumaki', 'Sasuke', '007 Lang La, Q12', 'C01',03430495049),
(0004, 'Nobi', 'Doraemon', '54 Hai Ba Trung, Q10', 'D01', 0349945423);

-- Insert the data into the table premiumcustomer
INSERT INTO premiumcustomer(`customer_ID`,`last_name`,`first_name`,`address`,`area_code`,`phone`,`discount_percent`)
VALUES 
(0005, 'Bao', 'Tuan', '7749 Nguoi Co Don, Q1', 'E01', 0777777777,'90%'),
(0006, 'Phu', 'Chau', '0404 Nguoi Kho O, Thu Duc', 'F01', 0029308453,'80%'),
(0007, 'Thien', 'Minh','777 Nguoi May Man, Q12', 'C02',03843508345,'50%'),
(0008, 'Gia', 'Dinh', '0515 Nguoi Ban Do Co, Q9', 'E02', 0384934484,'100%'),
(0009, 'Anh', 'Huy', '142 Nguoi Cao Tuoi, Q8', 'B01', 0124654362,'60%');