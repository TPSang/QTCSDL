CREATE DATABASE PS14673_TangPhuocSang_QLNT
USE PS14673_TangPhuocSang_QLNT

CREATE TABLE LOAINHA(
   MaLoaiNha int not null primary key,
   TenLoaiNha nvarchar(50)
);

CREATE TABLE NGUOIDUNG(
   MaND int not null primary key,
   TenND nvarchar(50),
   GioiTinh nvarchar(10),
   DienThoai varchar(12),
   SoNha nvarchar(50),
   Duong nvarchar(50),
   Phuong nvarchar(50),
   Quan nvarchar(50),
   Email nvarchar(50),
);


 CREATE TABLE NHATRO(
   MaNT int not null primary key,
   MaLoaiNha int,
   MaND int,
   DienTich float,
   GiaPhong float,
   SoNha nvarchar(50),
   Duong nvarchar(50),
   Phuong nvarchar(50),
   Quan nvarchar(50),
   MoTa text,
   NgayDang date,
   constraint fk_nhatro_nguoidung foreign key (MaND) references NGUOIDUNG(MaND),
   constraint FK_nhatro_loainha foreign key (MaLoaiNha) references LOAINHA(Maloainha)
 );

 CREATE TABLE DANHGIA(
   ID int not null primary key,
   MaND int,
   MaNT int,
   like_DisLike nvarchar(50),
   NoiDung nvarchar(50),
   constraint fk_danhgia_nhatro foreign key (MaNT) references NHATRO(MaNT),
   constraint fk_danhgia_nguoidung foreign key (MaND) references NGUOIDUNG(MaND)
 );

 -- thêm database vào loại nhà
insert into LOAINHA values('001',N'Nhà trọ ');
insert into LOAINHA values('002',N'Căn hộ chung cư');
insert into LOAINHA values('003',N'Nhà riêng');
select * from LOAINHA
-- thêm database vào người dùng
insert into NGUOIDUNG values('011',N'Hoang Van Tu',N'Nam','0339968625',N'199',N'Quang Trung',N'Phường 11',N'Quận Gò Vấp',N'Hoangtu@gmail.com');
insert into NGUOIDUNG values('012',N'Nguyen Tien Phap',N'Nam','0123456789',N'222',N'Tô Kí',N'Phường 10',N'Quận 12',N'Nguyentan@gmail.com');
insert into NGUOIDUNG values('013',N'Pham Thanh Ngan',N'Nữ','0923747932',N'332',N'Thống Nhất',N'Phường 6',N'Quận Gò Vấp',N'NganPham@.gmail.com');
insert into NGUOIDUNG values('014',N'Hoang Tuan Trung',N'Nam','0923751324',N'291',N'Phạm Văn Đồng',N'Phường 6',N'Quận Thủ Đức',N'Hoangtrung@gmail.com');
insert into NGUOIDUNG values('015',N'Tran Van Phu',N'Nam','0909876578',N'35',N' Kinh Dương Vương',N'Phường 6',N'Quận 5',N'Tranphu@gmail.com');
insert into NGUOIDUNG values('016',N'Nguyen The Tho',N'Nam','0967542367',N'80',N' Lê Hồng Phong',N'Phường 11',N'Quận 5',N'Nguyentho@gmail.com');
insert into NGUOIDUNG values('017',N'Tra Minh Quan',N'Nam','0954652367',N'45',N' Mai Thị Lự',N'Phường 2',N'Quận 12',N'Ducthien@gmail.com');
insert into NGUOIDUNG values('018',N'Nguyễn Quốc Cường ',N'Nam','0954235567',N'65',N' Phan Huy Ích',N'Phường 1',N'Quận Gò Vấp',N'Quoccuong@gmail.com');
insert into NGUOIDUNG values('019',N'Nguyen Thi Thu',N'Nữ','0923434523',N'70',N' Nguyễn Trãi',N'Phường 8',N'Quận 3',N'Nhatan@gmail.com');
insert into NGUOIDUNG values('010',N'Nguyen Thi Thu Thao',N'Nữ','0945668734',N'321',N' Phan Văn Trị',N'Phường 9',N'Quận Gò Vấp',N'thuyvy@gmail.com');
select *from NGUOIDUNG
-- thêm database vào nhà trọ
insert into NHATRO values('022','002','011','20','2000000','332',N'Quang Trung',N'Phường 11',N'Quận Gò Vấp','Phong moi','05-01-2021');
insert into NHATRO values('023','001','012','15','3000000','321',N'Xa lộ Hà Nội',N'Phường 1',N'Quận Thủ Đức','Phong moi','03-01-2021');
insert into NHATRO values('024','003','013','17','1500000','70',N'Võ Văn Kiệt ',N'Phường 7',N'Quận Thủ Đức','Phong cu','03-20-2020');
insert into NHATRO values('025','002','014','22','1900000','65',N'Nơ Trang Long',N'Phường 5',N'Quận Tân Bình','Phong moi','05-10-2020');
insert into NHATRO values('026','002','015','30','2700000','80',N'Cách Mạng Tháng 8',N'Phường 6',N'Quận 3','Phong moi','02-12-2021');
insert into NHATRO values('027','001','016','15','1400000','35',N' Kinh Dương Vương',N'Phường 6',N'Quận 5','Phong cu','01-15-2020');
insert into NHATRO values('028','003','017','22','2200000','199',N' Nguyễn Văn Trỗi',N'Phường 11',N'Quận Phú Nhuận','Phong moi','07-31-2020');
insert into NHATRO values('029','003','018','24','2200000','222',N' Đào Duy Từ',N'Phường 2',N'Quận 10','Phong moi','04-25-2021');
insert into NHATRO values('030','001','019','30','3200000','291',N' Lê Văn Việt ',N'Phường 1',N'Quận 9','Phong moi','12-12-2020');
insert into NHATRO values('031','002','010','13','1200000','331',N' Phan Văn Trị',N'Phường 9',N'Quận Gò Vấp','Phong cu','02-28-2020');
select *from NHATRO
-- thêm database vào đánh giá
insert into DANHGIA values('021','011','022','Like',N'Gía hợp lý');
insert into DANHGIA values('022','012','023','DisLike',N'Gía không hợp lý');
insert into DANHGIA values('023','013','024','Like',N'Gía hợp lý');
insert into DANHGIA values('024','014','025','Like',N'Gía hợp lý');
insert into DANHGIA values('025','015','026','DisLike',N'Gía không hợp lý');
insert into DANHGIA values('026','016','027','Like',N'Gía hợp lý');
insert into DANHGIA values('027','017','028','Like',N'Gía hợp lý');
insert into DANHGIA values('028','018','029','Like',N'Gía hợp lý');
insert into DANHGIA values('029','019','030','DisLike',N'Gía không hợp lý');
insert into DANHGIA values('030','010','031','Like',N'Gía hợp lý');
select *from DANHGIA