drop schema if exists number_1;
create schema number_1;
use number_1;

drop table if exists book_status;
drop table if exists checkout;
drop table if exists book;
drop table if exists vendor;
drop table if exists employee;
drop table if exists customer;
drop table if exists library;

create table library(
	l_id int not null primary key,
	l_name varchar(30),
    l_address varchar(100),
    l_phone bigint
);

create table vendor (
	v_id int primary key,
    v_name varchar(50),
    v_address varchar(200),
    v_phone bigint
    );
    
create table book (
	b_id varchar(20) not null primary key,
    b_name varchar(50),
    b_author varchar(50),
    b_genre varchar(30),
    exist_in_database int,
    b_year int,
    v_id int,
    foreign key (v_id) references vendor(v_id)
    );

create table customer (
	c_id int not null primary key,
    c_name varchar(30),
    c_phone bigint,
    c_email varchar(30)
    );
    
create table employee (
	e_id int not null primary key,
    e_fullname varchar(50),
    e_title varchar(30),
    e_salary int,
    l_id int,
    foreign key (l_id) references library(l_id)
    );
    
create table book_status (
	b_id varchar(20),
    b_availability int,
    b_damage int,
    l_id int,
    foreign key (b_id) references book(b_id) ,
    foreign key (l_id) references library(l_id)
	);
    
create table checkout (
	c_id int,
    b_id varchar(20),
    b_name varchar(100),
    e_id int, 
    checkout_date varchar(20),
    return_date varchar(20),
    foreign key (c_id) references customer(c_id),
    foreign key (b_id) references book(b_id),
    -- foreign key (b_name) references book(b_name),
    foreign key (e_id) references employee(e_id)
    );
    
create table cart (
	c_id int,
    b_id varchar(20),
    b_name varchar(50)
);    

insert into `vendor` (v_id, v_name, v_address, v_phone)
values
	(1, "Penguin Random House", "443 Sherlocks St Brooklyn New York", "3211232523"),
	(2, "Harper Cole Publishment", "823 Lincoln Dr Austin Texas", "9534442080"),
	(3, "Scholastic Corporation", "1002 Park Ave San Jose California", "5138882525"),
	(4, "Faber and Faber", "250 Main Ave Augusta Georgia", "7261114242"),
	(5, "Abrams Books", "576 Brooklyn Lane Seatle Washington", "8525346006"),
	(6, "McMillan Publisher", "7823 Industry Blvd Chicago Illinois", "6128884023");

insert into `library` (l_id, l_name, l_address, l_phone)
values
	(1, "Rondo Community Library", "650 Dale St Saint Paul Minnesota", "6514447070"),
	(2, "Stillwater Public Library", "750 Maryknolls Dr Stillwater Minnesota", "9522927850"),
	(3, "Ramsey Library", "1120 Hamline Ave Roseville Minnesota", "6121605555"),
	(4, "Anoka Community Library", "3010 Main St Anoka Minnesota", "9527678900"),
	(5, "Lindahl Public Library", "333 University Ave Minneapolis Minnesota", "6129248008"),
	(6, "Hamline Library", "485 Edcumberg St Eagan Minnesota", "7251229000");
    
insert into `employee` (e_id, e_fullname, e_title, e_salary, l_id)
values
	(91, "John E Smith", "Region Manager", 75000, 1),
    (92, "Kayla D Wong", "Region Manager", 75000, 5),
    (1, "Charlie E Johnson", "Clerk", 60000, 3),
	(2, "Emily K Hayes", "Clerk", 67500, 1),
	(3, "Kevin A O'Brian", "Clerk", 67500, 2),
	(4, "Thomas L Leeways", "Clerk", 56000, 3),
	(5, "Sarah D Connor", "Clerk", 55000, 4),
	(6, "Michael H Aguilars", "Clerk", 54000, 5),
    (7, "Anna B Martinez", "Clerk", 59000, 6);
    
insert into `customer` (c_id, c_name, c_phone, c_email)
values
    (1, "Alexa Fischer", 5167290138, "alexa.fischer91@gmail.com"),
	(2, "Jameson Rivera", 3077998892, "jameson.rivera82@hotmail.com"),
	(3, "Emily Chen", 9258265047, "emilychen13@yahoo.com"),
	(4, "Jason Larson", 6148767012, "jason.larson78@gmail.com"),
	(5, "Brianna Tate", 9728715519, "brianna.tate94@hotmail.com"),
	(6, "Ryan Rodriguez", 2062666374, "ryan.rodriguez23@gmail.com"),
	(7, "Sophia Evans", 8036723321, "sophia.evans15@yahoo.com"),
	(8, "Gabriel Kim", 3185883356, "gabriel.kim87@hotmail.com"),
	(9, "Olivia Snyder", 2148052473, "olivia.snyder09@gmail.com"),
	(10, "Lucas Patel", 7025309196, "lucas.patel45@yahoo.com"),
	(11, "Lila Patel", 6177100283, "lila.patel77@gmail.com"),
	(12, "David Nguyen", 8474032819, "david.nguyen08@hotmail.com"),
	(13, "Ariana Patel", 9014842296, "ariana.patel32@yahoo.com"),
	(14, "Samuel Lee", 5048171912, "samuel.lee67@gmail.com"),
	(15, "Hannah Wong",  5109388347, "hannah.wong20@yahoo.com"),
	(16, "Andrew Cox", 2197333901, "andrew.cox55@hotmail.com"),
	(17, "Sarah Chen", 8023238476, "sarah.chen62@gmail.com"),
	(18, "Joshua Kim", 4027651290, "joshua.kim39@yahoo.com"),
	(19, "Isabella Kim", 2028369087, "isabella.kim83@hotmail.com"),
	(20, "Ethan Smith", 8135550182, "ethan.smith51@gmail.com");
    
insert into `book` (b_id, b_name, b_author, b_genre, exist_in_database, b_year, v_id)
values 
	("978-1-84543-002-8", "The Secret History", "Donna Tartt", "Mystery", 1, 1992, 2),
	("978-1-412-21302-0", "A Little Life", "Hanya Yanagihara", "Fiction", 0, 2015, 3),
	("978-0-553-38921-7", "The Kite Runner", "Khaled Hosseini", "Fiction", 1, 2003, 5),
	("978-1-328-71050-9", "The Testaments", "Margaret Atwood", "Science Fiction", 0, 2019, 2),
	("978-0-316-41955-8", "The Hunger Games", "Suzanne Collins", "Science Fiction", 0, 2008, 5),
	("978-1-84767-478-5", 	"The Girl with the Dragon Tattoo", 	"Stieg Larsson", "Mystery", 0, 2005, 3),
	("978-0-671-76783-2", 	"The Bonfire of the Vanities", 	"Tom Wolfe", 	"Fiction", 	1, 1987, 2),
	("978-1-59448-094-5", 	"The Road", 	"Cormac McCarthy", 	"Science Fiction", 	1, 2006, 6),
	("978-0-679-41030-1", 	"Love in the Time of Cholera", 	"Gabriel Garcia Marquez", 	"Romance", 	0, 1985, 1),
	("978-1-44345-451-6", 	"The Girl on the Train", 	"Paula Hawkins", 	"Mystery", 	1, 2015, 1),
	("978-0-553-57337-9", 	"To Kill a Mockingbird", 	"Harper Lee", 	"Fiction", 	1, 1960, 3),
	("978-0-446-69373-7", 	"Gone Girl", 	"Gillian Flynn", 	"Mystery", 	1, 2012, 4),
	("978-0-14-312755-0", 	"A Visit from the Goon Squad", 	"Jennifer Egan", 	"Fiction", 	0, 2010, 2),
	("978-1-59420-128-5", 	"Snow Flower and the Secret Fan", 	"Lisa See", 	"Historical Fiction", 	1, 2005, 4),
	("978-1-59448-816-3",	"The Help", 	"Kathryn Stockett", 	"Historical Fiction", 	1, 2009, 5),
	("978-0-679-45531-5", 	"The Corrections", 	"Jonathan Franzen", 	"Fiction", 	1, 2001, 6),
	("978-0-743-27699-0", 	"The Da Vinci Code", 	"Dan Brown", 	"Mystery", 	1, 2003, 1),
	("978-0-8389-1111-7", 	"The Shadow of the Wind", 	"Carlos Ruiz Zafón", 	"Historical Fiction", 	1, 2001, 6),
	("978-0-441-01255-5", 	"A Thousand Splendid Suns", 	"Khaled Hosseini", 	"Historical Fiction", 	0, 2007, 2),
	("978-0-385-73177-3", 	"The Kite Runner", 	"Khaled Hosseini", 	"Historical Fiction", 	1, 2003, 3),
	("978-0-385-48741-5", 	"The Secret History", 	"Donna Tartt", 	"Mystery", 	0, 1992, 5),
	("978-0-9943650-0-9", 	"The Martian", 	"Andy Weir", 	"Science Fiction", 	0, 2011, 2),
	("978-0-8129-9866-1", 	"The Girl with the Dragon Tattoo", 	"Stieg Larsson", 	"Mystery", 	1, 2005, 5),
	("978-0-375-41391-7", 	"The Lovely Bones", 	"Alice Sebold", 	"Fiction", 	1, 2002, 3),
	("978-1-4299-8944-6", 	"One Hundred Years of Solitude", 	"Gabriel Garcia Marquez", 	"Magical Realism", 	1, 1967, 2),
	("978-0-06-093546-7", 	"The Alchemist", 	"Paulo Coelho", 	"Fiction", 	1, 1988, 6),
	("978-0-385-66339-3", 	"The Pillars of the Earth", 	"Ken Follett", 	"Historical Fiction", 	0, 1989, 1),
	("978-0-517-22673-7", 	"Gone with the Wind", 	"Margaret Mitchell", 	"Historical Fiction", 	0, 1936, 1),
	("978-1-4165-0287-5", 	"Water for Elephants", 	"Sara Gruen", 	"Historical Fiction", 	1, 2006, 3),
	("978-0-316-31696-5", 	"The Hunger Games", 	"Suzanne Collins", 	"Science Fiction", 	1, 2008, 2),
	("978-0-375-50341-6", 	"The Da Vinci Code", 	"Dan Brown", 	"Mystery", 	1, 2003, 4),
	("978-1-4200-4429-4", 	"The Catcher in the Rye", 	"J.D. Salinger", 	"Fiction", 	1, 1951, 5),
	("978-0-345-47132-1", 	"The Shining", 	"Stephen King", 	"Horror", 	1, 1977, 6),
	("978-0-385-34230-2", 	"The Help", 	"Kathryn Stockett", 	"Historical Fiction", 	1, 2009, 1),
	("978-0-571-22011-5", 	"Atonement", 	"Ian McEwan", 	"Historical Fiction", 	0, 2001, 6),
	("978-0-312-42757-7", 	"The Time Traveler's Wife", 	"Audrey Niffenegger", 	"Science Fiction", 	0, 2003, 2),
	("978-0-14-240251-1",	"Speak", 	"Laurie Halse Anderson", 	"Young Adult Fiction", 	1, 1999, 3),
	("978-0-385-48451-3", 	"The Great Gatsby", 	"F. Scott Fitzgerald", 	"Classic Fiction", 	1, 1925, 5),
	("978-0-385-72170-2", 	"The Road", 	"Cormac McCarthy", 	"Post-Apocalyptic Fiction", 	1, 2006, 2),
	("978-0-00-813251-7", 	"The Miniaturist", 	"Jessie Burton", 	"Historical Fiction", 	1, 2014, 5),
	("978-0-375-50519-9", 	"Angels & Demons", 	"Dan Brown", 	"Mystery", 	0, 2000, 3),
	("978-0-399-15418-6", 	"The Nightingale", 	"Kristin Hannah", 	"Historical Fiction", 	0, 2015, 2),
	("978-0-14-118776-1", 	"1984", 	"George Orwell", 	"Dystopian Fiction", 	1, 1949, 6),
	("978-1-101-63809-9", 	"The Hunger Games", 	"Suzanne Collins", 	"Science Fiction", 	1, 2008, 1),
	("978-0-385-52033-8", 	"Life of Pi", 	"Yann Martel", 	"Adventure Fiction", 	1, 2001, 1),
	("978-0-385-34378-1", 	"The Girl with the Dragon Tattoo", 	"Stieg Larsson", 	"Crime Fiction", 	1, 2005, 3),
	("978-0-679-74590-2", 	"Memoirs of a Geisha", 	"Arthur Golden", 	"Historical Fiction", 	0, 1997, 4),
	("978-0-7432-6024-5", 	"The Da Vinci Code", 	"Dan Brown", 	"Mystery", 	1, 2003, 2),
	("978-0-15-601219-5", 	"Persepolis", 	"Marjane Satrapi", 	"Autobiographical Comic", 	1, 2000, 4),
	("978-0-439-02352-8", 	"Harry Potter and the Goblet of Fire", 	"J.K. Rowling", 	"Fantasy", 	1, 2000, 5),
	("978-1-4165-9112-2", 	"The Book Thief", 	"Markus Zusak", 	"Historical Fiction", 	0, 2005, 6),
	("978-1-4000-3389-7", 	"The Kite Runner", 	"Khaled Hosseini", 	"Historical Fiction", 	1, 2003, 1),
	("978-0-06-087616-5", 	"Water for Elephants", 	"Sara Gruen", 	"Historical Fiction", 	1, 2006, 6),
	("978-0-307-27874-4", 	"The Immortal Life of Henrietta Lacks", 	"Rebecca Skloot", 	"Non-Fiction", 	0, 2010, 2),
	("978-0-06-112008-4", 	"The Road Less Traveled", 	"M. Scott Peck", 	"Self-Help", 	1, 1978, 3),
	("978-1-4169-4256-6", 	"The Lovely Bones", 	"Alice Sebold", 	"Fantasy", 	1, 2002, 5),
	("978-0-446-69339-3", 	"The Help", 	"Kathryn Stockett", 	"Historical Fiction", 	0, 2009, 2),
	("978-0-385-47454-1", 	"The Girl on the Train", 	"Paula Hawkins", 	"Thriller", 	1, 2015, 5),
	("978-0-307-27809-6", 	"The Devil in the White City", 	"Erik Larson", 	"Non-Fiction", 	1, 2003, 3),
	("978-0-345-80345-1", 	"The Martian", 	"Andy Weir", 	"Science Fiction", 	0, 2011, 2),
	("978-0-618-57488-6", 	"The Memory Keeper's Daughter", 	"Kim Edwards", 	"Historical Fiction", 	1, 2005, 6),
	("978-0-316-01368-5", 	"The Glass Castle", 	"Jeannette Walls", 	"Memoir", 	1, 2005, 1),
	("978-1-84749-380-6", 	"The White Tiger", 	"Aravind Adiga", 	"Satire", 	1, 2008, 1),
	("978-1-4000-7863-7", 	"A Thousand Splendid Suns", 	"Khaled Hosseini", 	"Historical Fiction", 	1, 2007, 3),
	("978-0-553-81385-1", 	"American Gods", 	"Neil Gaiman", 	"Fantasy", 	0, 2001, 4),
	("978-1-101-15405-8", 	"The Nightingale", 	"Kristin Hannah", 	"Historical Fiction", 	1, 2015, 2),
	("978-0-06-112241-5", 	"The Four Agreements", 	"Don Miguel Ruiz", 	"Self-Help", 	1, 1997, 4),
	("978-0-345-47651-1", 	"11/22/63", 	"Stephen King", 	"Science Fiction", 	0, 2011, 5),
	("978-0-385-49631-5", 	"And the Mountains Echoed", 	"Khaled Hosseini", 	"Historical Fiction", 	1, 2013, 6),
	("978-1-4000-3470-6", 	"The Time Traveler's Wife", 	"Audrey Niffenegger", 	"Romance", 	1, 2003, 1),
	("978-1-4516-9359-9", 	"The Fault in Our Stars", 	"John Green", 	"Young Adult Fiction", 	1, 2012, 6),
	("978-0-307-47362-7", 	"Gone Girl", 	"Gillian Flynn", 	"Thriller", 	1, 2012, 2),
	("978-0-679-43131-1", 	"The Catcher in the Rye", 	"J.D. Salinger", 	"Coming-of-Age Fiction", 	1, 1951, 3),
	("978-0-307-95717-4", 	"Just Kids", 	"Patti Smith", 	"Memoir", 	1, 2010, 5),
	("978-0-14-303841-2", 	"The Kite Runner", 	"Khaled Hosseini", 	"Historical Fiction", 	1, 2003, 2),
	("978-0-312-42785-2", 	"The Hunger Games", 	"Suzanne Collins", 	"Science Fiction", 	0, 2008, 5),
	("978-1-57322-861-4", 	"Operating Instructions", 	"Anne Lamott", 	"Memoir", 	1, 1993, 3),
	("978-1-59448-327-3", 	"Water for Elephants", 	"Sara Gruen", 	"Historical Fiction", 	1, 2006, 2),
	("978-0-345-80328-4", 	"Dark Matter", 	"Blake Crouch", 	"Science Fiction", 	1, 2016, 6),
	("978-0-8041-7066-7", 	"The Goldfinch", 	"Donna Tartt", 	"Coming-of-Age Fiction", 	1, 2013, 1),
	("978-0-399-15900-9", 	"The Art of Racing in the Rain", 	"Garth Stein", 	"Fiction", 	0, 2008, 1),
	("978-1-4165-8951-0", 	"The Help", 	"Kathryn Stockett", 	"Historical Fiction", 	1, 2009, 3),
	("978-0-345-47650-4", 	"Under the Dome", 	"Stephen King", 	"Science Fiction", 	0, 2009, 4),
	("978-0-670-02351-3", 	"Sapiens: A Brief History of Humankind", 	"Yuval Noah Harari", 	"History", 	1, 2011, 2),
	("978-1-101-62500-1", 	"The Martian", 	"Andy Weir", 	"Science Fiction", 	1, 2011, 5),
	("978-1-4494-2490-5", 	"Thinking,  Fast and Slow", 	"Daniel Kahneman", 	"Psychology", 	1, 2011, 6),
	("978-1-4516-2074-0", 	"The Immortal Life of Henrietta Lacks", 	"Rebecca Skloot", 	"Science", 	1, 2010, 1),
	("978-0-15-603402-0", 	"The Brief Wondrous Life of Oscar Wao", 	"Junot Diaz", 	"Fiction", 	0, 2007, 6),
	("978-0-345-49651-5", 	"A Game of Thrones", 	"George R.R. Martin", 	"Fantasy", 	1, 1996, 2),
	("978-0-316-06674-9", 	"The Road", 	"Cormac McCarthy", 	"Fiction", 	1, 2006, 3),
	("978-0-345-47232-2", 	"The Girl with the Dragon Tattoo", 	"Stieg Larsson", 	"Mystery", 	1, 2005, 5),
	("978-1-5011-1717-3", 	"Commonwealth", 	"Ann Patchett", 	"Fiction", 	1, 2016, 2);

insert into `checkout` (c_id, b_id, b_name, e_id, checkout_date, return_date)
values    
	(3, "978-1-84543-002-8", "The Secret History", 3, "2019-03-07", "2019-05-05"),
	(5, "978-1-44345-451-6", "The Girl on the Train", 2, "2019-05-16", "2019-06-19"),
	(4, "978-0-553-57337-9", "To Kill a Mockingbird", 2, "2019-03-24", "2019-04-16"),
	(16, "978-1-59420-128-5", "Snow Flower and the Secret Fan", 6, "2019-05-08", "2019-07-25"),
	(3, "978-1-59448-816-3", "The Help", 1, "2019-04-01", "2019-05-14"),
	(2, "978-0-385-73177-3", "The Kite Runner", 5, "2019-05-27", "2019-06-05"),
	(8, "978-0-375-41391-7", "The Lovely Bones", 5, "2019-04-20", "2019-07-11"),
	(13, "978-0-375-50341-6","The Da Vinci Code", 1, "2019-05-13", "2019-04-24"),
	(17, "978-0-14-240251-1", "Speak", 4, "2019-03-13", "2019-06-29"),
	(10, "978-1-101-63809-9", "The Hunger Games", 6, "2019-04-29", "2019-07-30");
    
insert into `book_status` (b_id, b_availability, b_damage, l_id)
values    
	("978-1-84543-002-8", 0, 0, 1),
    ("978-0-553-57337-9", 0, 0, 6),
    ("978-0-14-240251-1", 0, 0, 3),
    ("978-1-44345-451-6", 0, 0, 4),
	("978-0-553-38921-7", 1, 0, 2),
	("978-0-671-76783-2", 1, 0, 2),
	("978-1-59448-094-5", 1, 0, 5),
	("978-0-446-69373-7", 1, 0, 3),
	("978-1-59420-128-5", 0, 0, 6),
	("978-1-59448-816-3", 0, 0, 4),
	("978-0-679-45531-5", 1, 0, 2),
	("978-0-743-27699-0", 1, 0, 6),
	("978-0-8389-1111-7", 1, 0, 2),
	("978-0-385-73177-3", 0, 0, 5),
	("978-0-8129-9866-1", 1, 0, 4),
	("978-0-375-41391-7", 0, 0, 5),
	("978-1-4299-8944-6", 1, 0, 3),
	("978-0-06-093546-7", 1, 0, 2),
	("978-1-4165-0287-5", 1, 0, 3),
	("978-0-14-303841-2", 1, 0, 4),
	("978-0-316-31696-5", 1, 0, 2),
	("978-0-375-50341-6", 0, 0, 4),
	("978-1-4200-4429-4", 1, 0, 6),
	("978-0-345-47132-1", 1, 1, 1),
	("978-0-385-34230-2", 1, 0, 6),
	("978-0-385-48451-3", 1, 0, 3),
	("978-0-385-72170-2", 1, 0, 4),
	("978-0-00-813251-7", 1, 0, 2),
	("978-0-14-118776-1", 1, 0, 5),
	("978-1-101-63809-9", 0, 0, 3),
	("978-0-385-52033-8", 1, 0, 4),
	("978-0-385-34378-1", 1, 0, 1),
	("978-0-7432-6024-5", 1, 0, 4),
	("978-0-15-601219-5", 1, 0, 6),
	("978-0-439-02352-8", 1, 0, 5),
	("978-1-4000-3389-7", 1, 0, 3),
	("978-0-06-087616-5", 1, 0, 2),
	("978-0-06-112008-4", 1, 0, 5),
	("978-1-4169-4256-6", 1, 0, 4),
	("978-0-385-47454-1", 1, 0, 4),
	("978-0-307-27809-6", 1, 1, 2),
	("978-0-618-57488-6", 1, 0, 5),
	("978-0-316-01368-5", 1, 1, 6),
	("978-1-84749-380-6", 1, 0, 3),
	("978-1-4000-7863-7", 1, 0, 3),
	("978-1-101-15405-8", 1, 0, 6),
	("978-0-06-112241-5", 1, 0, 6),
	("978-0-385-49631-5", 1, 0, 2),
	("978-1-4000-3470-6", 1, 0, 3),
	("978-1-4516-9359-9", 1, 0, 4),
	("978-0-307-47362-7", 1, 0, 5),
	("978-0-679-43131-1", 1, 0, 3),
	("978-0-307-95717-4", 1, 0, 6),
	("978-0-14-303841-2", 1, 0, 4),
	("978-1-57322-861-4", 1, 0, 3),
	("978-1-59448-327-3", 1, 0, 2),
	("978-0-345-80328-4", 1, 0, 1),
	("978-0-8041-7066-7", 1, 0, 5),
	("978-1-4165-8951-0", 1, 0, 6),
	("978-0-670-02351-3", 1, 0, 5),
	("978-0-312-42785-2", 1, 0, 4),
	("978-1-101-62500-1", 1, 0, 2),
	("978-1-4494-2490-5", 1, 0, 3),
	("978-1-4516-2074-0", 1, 1, 5),
	("978-0-345-49651-5", 1, 0, 4),
	("978-0-316-06674-9", 1, 0, 1),
	("978-0-345-47232-2", 1, 0, 3),
	("978-1-5011-1717-3", 1, 0, 5);

insert into cart values 
(4, "978-1-59420-128-5", "Snow Flower and the Secret Fan"),
(3, "978-0-00-813251-7", "The Miniaturist"),
(4, "978-0-06-087616-5", "Water for Elephants"),
(5, "978-0-618-57488-6", "The Memory Keeper's Daughter"),
(6, "978-0-385-73177-3", "The Kite Runner"),
(3, "978-0-8389-1111-7", "The Shadow of the Wind");

/*
# Finding all books that exist in library database 
select * from book where exist_in_database = 1;

# Find all book that exist in library database with Mystery Genre
select * from book as b join book_status as bs on b.b_id = bs.b_id where b_genre = "Mystery";

# Find all book available in Anoka Library
select b.b_id, b.b_name, b_author, b_genre, b_year 
from book as b join book_status as bs on b.b_id = bs.b_id join library as l on l.l_id = bs.l_id where l_name = "Anoka Community Library";

# Find Historical Fiction book from Stillwater library
select b.b_id as "ISBN", b_name as "Book Name", b_author as "Book Author", b_year as "Year"
from book_status as bs join library as l on bs.l_id = l.l_id join book as b on b.b_id = bs.b_id where l_name = "Stillwater Public Library" and b_genre = "Historical Fiction";

# Find All Transaction of librarian and customer exchange
select b_name as "Book", c_name as "Customer", checkout_date, return_date, e_fullname as "Employee"
from checkout as co join customer as c on co.c_id = c.c_id join employee as e on e.e_id = co.e_id join book as b on b.b_id = co.b_id;

# Find customer target genre books
select b_genre as "Genre", count(b_genre) as "Count" 
from checkout as co join customer as c on co.c_id = c.c_id join book_status as bs on bs.b_id = co.b_id join book as b on b.b_id = bs.b_id group by b_genre;

*/
# Trigger for insert of employee without salary
-- drop trigger if exists emp_salary ;
delimiter //
create trigger emp_salary
before insert on employee
for each row
begin
	set new.e_title = "Clerk";
    if new.e_salary < 0 or new.e_salary is null then set new.e_salary = 55000;
    end if;
end; //
delimiter ; 

-- insert into `employee` (e_id, e_fullname, l_id)
-- values
-- 	(8, "Jessy Q Placencia", 1);
    

# Create a Trigger for book status availability change into 0 (False) if it is checkout
-- drop trigger if exists b_status;
-- Create Trigger b_status
-- after insert on checkout
-- for each row
-- update book_status  set b_availability = 0 where b_id = new.b_id;
-- end //
-- delimiter ;
-- # Insert statement to check the book checkout.
-- insert into checkout values (20, "978-0-553-38921-7", 5, "2019-04-15", "2019-07-01");

# Function increasing salary
-- drop function if exists salaryinc;
delimiter //
create function salaryinc(initsalary int, inc float)
returns int
deterministic
begin 
	declare newsalary int;
    set newsalary = initsalary * inc;
    return newsalary;    
end //
delimiter ;

-- #View creation with library associated
create or replace view salary_projection as 
select e_id, e_fullname, e_salary, l_name
from employee as e join library as l
on e.l_id = l.l_id;
# Project Salary increased to
select *, salaryinc(e_salary, 1.09) as "Next salary" from salary_projection;

# Check for Book Published in between years
-- drop procedure if exists bookPublisheddate;
delimiter //
create procedure bookPublishedDate (bp varchar(20), Startdate int, EndDate int)
begin
	select b_id, b_name, b_author, b_year
	from  book
	where (b_id = bp or bp is null) and  b_year between Startdate and EndDate
	order by b_year;
end//
delimiter ;

-- CALL bookPublishedDate("978-0-553-57337-9", 1750, 2003);
-- CALL bookPublishedDate(null,  1750, 2003);