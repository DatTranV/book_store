
CREATE DATABASE BookStore

GO

Use BookStore
Create table tbl_User (
 userID varchar(20) primary key,
 password int not null,
 fullname varchar(50) not null,
 role int ,
);

Insert into tbl_User(userID,password,fullname,role)
Values ('bao',1,'Ngo Bao',0);
Insert into tbl_User(userID,password,fullname,role)
Values ('tai',12,'Dang Tai',1);
Insert into tbl_User(userID,password,fullname,role)
Values ('phat',123,'Duc Phat',2);
Insert into tbl_User(userID,password,fullname,role)
Values ('nam',12,'Nhat Nam',2);
Insert into tbl_User(userID,password,fullname,role)
Values ('minh',12345,'Cong Minh',0);




Create table tbl_Books (
 BooksID varchar(10) primary key,
 BookName varchar(250) not null,
 AuthorName varchar(20) not null,
 Category varchar(20) not null,
 description varchar(250) not null,
 images varchar(250) not null,
 price float,
 discount int , 
 quantity int,
 notSale bit,

);
INSERT INTO tbl_Books (BooksID, BookName, AuthorName, Category, price, discount, quantity, notSale, images, description)
VALUES ('MG001', 'Dragon Ball Vol_30', 'Akira Toriyama', 'Manga', 3.5, 0, 200, 0, 'images/manga/MG001.webp', 'sajdasjdjasdjasj');
INSERT INTO tbl_Books (BooksID, BookName, AuthorName, Category, price, discount, quantity, notSale, images, description)
VALUES ('MG002', 'One Piece Vol_102', 'Eiichiro Oda', 'Manga', 4, 20, 300, 0, 'images/manga/MG002.jpg', 'sajdasjdjasdjasj');
INSERT INTO tbl_Books (BooksID, BookName, AuthorName, Category, price, discount, quantity, notSale, images, description)
VALUES ('MG003', 'One-Punch Man Vol_27', 'ONE_Yusuke Murata', 'Manga', 2.5, 30, 100, 0, 'images/manga/MG003.webp','sajdasjdjasdjasj');
INSERT INTO tbl_Books (BooksID, BookName, AuthorName, Category, price, discount, quantity, notSale, images, description)
VALUES ('MG004', 'Slam Dunk Vol_21', 'Takehiko Inoue', 'Manga', 3.5, 0, 200, 0, 'images/manga/MG004.jpg' , 'sajdasjdjasdjasj');


INSERT INTO tbl_Books (BooksID, BookName, AuthorName, Category, price, discount, quantity, notSale, images, description)
VALUES ('FT001', 'The Jungle Book', 'Rudyard Kipling', 'Fantasy', 3.5, 0, 200, 0, 'images/fantasy/FT001.webp', 'sajdasjdjasdjasj');
INSERT INTO tbl_Books (BooksID, BookName, AuthorName, Category, price, discount, quantity, notSale, images, description)
VALUES ('FT002', 'Gulliver Travels', 'Jonathan Swift', 'Fantasy', 4, 20, 300, 0, 'images/fantasy/FT002.jpg', 'sajdasjdjasdjasj');
INSERT INTO tbl_Books (BooksID, BookName, AuthorName, Category, price, discount, quantity, notSale, images, description)
VALUES ('FT003', 'Two thousand miles under the sea', 'Jules Verne', 'Fantasy', 2.5, 30, 100, 0, 'images/fantasy/FT003.webp','sajdasjdjasdjasj');
INSERT INTO tbl_Books (BooksID, BookName, AuthorName, Category, price, discount, quantity, notSale, images, description)
VALUES ('FT004', 'Behind Wind Bac', 'George Macdonald', 'Fantasy', 3.5, 0, 200, 0, 'images/fantasy/FT004.jpg' , 'sajdasjdjasdjasj');

INSERT INTO tbl_Books (BooksID, BookName, AuthorName, Category, price, discount, quantity, notSale, images, description)
VALUES ('NV001', 'Dat Rung Phuong Nam', 'Doan Gioi', 'Novel', 3.5, 0, 200, 0, 'images/novel/NV001.webp', 'sajdasjdjasdjasj');
INSERT INTO tbl_Books (BooksID, BookName, AuthorName, Category, price, discount, quantity, notSale, images, description)
VALUES ('NV002', 'Seagull Watcher', 'Michael Morpurgo', 'Novel', 4, 20, 300, 0, 'images/novel/NV002.jpg', 'sajdasjdjasdjasj');
INSERT INTO tbl_Books (BooksID, BookName, AuthorName, Category, price, discount, quantity, notSale, images, description)
VALUES ('NV003', 'So Do', 'Vu Trong Phung', 'Novel', 2.5, 30, 100, 0, 'images/novel/NV003.jpg','sajdasjdjasdjasj');
INSERT INTO tbl_Books (BooksID, BookName, AuthorName, Category, price, discount, quantity, notSale, images, description)
VALUES ('NV004', 'Return to childhood', 'Michael Morpurgo', 'Novel', 3.5, 0, 200, 0, 'images/novel/NV004.webp' , 'sajdasjdjasdjasj');


SELECT BooksID , BookName , AuthorName , Category , description , images, price, discount, quantity , notSale from tbl_Books where Category='Fantasy'








CREATE TABLE tbl_wishList (
	WID int not null IDENTITY (1,1) PRIMARY KEY ,
	userID varchar(20) not null ,
	BooksID varchar(10) not null,
	FOREIGN KEY (userID) references tbl_User(userID), 
	FOREIGN KEY (BooksID) references tbl_Books(BooksID) 
	
); 


CREATE TABLE [dbo].[tblInvoice](
	[invId] [nvarchar](50) NOT NULL,
	
	[userID] [nvarchar](50)not null,
	[total] [float]NULL,
	[dateBuy] [datetime] NULL,
	[gmail] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	CONSTRAINT [PK_tblInvoice] PRIMARY KEY CLUSTERED 
(
	[invId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[tblCart] (
    [cartId] [nvarchar](50) NOT NULL,
	[BooksID] [nvarchar] (50) NULL,
	[userID] [nvarchar](50) null,
	[invId] [nvarchar](50)null,
    [price] [float] NULL,
    [totalPrice] [float]NULL,
	[quantity] [int] NULL,
	[image] [nvarchar](max) NULL,
	
	CONSTRAINT [PK_tblCart] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]




