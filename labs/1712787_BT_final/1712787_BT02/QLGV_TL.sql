﻿USE master
GO
--b1: toa csdl
IF DB_ID('QLGV') IS NOT NULL
DROP DATABASE QLGV
GO

CREATE DATABASE QLGV
GO

USE QLGV  --lenh truy cap csdl
--b2: tao bang

CREATE TABLE GIAOVIEN
(
MaGV CHAR(5),
HoTen NVARCHAR(40),
Luong FLOAT,
Phai NCHAR(3),
NgaySinh DATE,
DiaChi NVARCHAR(100),
MaNQL CHAR(5),
MaBM CHAR(5),

--khai báo PK
PRIMARY KEY(MAGV)
)
CREATE TABLE KHOA
(
MaKhoa CHAR(4),
TenKhoa NVARCHAR(40),
NamTL INT,
DienThoai CHAR(5),
Phong CHAR(12),
TruongKhoa CHAR(5),
Ngay_NC DATE  --ngày nhận chức
--
PRIMARY KEY(MaKhoa)
)

CREATE TABLE BOMON
(
MaBM CHAR(5),
TenBM NVARCHAR(40),
Phong CHAR(5),
DienThoai CHAR(12),
TruongBM CHAR(5),
MaKhoa CHAR(4),
Ngay_NC DATE --ngay nhan chuc

--khai báo PK
PRIMARY KEY(MaBM)
)

ALTER TABLE GIAOVIEN ADD
CONSTRAINT FK_GIAOVIEN_BOMON 
FOREIGN KEY(MaBM)
REFERENCES BOMON(MaBM),
	CONSTRAINT FK_GIAOVIEN_GIAOVIEN 
	FOREIGN KEY (MaNQL) 
	REFERENCES GIAOVIEN (MAGV)

ALTER TABLE KHOA ADD
CONSTRAINT FK_KHOA_GIAOVIEN
FOREIGN KEY(TruongKhoa)
REFERENCES GIAOVIEN(MaGV)

ALTER TABLE BOMON ADD
CONSTRAINT FK_BOMON_KHOA
FOREIGN KEY(MaKhoa)
REFERENCES KHOA(MaKhoa),
CONSTRAINT FK_BOMON_GIAOVIEN
FOREIGN KEY(TruongBM)
REFERENCES GIAOVIEN(MaGV)

----------------
INSERT INTO KHOA VALUES ('CNTT',N'Công nghệ thông tin',1995,'B11','0838123456',NULL,'02/20/2005')
INSERT INTO KHOA VALUES ('VL',N'Vật lý',1976,'B21','0838223223',NULL,'09/18/2003')
INSERT INTO KHOA VALUES ('SH',N'Sinh học',1980,'B31','0838454545',NULL,'10/11/2000')
INSERT INTO KHOA VALUES ('HH',N'Hóa học',1980,'B41','0838456456',NULL,'10/15/2001')
----------------
INSERT INTO BOMON VALUES (N'HTTT',N'Hệ thống thông tin','B13','0838125125',NULL,'CNTT','09/20/2004')
INSERT INTO BOMON VALUES (N'CNTT',N'Công nghệ tri thức','B15','0838126126',NULL, 'CNTT', NULL)
INSERT INTO BOMON VALUES (N'MMT',N'Mạng máy tính','B16','0838676767 ',NULL,'CNTT','05/15/2005')
INSERT INTO BOMON VALUES (N'VLĐT',N'Vật lý điện tử','B23','0838234234',NULL, 'VL', NULL)	
INSERT INTO BOMON VALUES (N'VLƯD',N'Vật lý ứng dụng','B24','0838454545',NULL,'VL','02/18/2006')
INSERT INTO BOMON VALUES (N'VS',N'Vi sinh','B32','0838909090',NULL,'SH','01/01/2007')
INSERT INTO BOMON VALUES (N'SH',N'Sinh hóa','B33','0838898989',NULL, 'SH', NULL)	
INSERT INTO BOMON VALUES (N'HL',N'Hóa lý','B42','0838878787',NULL, 'HH', NULL)	
INSERT INTO BOMON VALUES (N'HPT',N'Hóa phân tích','B43','0838777777',NULL,'HH','10/15/2007')
INSERT INTO BOMON VALUES (N'HHC',N'Hóa hữu cơ','B44','838222222',NULL, 'HH', NULL)	
----------------
INSERT INTO GIAOVIEN VALUES ('001',N'Nguyễn Hoài An',2000,N'Nam','02/15/1973',N'25/3 Lạc Long Quân, Q.10, TP HCM', NULL, N'MMT')
INSERT INTO GIAOVIEN VALUES ('002',N'Trần Trà Hương',2500,N'Nữ','06/20/1960',N'125	Trần Hưng Đạo, Q.1,TP HCM', NULL, N'HTTT')
INSERT INTO GIAOVIEN VALUES ('003',N'Nguyễn Ngọc Ánh',2200,N'Nữ','05/11/1975',N'12/21	Võ Văn Ngân	Thủ Đức, TP HCM', '002',N'HTTT')
INSERT INTO GIAOVIEN VALUES ('004',N'Trương Nam Sơn',2300,N'Nam','06/20/1959',N'215	Lý Thường Kiệt,TP Biên Hòa',NULL, N'VS')
INSERT INTO GIAOVIEN VALUES ('005',N'Lý Hoàng Hà',2500,N'Nam','10/23/1954',N'22/5	Nguyễn Xí, Q.Bình Thạnh, TP HCM',NULL, N'VLĐT')
INSERT INTO GIAOVIEN VALUES ('006',N'Trần Bạch Tuyết',1500,N'Nữ','05/20/1980',N'127	Hùng Vương, TP Mỹ Tho','004',N'VS')
INSERT INTO GIAOVIEN VALUES ('007',N'Nguyễn An Trung',2100,N'Nam','06/05/1976',N'234 3/2, TP Biên Hòa',NULL, N'HPT')
INSERT INTO GIAOVIEN VALUES ('008',N'Trần Trung Hiếu',1800,N'Nam','08/06/1977',N'22/11 Lý Thường Kiệt, TP Mỹ Tho','007',N'HPT')
INSERT INTO GIAOVIEN VALUES ('009',N'Trần Hoàng Nam',2000,N'Nam','11/22/1975',N'234	Trấn Não, An Phú,TP HCM','001',N'MMT')
INSERT INTO GIAOVIEN VALUES ('010',N'Phạm Nam Thanh',1500,N'Nam','12/12/1980',N'221	Hùng Vương, Q.5, TP HCM','007',N'HPT')


SELECT * FROM dbo.GIAOVIEN
SELECT * FROM dbo.KHOA
SELECT * FROM dbo.BOMON