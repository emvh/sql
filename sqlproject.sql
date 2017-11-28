CREATE TABLE projectdraft.customer(
  Customer_id int IDENTITY(1,1) NOT NULL UNIQUE,
  First_Name varchar(15),
  Last_Name VARCHAR(15),
  Email_Address varchar(50),
  Phone_Number varchar(50),
  Billing_ID varchar(5),
  Address_ID varchar(5),
  PRIMARY KEY (Customer_id),
);

INSERT INTO projectdraft.customer VALUES ('Steven','La','sla@gmail.com','408-123-4567',100,200);
INSERT INTO projectdraft.customer VALUES ('Ken','Ohata','kohata@gmail.com','408-123-4568',101,201);
INSERT INTO projectdraft.customer VALUES ('Andrew','Lee','alee@gmail.com','408-123-4569',102,202);
INSERT INTO projectdraft.customer VALUES ('Emily','Ho','eho@gmail.com','408-123-4560',103,203);
INSERT INTO projectdraft.customer VALUES ('Alice','James','ajames@gmail.com','408-123-4561',104,204);
INSERT INTO projectdraft.customer VALUES ('Will','Smith','wsmith@gmail.com','408-123-4562',105,205);


CREATE TABLE projectdraft.billing_info(
  Billing_id int IDENTITY(100,1) NOT NULL,
  Billing_FName varchar(15),
  Billing_LName varchar(15),
  Billing_address varchar(50),
  Billing_city varchar(20),
  Billing_state varchar(2),
  Billing_zipcode varchar(15),
  Customer_id  int,
  PRIMARY KEY (Billing_id),
  FOREIGN KEY (Customer_id) REFERENCES projectdraft.customer(Customer_id)
);

INSERT INTO projectdraft.billing_info VALUES ('Steven','La','1560 Shumaker','San Jose','CA','95131',1);
INSERT INTO projectdraft.billing_info VALUES ('Ken','Ohata','200 Music Way','Irvine','CA','92602',2);
INSERT INTO projectdraft.billing_info VALUES ('Andrew','Lee','300 Music Way','Irvine','CA','92602',3);
INSERT INTO projectdraft.billing_info VALUES ('Emily','Ho','400 Music Way','Irvine','CA','92602',4);
INSERT INTO projectdraft.billing_info VALUES ('Alice','James','500 Music Way','Irvine','CA','92602',5);
INSERT INTO projectdraft.billing_info VALUES ('Will','Smith','600 Music Way','Irvine','CA','92602',6);



CREATE TABLE projectdraft.shipping_info(
  Address_id int IDENTITY(200,1) NOT NULL,
  First_Name varchar(15),
  Last_Name varchar(15),
  Address_line1 VARCHAR(40),
  Address_line2 VARCHAR(40),
  City VARCHAR(15),
  State VARCHAR(15),
  Zipcode VARCHAR(15),
  Phone_number VARCHAR(15),
  Customer_id int,
  PRIMARY KEY (Address_id),
  FOREIGN KEY (Customer_id) REFERENCES projectdraft.customer(Customer_id)
);

INSERT INTO projectdraft.shipping_info VALUES ('Steven','La','3975 Freedom Cicle',' ','Santa Clara','CA','95131','408-503-0289',1);
INSERT INTO projectdraft.shipping_info VALUES ('Ken','Ohata','200 Music Way',' ','Irvine','CA','92602','408-123-4568',2);
INSERT INTO projectdraft.shipping_info VALUES ('Andrew','Lee','300 Music Way',' ','Irvine','CA','92602','408-123-4569',3);
INSERT INTO projectdraft.shipping_info VALUES ('Emily','Ho','400 Music Way',' ','Irvine','CA','92602','408-123-4560',4);
INSERT INTO projectdraft.shipping_info VALUES ('Amy','James','100 Apple Way','Apt 605','Santa Clara','CA','95131','408-503-1111',5);
INSERT INTO projectdraft.shipping_info VALUES ('Cat','Smith','200 Apple Way',' ','Santa Clara','CA','95131','408-503-2222',6);



create table projectdraft.orders
  (Orders_id INT IDENTITY(300,1) NOT NULL,
  Order_date DATETIME,
  Paymentstatus VARCHAR(15),
  Billing_address VARCHAR(30),
  total int,
  Customer_id INT,
  PRIMARY KEY (orders_id),
  FOREIGN KEY (Customer_id) REFERENCES projectdraft.customer);

insert into projectdraft.orders VALUES (getdate(), 'paid', '1666 Foxy', 45, 1)



/* PAYMENT TYPE */

CREATE TABLE projectdraft.payment_type(
  Payment_type_id int IDENTITY(400,1) NOT NULL,
  Payment_type    varchar(30),
  PRIMARY KEY (Payment_type_id)
  );

INSERT INTO projectdraft.payment_type values ('American Express');
INSERT INTO projectdraft.payment_type values ('Discover');
INSERT INTO projectdraft.payment_type values ('Visa');


/* PAYMENT METHOD */

CREATE TABLE projectdraft.paymentmethod(
  Payment_id int IDENTITY(500,1) NOT NULL,
  Customer_id int,
  Payment_type_id int,
  Card_Number VARCHAR(19),
  NameOnCard VARCHAR(50),
  CardExp DATE,
  Card_CSV_code VARCHAR(15),
  Billing_id int,
  PRIMARY KEY (Payment_id),
  FOREIGN KEY (Customer_id) REFERENCES projectdraft.customer(Customer_id),
  FOREIGN KEY (Payment_type_id) REFERENCES projectdraft.payment_type,
  FOREIGN KEY (Billing_id) REFERENCES projectdraft.billinginfo(Billing_id)
);

INSERT INTO projectdraft.paymentmethod VALUES (1,400,'4352-5423-6675-4404','Steven La','01/20/2022','234',100);
INSERT INTO projectdraft.paymentmethod VALUES (2,400,'4352-5423-6675-3333','Ken Ohata','02/18/2019','200',101);
INSERT INTO projectdraft.paymentmethod VALUES (3,400,'4352-5423-6675-1111','Andrew Lee','03/05/2020','196',102);
INSERT INTO projectdraft.paymentmethod VALUES (4,400,'4352-5423-6675-2222','Emily Ho','04/10/2021','789',103);
INSERT INTO projectdraft.paymentmethod VALUES (5,400,'4352-5423-6675-4000','Alice James','05/07/2022','453',104);
INSERT INTO projectdraft.paymentmethod VALUES (6,400,'4352-5423-6675-5000','Will Smith','06/11/2019','567',105);




create table projectdraft.orderpayment
  (Order_id INT,
  Payment_id INT,
  Payment_status VARCHAR(15)
  FOREIGN KEY (Order_id) REFERENCES projectdraft.orders,
  FOREIGN KEY (Payment_id) REFERENCES projectdraft.paymentmethod);

insert into projectdraft.orderpayment VALUES (300, 500, 'PAID')



/* PROD TYPE */

CREATE TABLE projectdraft.product_type (
  Prodtype_id int IDENTITY(700,1) NOT NULL,
  Prodtype_name varchar(15)
  PRIMARY KEY (Prodtype_id)
  );

INSERT INTO projectdraft.product_type VALUES ('Digital Track');
INSERT INTO projectdraft.product_type VALUES ('Digital Album');
INSERT INTO projectdraft.product_type VALUES ('Physical Album');
INSERT INTO projectdraft.product_type VALUES ('Merchandise');
INSERT INTO projectdraft.product_type VALUES ('Ticket');




/* ARTIST */

CREATE TABLE projectdraft.artist(
  Artist_id int IDENTITY(800,1) NOT NULL UNIQUE,
  Artist_name varchar(15)
  PRIMARY KEY (Artist_id)
  );

INSERT INTO projectdraft.artist VALUES ('Eminem');
INSERT INTO projectdraft.artist VALUES ('Kanye West');
INSERT INTO projectdraft.artist VALUES ('Linkin Park');
INSERT INTO projectdraft.artist VALUES ('Kanye West');
INSERT INTO projectdraft.artist VALUES ('Sam Smith');
INSERT INTO projectdraft.artist VALUES ('Adele');
INSERT INTO projectdraft.artist VALUES ('Drake');
INSERT INTO projectdraft.artist VALUES ('J. Cole');



CREATE TABLE projectdraft.track(
  Track_id varchar(15),
  Track_name varchar(15),
  Album_id varchar(15),
  Artist_id int,
  Prodtype_id varchar(15),
  Track_price float,
  PRIMARY KEY (Track_id),
  FOREIGN KEY (Artist_id) REFERENCES projectdraft.artist(Artist_id)
);

INSERT INTO projectdraft.track VALUES ('T1','Lose Yourself',900, 800, 700, 0.99);
INSERT INTO projectdraft.track VALUES ('T2','Wolves',901, 801, 700, 0.99);
INSERT INTO projectdraft.track VALUES ('T3','Numb',902, 802, 700, 0.99);
INSERT INTO projectdraft.track VALUES ('T4','Too Good at Goodbyes',903, 803, 700, 0.99);
INSERT INTO projectdraft.track VALUES ('T5','Hello',904, 804, 700, 0.99);
INSERT INTO projectdraft.track VALUES ('T6','Fireworks',905, 805, 700, 0.99);
INSERT INTO projectdraft.track VALUES ('T7','In The Morning',906, 806, 700, 0.99);



CREATE TABLE projectdraft.album(
  Album_id varchar(15),
  Album_name varchar(50),
  Album_realease_year int,
  Prodtype_id int,
  Artist_id int,
  Album_price float,
  PRIMARY KEY (Album_id),
  FOREIGN KEY (Artist_id) REFERENCES projectdraft.artist(Artist_id),
  FOREIGN KEY (Prodtype_id) REFERENCES projectdraft.product_type(Prodtype_id)
);

INSERT INTO projectdraft.album VALUES ('A1','8 Mile', 2002, 701, 800, 6.99);
INSERT INTO projectdraft.album VALUES ('A2','The Life of Pablo', 2004, 701, 801, 11.99);
INSERT INTO projectdraft.album VALUES ('A3','Meteora', 2003, 701, 802, 7.99);
INSERT INTO projectdraft.album VALUES ('A4','The Thrill of It All', 2017, 701, 803, 9.99);
INSERT INTO projectdraft.album VALUES ('A5','25', 2015, 701, 804, 10.99);
INSERT INTO projectdraft.album VALUES ('A6','Thank Me Later', 2010, 701, 805, 6.99);
INSERT INTO projectdraft.album VALUES ('A7','Cole World', 2011, 701, 806, 11.99);
INSERT INTO projectdraft.album VALUES ('A8','8 Mile', 2002, 702, 800, 6.99);
INSERT INTO projectdraft.album VALUES ('A9','The Life of Pablo', 2004, 702, 801, 11.99);
INSERT INTO projectdraft.album VALUES ('A10','Meteora', 2003, 702, 802, 7.99);
INSERT INTO projectdraft.album VALUES ('A11','The Thrill of It All', 2017, 702, 803, 9.99);
INSERT INTO projectdraft.album VALUES ('A12','25', 2015, 702, 804, 10.99);
INSERT INTO projectdraft.album VALUES ('A13','Thank Me Later', 2010, 702, 805, 6.99);
INSERT INTO projectdraft.album VALUES ('A14','Cole World', 2011, 702, 806, 11.99);



CREATE TABLE projectdraft.merchandise(
  Merch_id varchar(15),
  Merchandise_name varchar(50),
  Prodtype_id int,
  Artist_id int,
  Merch_price float,
  PRIMARY KEY (Merch_id),
  FOREIGN KEY (Artist_id) REFERENCES projectdraft.artist(Artist_id),
  FOREIGN KEY (Prodtype_id) REFERENCES projectdraft.product_type(Prodtype_id)
);

INSERT INTO projectdraft.merchandise VALUES ('M1','Eminem Hoodie', 703, 800, 45.00);
INSERT INTO projectdraft.merchandise VALUES ('M2','Kanye Shirt', 703, 801, 50.00);
INSERT INTO projectdraft.merchandise VALUES ('M3','Linkin Park Hat', 703, 802, 30.00);
INSERT INTO projectdraft.merchandise VALUES ('M4','Sam Smith Hoodie', 703, 803, 72.99);
INSERT INTO projectdraft.merchandise VALUES ('M5','Adele Bag', 703, 804, 40.00);
INSERT INTO projectdraft.merchandise VALUES ('M6','Drake Hat', 703, 805, 48.00);
INSERT INTO projectdraft.merchandise VALUES ('M7','J. Cole Duffel', 703, 806, 65.00);



CREATE TABLE projectdraft.ticket(
  Ticket_id varchar(15),
  Event_name varchar(100),
  Event_date date,
  Event_location varchar(50),
  Artist_id int,
  Prodtype_id int,
  Ticket_price int,
  PRIMARY KEY (Ticket_id),
  FOREIGN KEY (Artist_id) REFERENCES projectdraft.artist(Artist_id),
  FOREIGN KEY (Prodtype_id) REFERENCES projectdraft.product_type(Prodtype_id)
  );

INSERT INTO projectdraft.ticket VALUES ('TICK1','Eminem Concert', '08/20/2018', 'SAP Center',800,704,65.00);
INSERT INTO projectdraft.ticket VALUES ('TICK2','Kanye Concert', '09/25/2018', 'Oracle Coliseum',801,704,40.00);
INSERT INTO projectdraft.ticket VALUES ('TICK3','Linkin Park: One More Light', '12/15/2017', 'Fox Theatre',802,704,80.00);
INSERT INTO projectdraft.ticket VALUES ('TICK4','Sam Smith: The Thrill of It All', '08/24/2018', 'Shoreline',803,704,130.00);
INSERT INTO projectdraft.ticket VALUES ('TICK5','Adele Live 2018', '05/10/2018', 'Staples Center',804,704,110.00);
INSERT INTO projectdraft.ticket VALUES ('TICK6','Drake Summer Sixteen Tour', '06/27/2018', 'Madison Square Garden',805,704,150.00);
INSERT INTO projectdraft.ticket VALUES ('TICK7','Cole World Concert', '07/18/2018', 'The Observatory',806,704,108.00);



create table projectdraft.order_line
(
  Order_Line_id   INT IDENTITY(1400,1) NOT NULL,
  Order_id        INT,
  Quantity        VARCHAR(15),
  Sku_id          VARCHAR(15),
  Purchase_date   VARCHAR(15),
  Returnable_date VARCHAR(15),
  PRIMARY KEY (Order_Line_id),
  FOREIGN KEY (Order_id) REFERENCES projectdraft.orders,
  FOREIGN KEY (Sku_id) REFERENCES projectdraft.inventory(Sku_id)
)

INSERT INTO projectdraft.order_line VALUES (300, 5,'1300A1', GETDATE(), dateadd(day, 30, getdate()))

create table projectdraft.inventory
  (Inventory_id INT IDENTITY(1300,1) NOT NULL,
  Sku_id VARCHAR(15) UNIQUE ,
  Product_id VARCHAR(15),
  Prodtype_id INT,
  Returnable VARCHAR(15),
  PRIMARY KEY (Product_id),
  FOREIGN KEY (Prodtype_id) REFERENCES projectdraft.product_type
  )


delete from projectdraft.order_line
delete from projectdraft.inventory

select * from projectdraft.album

select * from projectdraft.inventory


INSERT INTO projectdraft.inventory (Product_id, Prodtype_id, Sku_id, Returnable)
SELECT projectdraft.album.Album_id, Prodtype_id, concat('A1-', Prodtype_id), 'NO'
FROM projectdraft.album

INSERT INTO projectdraft.inventory (Product_id, Prodtype_id, Sku_id, Returnable)
SELECT projectdraft.album.Album_id, Prodtype_id, concat('A1-', Prodtype_id), 'NO'
FROM projectdraft.album where Prodtype_id = 700
