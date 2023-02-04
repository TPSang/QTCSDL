create database QLDA2_Ps15374

on
( Name=QLDA2_Ps15374_data, filename='C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLDA2_Ps15374_log.mdf',size=10mb,maxsize=50mb,filegrowth=5mb)
log on 
(name = QLDA2_Ps15374_log, filename='C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLDA2_Ps15374_log.mdf',size=10mb,maxsize=50mb,filegrowth=5mb)

use QLDA2_Ps15374;

create table PHONGBAN(
mapb int primary key,
tenpb nvarchar(50) not null,
trphg nvarchar (30),
ng_nhanchuc date
)

create table NHANVIEN(
manv int not null primary key,
honv nvarchar (30) not null,
tenlot nvarchar (30) not null,
ten  nvarchar (30) not null,
ngaysinh date not null,
diachi nvarchar (255) not null,
phai nvarchar(3) not null,
luong float not null,
ma_NQL int,
phg int,
constraint fk_nv_pb foreign key (phg) references phongban(mapb),
--constraint fk_nv_NQL foreign key (ma_NQL) references nhanvien(manv)
)
alter table nhanvien add constraint fk_nv_NQL foreign key (ma_NQL) references nhanvien(manv)

create table DEAN(
mada int not null primary key,
tenda nvarchar (40) not null,
diadiem_DA nvarchar (255) not null,
phg int,  
constraint fk_da_pb foreign key (phg) references phongban(mapb)
)

create table CONGVIEC(
mada int not null,
stt int not null,
tencongviec nvarchar (255) not null,
primary key (mada,stt),
constraint fk_cv_da foreign key (mada) references dean(mada)
)

create table PHANCONG(
ma_nv int not null,
mada int not null,
stt int not null,
thoigian float,
primary key (ma_nv,mada,stt),
constraint fk_pc_da foreign key (mada,stt) references congviec (mada,stt),
constraint fk_pc_nv foreign key (ma_nv) references nhanvien(manv)
)

create table THANHAN(
manv int not null,
tentn nvarchar (50) not null,
phai nvarchar (3),
ngaysinh date not null,
quanhe nvarchar (10) not null,
primary key (manv,tentn),
constraint fk_tn_nv foreign key (manv) references nhanvien(manv)
)

create table DIADIEM(
maphg int not null,
diadiem nvarchar (255) not null,
primary key (maphg,diadiem),
constraint fk_dd_pb foreign key (maphg) references phongban(mapb)
)

drop table PHONGBAN
drop table NHANVIEN
drop table DEAN
drop table PHANCONG
drop table CONGVIEC
drop table THANHAN
drop table DIADIEM

INSERT phongban VALUES ( 1,N'Qu?n L?',N'006',N'1971-06-19')
INSERT phongban VALUES ( 4,N'�i?u H�nh', N'008', N'1985-01-01')
INSERT phongban VALUES ( 5,N'Nghi�n C?u', N'005',N'0197-05-22')
INSERT phongban VALUES ( 6,N'IT', N'008',N'1985-01-01')

insert into NHANVIEN values (N'009',N'�inh',N'B�',N'Ti�n','1960-02-11',N'119 C?ng Hu?nh, TP HCM',N'NAM','30000',N'005','5')
insert into NHANVIEN values (N'005',N'Ngu?n',N'Thanh',N'T�ng','1962-08-20',N'222 Nguy?n V�n C?, TP HCM',N'Nam','40000',N'006','5')
insert into NHANVIEN values (N'007',N'B�i ',N'Ng?c',N'H�nh','1954-03-11',N'332 Nguy?n Th�i H?c, TP HCM',N'Nam','25000',N'001','4')
insert into NHANVIEN values (N'001',N'L�',N'Qu?nh',N'Nh�','1967-02-01',N'291 H? V�n Hu�, TP HCM',N'N?','43000',N'006','4')
insert into NHANVIEN values (N'004',N'Nguy?n',N'M?nh',N'H�ng','1967-03-04',N'95 B� R?a, V?ng T�u',N'Nam','38000',N'005','5')
insert into NHANVIEN values (N'003',N'Tr?n',N'Thanh',N'T�m','1957-05-04',N'34 Mai Th? L?, TP H? Ch� Minh',N'Nam','25000',N'005','5')
insert into NHANVIEN values (N'008',N'Tr?n',N'H?ng',N'Quang','1967-09-01',N'80 L� H?ng Phong, TP HCM',N'Nam','25000',N'001','4')
insert into NHANVIEN values (N'006',N'Ph?m',N'V�n',N'Vinh','1965-01-01',N'15 Tr�ng V��ng, H� N?i',N'N?','55000','','1')

insert into dean values (1,N'S?n Ph?m X',N'V?ng T�u',5)
insert into dean values (2,N'S?n Ph?m Y',N'Nha Trang',5)
insert into dean values (3,N'S?n Ph?m Z',N'TP HCM',5)
insert into dean values (10,N'Tin h?c ho�',N'H� N?i',4)
insert into dean values (20,N'C�p quang',N'TP HCM',1)
insert into dean values (30,N'��o t?o',N'H� N?i',4)

INSERT INTO congviec  VALUES (1, 1, N'Thi?t k? s?n ph?m X')
INSERT INTO congviec  VALUES  (1, 2, N'Th? nghi?m s?n ph?m X')
INSERT INTO congviec  VALUES  (2, 1, N'S?n xu?t s?n ph?m Y')
INSERT INTO congviec  VALUES  (2, 2, N'Qu?ng c�o s?n ph?m Y')
INSERT INTO congviec  VALUES  (3, 1, N'Khuy?n m?i s?n ph?m Z')
INSERT INTO congviec  VALUES  (10, 1, N'Tin h?c h�a ph?ng nh�n s?')
INSERT INTO congviec  VALUES  (10, 2, N'Tin h?c h�a ph?ng kinh doanh')
INSERT INTO congviec  VALUES  (20, 1, N'L?p �?t c�p quang')
INSERT INTO congviec  VALUES  (30, 1, N'��o t?o nh�n vi�n Marketing')
INSERT INTO congviec  VALUES  (30, 2, N'��o t?o nh�n vi�n thi?t k?')

insert into phancong values (N'009',1,1,32)
insert into phancong values (N'009',2,2,8)
insert into phancong values (N'004',3,1,40)
insert into phancong values (N'003',1,2,20.0)
insert into phancong values (N'003',2,1,20.0)
insert into phancong values (N'008',10,1,35)
insert into phancong values (N'008',30,2,5)
insert into phancong values (N'001',30,1,20)
insert into phancong values (N'001',20,1,15)
insert into phancong values (N'006',20,1,30)
insert into phancong values (N'005',3,1,10)
insert into phancong values (N'005',10,2,10)
insert into phancong values (N'005',20,1,10)
insert into phancong values (N'007',30,2,30)
insert into phancong values (N'007',10,2,10)

insert into thannhan values (005,N'Trinh',N'N?',N'04-05-1976',N'Con g�i')
insert into thannhan values (005,N'Khang',N'Nam',N'10-25-1973',N'Con trai')
insert into thannhan values (005,N'Ph�?ng',N'N?',N'05-03-1948',N'V? ch?ng')
insert into thannhan values (001,N'Minh',N'Nam',N'02-29-1932',N'V? ch?ng')
insert into thannhan values (009,N'Ti?n',N'Nam',N'01-01-1978',N'Con trai')
insert into thannhan values (009,N'Ch�u',N'N?',N'12-30-1978',N'Con g�i')
insert into thannhan values (009,N'Ph�?ng',N'N?',N'05-05-1957',N'V? ch?ng')

INSERT diadiem  VALUES (1, N'TP HCM')
INSERT diadiem  VALUES (4, N'H� N?i')
INSERT diadiem  VALUES (5, N'Nha Trang')
INSERT diadiem  VALUES (5, N'TP HCM')
INSERT diadiem  VALUES (5, N'V?ng T�u')

select * from phongban
select * from nhanvien
select * from dean
select * from congviec
select * from phancong 
select * from thannhan 
select * from diadiem