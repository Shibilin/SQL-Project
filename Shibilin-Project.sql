Create database Library;
Use Library;

Create table Branch(
Branch_no int primary key,
Manager_id int,
Branch_address varchar(30),
Contact_no bigint);
Insert into Branch values (1,100,'NewYork_529_Broadway',65248918),(2,200,'LosAngeles_620_South_broadway',75236841),
							(3,300,'Chicago_669_Michigan',61420098),(4,400,'SanFrancisco_278_Canada',85219776),
                            (5,500,'Miami_1035_Lincoln',94356681);
Select *from Branch;

Create table Employee(
Emp_id int primary key,
Emp_name varchar(20),
Position varchar(15),
Salary int,
Branch_no int, 
foreign key (Branch_no) references Branch (Branch_no) on delete cascade);
Insert into Employee values(100,'John_Wick','Manager',80000,1),(101,'Matt_Rife','Supervisor',65000,1),(102,'Alice_Mike','Librarian',35000,1),
							(103,'Brecky_Jenher','Librarian',35000,1),(104,'Finley_Jake','Librarian',35000,1),
                            (105,'Handson_Holden','Technician',45000,1),(106,'Kendrik_Mall','Technician',45000,1),
                            (200,'Allison_Jane','Manager',80000,2),(201,'Ema_Watson','Supervisor',65000,2),
                            (202,'Mason_Mount','Librarian',35000,2),(203,'Olivia_Martines','Librarian',35000,2),
                            (204,'Benjamin_Anderson','Technician',45000,2),(300,'William_Lee','Manager',80000,3),
                            (301,'Ava_Gonzales','Supervisor',65000,3),(302,'James_Harris','Librarian',35000,3),
                            (303,'Isabella_Clark','Librarian',35000,3),(304,'Henri_Robonson','Technician',45000,3),
                            (400,'Mia_Walker','Manager',80000,4),(401,'Daneil_Lewis','Librarian',35000,4),
                            (402,'Amelia_Young','Librarian',35000,4),(403,'Michael_King','Technician',45000,4),
                            (500,'Harper_Allen','Manager',80000,5),(501,'David_Scott','Supervisor',65000,5),
                            (502,'Joseph_Hill','Librarian',35000,5),(503,'Samuel_Adam','Librarian',35000,5),
                            (504,'Lucas_Baker','Librarian',35000,5),(505,'Andrew_Phillip','Technician',45000,5),
                            (506,'Joshua_Parker','Technician',45000,5);
Select *from Employee;

Create table Books(
ISBN int primary key,
Book_title varchar(30),
Category varchar(20),
Rental_price int,
Status varchar(5),
Author varchar(20),
Publisher varchar(20));
Insert into Books values(01,'The_Night_Circus','Fiction',20,'Yes','Erin_Morgenstern','Doubleday'),
						(02,'The_Great_Gatsby','Fiction',20,'No','Scott_Fitz','Scribner'),
                        (03,'To_Kill_a_Moking_Bird','Fiction',30,'No','Harper_Lee','Lippincott'),
                        (04,'1984','Fiction','30','Yes','George_Orwell','Secker'),
                        (05,'Sapiens','Non-Fiction',30,'No','Yuval_Noah','Harper'),
                        (06,'Educated','Non-Fiction',30,'Yes','Tara_Westover','Random_House'),
                        (07,'Becoming','Non-Fiction',20,'No','Michelle','Crown'),
                        (08,'The_Immortal','Non-Fiction',20,'Yes','Rebecca','Crown'),
                        (09,'Dune','Science',20,'Yes','Frank_Herbert','Chilton'),
                        (10,'Neuromancer','Science',20,'No','William_Gibson','Ace'),
                        (11,'The_Left_Hand','Science',30,'No','Ursula_K','Ace'),
                        (12,'Snow_Crash','Science',30,'Yes','Neal_Stephenson','Bantam'),
                        (13,'Harry_Potter','Fantasy',30,'No','J_K_Rowling','Bloomsbury'),
                        (14,'The_Hobbit','Fantasy',20,'No','J_R_Tolkien','George_Allen'),
                        (15,'Name_Of_The_Wind','Fantasy',30,'Yes','Patrick_Rothfuss','Daw_Books'),
                        (16,'American_Gods','Fantasy',30,'No','Neil_Gaiman','William_Morrow'),
                        (17,'Gone_Girl','Mystery/Thriller',30,'No','Gillian_Flynn','Crown'),
                        (18,'Girl_With_The_Dragon','Mystery/Thriller',20,'No','Stieg_Larsson','Norstedts'),
                        (19,'Big_Little_Lies','Mystery/Thriller',30,'Yes','Liane_Moriarty','Penhuin'),
                        (20,'The_Silent_Patient','Mystery/Thriller',20,'Yes','Alex_Michaelides','Celadon');
Select *from Books;

Create table Customer(
Customer_id int primary key,
Customer_name varchar(20),
Customer_address varchar(30),
Reg_date date);
insert into Customer values(1000,'Shibilin','69_NewYork','2005-04-21'),(1001,'Andrew','458_LosAngeles','2008-08-14'),
							(1002,'Max','255_Chicago','2005-07-25'),(1003,'Amini','998_SanFrancisco','2010-08-04'),
                            (1004,'Matt','062_Miami','2005-06-28'),(1005,'Rife','158_NewYork','2012-10-05'),
                            (1006,'Tate','555_LosAngeles','2009-01-15'),(1007,'Sydney','69_NewYork','2006-05-25'),
                            (1008,'Jessica','325_Chicago','2010-08-08'),(1009,'Jensen','144_Miami','2012-12-22'),
                            (1010,'Mason','448_Miami','2015-08-21'),(1011,'Mount','862_Miami','2019-07-14');
Select *from Customer;

Create table IssueStatus(
Issue_id int primary key,
Issued_customer int,
Issue_date date,
Isbn_book int,
foreign key(Issued_customer)references Customer(Customer_id) on delete cascade,
foreign key(Isbn_book) references Books(ISBN) on delete cascade);
Insert into IssueStatus values(50,1000,'2006-05-25',08),(51,1001,'2009-04-29',02),(52,1002,'2008-09-22',03),
								(53,1003,'2012-12-25',05),(54,1004,'2007-08-10',06),(55,1005,'2013-02-12',10),
                                (56,1006,'2010-12-20',11),(57,1007,'2007-04-21',08),(58,1008,'2023-06-01',09),
                                (59,1009,'2013-07-18',04);
Select *from IssueStatus;

Create table ReturnStatus(
Return_id int primary key,
Return_customer varchar(20),
Return_book_name varchar(20),
Return_date date,
Isbn_book2 int,
foreign key(Isbn_book2) references Books(Isbn) on delete cascade);
Insert into ReturnStatus values(2000,'Shibilin','The_Immortal','2007-03-15',08),
								(2001,'Matt','Educated','2009-12-15',06),
                                (2003,'Jessica','Dune','2024-06-01',09),
                                (2004,'Jensen',1984,'2014-10-26',04),
                                (2005,'Sydney','The_Immortal','2008-04-21',08);
Select *from ReturnStatus;

-- QUESTIONS

-- 1. Retrieve the book title, category, and rental price of all available books. 
Select Book_title, Category, Rental_price from Books;

-- 2. List the employee names and their respective salaries in descending order of salary. 
Select Emp_name, Salary from Employee order by Salary desc;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books. 
Select B.Book_title, C.Customer_id,  C.Customer_name from Books B join IssueStatus I on Isbn_book = ISBN
 join Customer C on Issued_customer = Customer_id;
 
 -- 4. Display the total count of books in each category.
 Select Category, (Select count(Category)) as Total_Count_Of_Books from Books group by Category;
 
 -- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
 Select Emp_name, Position, Salary from Employee where Salary > 50000;
 
 -- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
 Select C.Customer_name, C.Reg_date from customer C left join IssueStatus I on Customer_id = Issued_customer where Reg_date < '2022-01-01'
 and Issued_customer is null;
 
 -- 7. Display the branch numbers and the total count of employees in each branch. 
 Select Branch_no, (select count(Branch_no)) as Total_Count_Of_Employees from Employee group by  Branch_no;
 
 -- 8. Display the names of customers who have issued books in the month of June 2023.
 SELECT C.Customer_name FROM Customer C JOIN IssueStatus I ON Customer_id = Issued_customer WHERE Issue_date >= '2023-06-01'
 and Issue_date < '2023-07-01';

-- 9. Retrieve book_title from book table containing history. (Changed history to Mystery/Thriller)
Select Book_title from Books where Category = 'Mystery/Thriller';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
 Select Branch_no, (select count(Branch_no)) as Count_Of_Employees from Employee group by Branch_no having Count(*) > 5;
 
 -- 11. Retrieve the names of employees who manage branches and their respective branch addresses.
 Select E.Emp_name, B.Branch_address, B.Branch_no from Branch B join Employee E on B.Manager_id = E.Emp_id;
 
 -- 12.  Display the names of customers who have issued books with a rental price higher than Rs. 25.
Select C.Customer_name, I.Issued_customer from Customer C join  IssueStatus I on Issued_customer = Customer_id join Books B
on Isbn_book = ISBN where Rental_price > 25;


 
