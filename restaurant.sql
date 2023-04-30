create database Jujurestaurant;
  
  -- Create a SQL table called customer that stores customer_ID, last_name, first_name, address, area_code, phone,discount_percent.
  CREATE TABLE Jujurestaurant.customer(
customer_ID INT,
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
product_id INT,
price VARCHAR(20),
descriptions VARCHAR(20),
product_name VARCHAR(20),
prodcut_type VARCHAR(200),
PRIMARY KEY (product_id)
);

  -- Create a SQL table called deliver_boy that stores boy_name, area_code, boy_phone.
  CREATE TABLE Jujurestaurant.deliver_boy(
boy_name VARCHAR(20),
area_code VARCHAR(20),
boy_phone VARCHAR(20),
PRIMARY KEY (area_code),
);

 -- Create a SQL table called orders that stores order_id, customer_id, product_id,order_date,quantity.
  CREATE TABLE Jujurestaurant.orders(
order_id INT,
customer_id INT,
order_date DATE DEFAULT GETDATE(),
product_id INT,
quantity INT,
product_img BLOB,
PRIMARY KEY (order_id),
foreign key (customer_id) references customer(customer_id),
foreign key (product_id) references catalog(product_id)
);

-- Create onlineorder table
  CREATE TABLE Jujurestaurant.onlineorder(
order_id INT,
customer_id INT,
order_date DATE DEFAULT GETDATE(),
product_id INT,
quantity INT,
address VARCHAR(200),
area_code VARCHAR(20),
PRIMARY KEY (order_id),
foreign key (area_code) references deliver_boy(area_code)
);

-- Create OnPremisesOrder table
  CREATE TABLE Jujurestaurant.OnPremisesOrder(
order_id INT,
customer_id INT,
order_date DATE DEFAULT GETDATE(),
product_id INT,
quantity INT,
table_number INT,
Number_of_ppl INT,
PRIMARY KEY (order_id)
);
