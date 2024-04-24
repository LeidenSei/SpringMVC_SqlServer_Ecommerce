
go
create database Gunpla
go
use Gunpla
go
Create table categories(
  id int primary key identity,
  name nvarchar(100),
  slug varchar(100),
  description nvarchar(max),
  status bit

)
go
create table products(
id varchar(50) primary key,
  name nvarchar(200),
  slug varchar(200),
	
  image varchar(200),
  price float,
  sale_price float,
  status bit,
  createdate DATE,
  description Nvarchar(max) ,
  hightlight bit,
  category_id integer foreign key references categories(id)

)
go
CREATE TABLE Account(
	AccountId VARCHAR(36) PRIMARY KEY,
	UserName VARCHAR(64) NOT NULL,
	Password VARCHAR(256),
	FullName NVARCHAR(100),
	Picture VARCHAR(512),
	Email VARCHAR(64) UNIQUE NOT NULL,
	Address NVARCHAR(256),
	Phone VARCHAR(64),
	IsAdmin BIT,
	Active BIT
)

go
Insert into categories(name,slug,description,status) values
 ('Super Deformed','SD','',1),
 ('High Grade 1/144','HG',N'Mô hình Gunpla HG được giới thiệu lần đầu tiên vào năm 1990 khi mà kỹ thuật sản xuất và chất lượng khuôn nhựa đã được Bandai cải thiện đáng kể. HG bao gồm 2 tỷ lệ 1:144 và cả 1:100, mang lại biên độ cử động và tạo dáng nhiều hơn, linh hoạt hơn. Azgundam store là cửa hàng bán đồ chơi mô hình gundam HG với giá tốt nhất.',1),
 ('Real Grade 1/144','RG',N'Năm 2010, Bandai lần đầu tiên giới thiệu ra thị trường dòng Gunpla Real Grade (RG) tỷ lệ 1:144 trong dịp kỷ niệm 30 năm Gundam. Điều làm cho RG hấp dẫn người chơi chính là tỉ lệ chính xác đến từng chi tiết, vô số decal cực đẹp và các khớp cử động linh hoạt. Azgundam chuyên bán đồ chơi mô hình gundam rg chính hãng Bandai.',1),
  ('Entry Grade','EG',	'',1),
  ('Full Mechanics - RE/100','FM',	'',1),
  ('Master Grade','MG',	N'Về cấp độ: cao hơn dòng HG là MG, xuất hiện lần đầu có trên thị trường vào năm 1995 và tỷ lệ là 1:100. Những mẫu Gunpla này được Bandai sản xuất với chất lượng nhựa với độ chi tiết khuôn cao hơn hẳn dòng HG. AZgundam chuyên bán đồ chơi mô hình Gundam MG với giá tốt nhất.',1),
  ('Megasize -1/48','Mg-1/48',	'',1)

select * from categories 
go
--- INSER DATA IN Account
	INSERT INTO Account
	(
	    AccountId,
	    UserName,
	    Password,
	    FullName,
	    Picture,
	    Email,
	    Address,
	    Phone,
	    IsAdmin,
	    Active
	)
	VALUES
	(   '844259FE-64C2-4EBF-9FD8-94F3B26FA63F',   -- AccountId - varchar(36)
	    'toan1234',   -- UserName - varchar(64)
	    '827ccb0eea8a706c4c34a16891f84e7b',   -- Password - varchar(256)
	    N'Hoàng Văn Toàn',  -- FullName - nvarchar(100)
	    'chungld.jpg',   -- Picture - varchar(512)
	    'toan12@gmail.com',   -- Email - varchar(64)
	    N'238 Hoàng Quốc Việt Cầu Giấy Hà Nội',  -- Address - nvarchar(256)
	    '0339513657',   -- Phone - varchar(64)
	    1, -- IsAdmin - bit
	    1  -- Active - bit
	    ),
		('BE8922F0-713A-471B-A91F-4DD543F828D6',   -- AccountId - varchar(36)
	    'haibt',   -- UserName - varchar(64)
	    lower(CONVERT(VARCHAR(32), HashBytes('md5', 'haibt123456'), 2)),   -- Password - varchar(256)
	    N'Bùi Thanh Hải',  -- FullName - nvarchar(100)
	    'haibt.jpg',   -- Picture - varchar(512)
	    'haibt@bachkhoa-aptech.edu.vn',   -- Email - varchar(64)
	    N'Hà Đông-Hà Nội',  -- Address - nvarchar(256)
	    '0339513658',   -- Phone - varchar(64)
	    0, -- IsAdmin - bit
	    1  -- Active - bit
	    ),
		('65DEA567-C705-4F59-9AF9-18E413D824C7',   -- AccountId - varchar(36)
	    'trungbd',   -- UserName - varchar(64)
	    lower(CONVERT(VARCHAR(32), HashBytes('md5', 'trungbd123456'), 2)),   -- Password - varchar(256)
	    N'Bùi Đức Trung',  -- FullName - nvarchar(100)
	    'trungbd.jpg',   -- Picture - varchar(512)
	    'trungbd@bachkhoa-aptech.edu.vn',   -- Email - varchar(64)
	    N'Dân Chủ Hưng Hà Thái Bình',  -- Address - nvarchar(256)
	    '0339513659',   -- Phone - varchar(64)
	    0, -- IsAdmin - bit
	    1  -- Active - bit
	    ),
		('E3BB43BC-12ED-451D-80D8-7D03CE674665',   -- AccountId - varchar(36)
	    'luongna',   -- UserName - varchar(64)
	    lower(CONVERT(VARCHAR(32), HashBytes('md5', 'luongna123456'), 2)),   -- Password - varchar(256)
	    N'Nguyễn Anh Lương',  -- FullName - nvarchar(100)
	    'luongna.jpg',   -- Picture - varchar(512)
	    'luongna@bachkhoa-aptech.edu.vn',   -- Email - varchar(64)
	    N'Đô Lương Nghệ An',  -- Address - nvarchar(256)
	    '0339513656',   -- Phone - varchar(64)
	    0, -- IsAdmin - bit
	    1  -- Active - bit
	    )
		drop table Account
go
create table Orders(
	OrderId varchar(20) primary key,
	OrderDate datetime,
	AccountId varchar(36) foreign key references Account(AccountId),
	ReceiveAddress nvarchar(512),
	ReceivePhone varchar(50),
	ReceiveEmail varchar(50),
	ReceiveDate datetime,
	Note nvarchar(512),
	MethodPayment int CHECK (MethodPayment in (1,2)),
	Status int
)
Select * from OrderDetail
go
create table OrderDetail(
	OrderDetailId int primary key identity ,
	OrderId varchar(20) foreign key references Orders(OrderId),
	ProductId varchar(50) foreign key references products(id),
	Quantity int ,
	Price float
)

