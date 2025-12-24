CREATE TABLE Customers(
	Customer_id INT PRIMARY KEY,
  	Customer_name VARCHAR(100),
  	Gender VARCHAR(10),
  	city VARCHAR(100),
  	signup_date DATE
);
 
CREATE TABLE Categories(
   	Category_id INT PRIMARY KEY,
   	Category_name VARCHAR(100)
);
   

CREATE TABLE Products(
    	Product_id INT PRIMARY KEY,
   	Product_name VARCHAR(100),
    	category_id INT,
    	Price DECIMAL(10,2),
    	FOREIGN KEY (Category_id) REFERENCES Categories(Category_id)
);

CREATE TABLE Orders(
  	Order_id INT PRIMARY KEY,
  	Customer_id INT,
  	Order_date DATE,
  	Order_status VARCHAR(20),
  	FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);
  
CREATE TABLE Order_item(
	  Order_item_id INT PRIMARY KEY,
	  Order_id INT,
	  Product_id INT,
	  Quantity INT,
   	  Item_price DECIMAL(10,2),
	  FOREIGN KEY(Order_id) REFERENCES Orders(Order_id),
	  FOREIGN KEY (Product_id) REFERENCES Products(Product_id)
);
  
CREATE TABLE Payments(
	  Payment_id INT PRIMARY KEY,
	  Order_id INT,
	  Payment_mode VARCHAR(100),
	  Payment_status VARCHAR(100),
	  FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);
  
