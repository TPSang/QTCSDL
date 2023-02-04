
create table PhanLoaiSach(
MaPL int primary key not null,
TenLoai nvarchar(20) not null,
MoTa nvarchar(100)
)
create table Sach(
MaSach int primary key not null,
TieuDe nvarchar(50) not null,
MoTaNgan nvarchar(200),
TacGia nvarchar(30),
NgayXB date,
MaPL int,
constraint fk_Sach foreign key(MaPL) references PhanLoaiSach(MaPL)
)
insert into PhanLoaiSach
values
('1',N'Văn Học',N'Thể loại sách văn học'),
('2',N'Kĩ Thuật',N'Thể loại sách Kỹ Thuật'),
('3',N'Lập trình',N'Sách chuyên về lập trình phần mềm'),
('4',N'Kinh tế',N'Sách về kinh tế, kỹ năng làm giàu'),
('5',N'Ngoại Ngữ ',N'Ngoại Ngữ như tiếng Anh, Nhật')
insert into Sach
values
('1',N'Cuốn theo chiều gió',N'Một cuốn tiểu thuyết kinh điển','Margaret Mitchell','1997-10-25',1),
('2',N'Tôi thấy hoa vàng trên cỏ xanh',N'tác phẩm bán chạy nhất tại hội sách Tp HCM 2010','Nguyễn Nhật Ánh','2016-5-20',1),
('3','html5&css3',N'Cuốn sách về lập trình trang wed mới',N'Trần duy Phong','2016-11-11',3),
('4','Sql server 2013',N'Lập trình cơ sở dữ liệu nâng cao',N'Trần duy Phong','2015-01-10',3),
('5',N'3000 từ vựng tiếng anh','Oxford','Oxford',null,5)
select * from PhanLoaiSach
select * from Sach





	---------------
	--2.	Viết hàm trả về tổng số cuốn sách theo tác giả.
if OBJECT_ID ('sp_find_Sach') is not null
drop proc sp_find_Sach
go
create proc sp_find_Sach
@MaSach varchar(10)=null
as
if @MaSach is null
		begin
			print N'Lỗi:'
			print N'Thiếu thông tin đầu vào'
		end
	else
		begin
			select TieuDe,TacGia,TenLoai,NgayXB
			from Sach join PhanLoaiSach
			on Sach.MaPL=PhanLoaiSach.MaPL
			where MaSach=@MaSach
		end
exec sp_find_Sach 
	@MaSach= 2
---------------------------
if OBJECT_ID ('fn_TongSoSach') is not null
drop function fn_TongSoSach
go
create function fn_TongSoSach (@TacGia varchar(30))
returns int
as
begin
	declare @Tong int
	select @Tong = count (MaSach)
	from Sach where TacGia like @TacGia
	group by TacGia
	return @Tong 
end
print N'Tổng số sách : '+cast(dbo.fn_TongSoSach(N'Oxford') as varchar)



if object_id('fn_TongSoSach2') is not null
drop function fn_TongSoSach2
go
create function fn_TongSoSach2 @TacGia varchar(30)
returns int
as 
	begin
		return (select count(MaSach) from Sach
			where TacGia like @TacGia group by TacGia)
	end
print N'Số lượng Sách : '+cast(dbo.fn_TongSoSach2(N'Oxford') as varchar(10))

--3.	Tạo View có tên ViewTacGia gồm danh sách tác giả hiện có sách.
if OBJECT_ID ('ViewTacGia') is not null
drop view ViewTacGia
go

create view ViewTacGia
as
select 
TacGia
from Sach 
--Truy van
select * from ViewTacGia







