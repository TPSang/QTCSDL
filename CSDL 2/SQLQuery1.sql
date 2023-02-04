create database COM2034-MSSV-QLSach;
use COM2034-MSSV-QLSach;

create table PhanLoaiSach(
MaPL int primary key not null,
TebLoai nvarchar(20) not null,
MoTa nvarchar(100)  null)
create table Sach(
MaSach  int primary key not null,
TieuDe nvarchar(50) not null,
MoTaNgan nvarchar(200)  null,
TacGia nvarchar(30)  null,
NgayXB date  null,
MaPL int  null,
constraint fk_Sach foreign key (MaPL)  references Sach(MaSach),)





insert into PhanLoaiSach
values
('1','Văn Học','Thể loại sách văn học'),
('2','Kỹ Thuật','Thể loại sách kỹ thuật'),
('3','Lập Trình','Sách chuyên về lập trình phần mềm'),
('4','Kinh Tế','Sách kinh tế,Kỹ năng làm giàu'),
('5','Ngoại Ngữ','Ngoại ngữ như: Tiếng Anh, Nhật')

insert into Sach
values
('1','Cuốn theo chiều gió','Một cuốn tiểu thuyết kinh điển','Margaret Mitchell','10/25/1997','1'),
('2','Tôi thấy hoa vàng trên cỏ xanh','Tác phẩm Bán chạy Nhất tại Hội sách Tp. HCM2010','Nguyễn Nhật Ánh','5/20/2016','1'),
('3','HTML5 & CSS3','Cuốn sách về lập trình web mới nhất','Trần Duy Phong','11/11/2016','3'),
('4','QSL Sever 2012','Lập trình cơ sở dữ liệu nâng cao','Trần Duy Phong','01/10/2015','3'),
('5','3000 từ vựng Tiếng Anh','Oxford','Oxford',' ','5'),

