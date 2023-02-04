CREATE DATABASE PS15374_TranTrongDuy_QLNT
USE PS15374_TranTrongDuy_QLNT

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
insert into NGUOIDUNG values('011',N'Hoàng Văn Tú',N'Nam','0339968625',N'199',N'Quang Trung',N'Phường 11',N'Quận Gò Vấp',N'Hoangtu@gmail.com');
insert into NGUOIDUNG values('012',N'Nguyễn Duy Tân',N'Nam','0123456789',N'222',N'Tô Kí',N'Phường 10',N'Quận 12',N'Nguyentan@gmail.com');
insert into NGUOIDUNG values('013',N'Phạm Thanh Ngân',N'Nữ','0923747932',N'332',N'Thống Nhất',N'Phường 6',N'Quận Gò Vấp',N'NganPham@.gmail.com');
insert into NGUOIDUNG values('014',N'Hoàng Tuấn Trung',N'Nam','0923751324',N'291',N'Phạm Văn Đồng',N'Phường 6',N'Quận Thủ Đức',N'Hoangtrung@gmail.com');
insert into NGUOIDUNG values('015',N'Trần Văn Phú',N'Nam','0909876578',N'35',N' Kinh Dương Vương',N'Phường 6',N'Quận 5',N'Tranphu@gmail.com');
insert into NGUOIDUNG values('016',N'Nguyễn Thế Thọ',N'Nam','0967542367',N'80',N' Lê Hồng Phong',N'Phường 11',N'Quận 5',N'Nguyentho@gmail.com');
insert into NGUOIDUNG values('017',N'Nguyễn Huỳnh Đức Thiện',N'Nam','0954652367',N'45',N' Mai Thị Lự',N'Phường 2',N'Quận 12',N'Ducthien@gmail.com');
insert into NGUOIDUNG values('018',N'Nguyễn Quốc Cường ',N'Nam','0954235567',N'65',N' Phan Huy Ích',N'Phường 1',N'Quận Gò Vấp',N'Quoccuong@gmail.com');
insert into NGUOIDUNG values('019',N'Phạm Nguyễn Nhật An',N'Nữ','0923434523',N'70',N' Nguyễn Trãi',N'Phường 8',N'Quận 3',N'Nhatan@gmail.com');
insert into NGUOIDUNG values('010',N'Hứa Thị Thúy Vy',N'Nữ','0945668734',N'321',N' Phan Văn Trị',N'Phường 9',N'Quận Gò Vấp',N'thuyvy@gmail.com');
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

-- GIAI ĐOẠN 2:
--1. Thêm thông tin vào các bảng:
--SP thứ nhất thực hiện chèn dữ liệu vào bảng NGUOIDUNG
if OBJECT_ID('sp_insert_NGUOIDUNG') is not null 
	drop proc sp_insert_NGUOIDUNG
go
create proc sp_insert_NGUOIDUNG
	@MaND int= null,
	@TenNguoiDung nvarchar(50)=null,
	@GioiTinh nvarchar(10) = null,
	@DienThoai char(50)=null,
	@SoNha nvarchar(50)=null,
	@Duong nvarchar(50)=null,
	@Phuong nvarchar(50)=null,
	@Quan nvarchar(50)=null,
	@Email char(50)=null
as
	if (@MaND is null) or (@TenNguoiDung is null) or (@GioiTinh is null) or (@DienThoai is null) or 
	(@SoNha is null) or (@Duong is null) or (@Phuong is null) or (@Quan is null) or (@Email is null)
		begin
			print N'Lỗi'
			print N'Thiếu thông tin đầu vào'
		end
	else
		begin
			insert into NGUOIDUNG values(@MaND,@TenNguoiDung,@GioiTinh,@DienThoai,@SoNha,@Duong,@Phuong,@Quan,@Email)
			print N'Thêm thông tin thành công'
		end
exec sp_insert_NguoiDung '021',N'Hoàng Văn Tú',N'Nam','0339968625',N'123',N'Quang Trung',N'Phường 11',N'Quận Gò Vấp',N'hoangtubl07@gamil.com'
exec sp_insert_NguoiDung '021',N'Hoàng Văn Tú',N'Nam','0339968625',N'123',N'Quang Trung',N'Phường 11',N'Quận Gò Vấp'
select * from NGUOIDUNG
--SP thứ hai thực hiện chèn dữ liệu vào bảng NHATRO
if OBJECT_ID('sp_insert_NHATRO') is not null 
	drop proc sp_insert_NHATRO
go
create proc sp_insert_NHATRO
	@MaNT int= null,
	@MaLoaiNha int=null,
	@MaND int= null,
	@DienTich float=null,
	@GiaPhong float=null,
	@SoNha  nvarchar(50) = null,
	@Duong nvarchar(50)=null,
	@Phuong nvarchar(50)=null,
	@Quan nvarchar(50)=null,
	@MoTa text=null,
	@NgayDang date=null
as
	if (@MaNT is null) or (@MaLoaiNha is null) or (@MaND is null) or (@DienTich is null) or (@GiaPhong is null) or 
	(@SoNha is null) or (@Duong is null) or (@Phuong is null) or (@Quan is null) or (@MoTa is null) or (@NgayDang is null)
		begin
			print N'Lỗi'
			print N'Thiếu thông tin đầu vào'
		end
	else
		begin
			insert into NHATRO values(@MaNT,@MaLoaiNha, @MaND, @DienTich, @GiaPhong, @SoNha, @Duong, @Phuong, @Quan, @MoTa, @NgayDang)
			print N'Thêm thông tin thành công'
		end
exec sp_insert_NHATRO '032','001','111','35','4000000','123 ',N'Quang Trung ',N'Phường 11',N'Quận Gò Vấp','Phong moi','1-9-2020'
exec sp_insert_NHATRO '032','001','111','35','4000000','123',N'Quang Trung',N'Phường 11',N'Quận Gò Vấp','Phong moi'
select * from NHATRO
--SP thứ ba thực hiện chèn dữ liệu vào bảng DANHGIA
if OBJECT_ID('sp_insert_DANHGIA') is not null 
	drop proc sp_insert_DANHGIA
go
create proc sp_insert_DANHGIA
	@ID int = null,
	@MaND int = null,
	@MaNT int = null,
	@Like_DL nvarchar(50) = null,
	@ND nvarchar(50) = null
as
	if (@ID is null) or (@MaND is null) or (@MaND is null) or (@MaNT is null) or (@Like_DL is null) or 
	(@ND is null)
		begin
			print N'Lỗi'
			print N'Thiếu thông tin đầu vào'
		end
	else
		begin
			insert into DANHGIA values(@ID,@MaND,@MaNT,@Like_DL,@ND)
			print N'Thêm thông tin thành công'
		end
exec sp_insert_DANHGIA '131','111','232','DisLike',N'Gía không hợp lý'
exec sp_insert_DANHGIA '131','111','232','DisLike'
select * from DANHGIA
-- bài 2:
--a. Viết một SP với các tham số đầu vào phù hợp. SP thực hiện tìm kiếm thông tin các phòng trọ thỏa mãn điều kiện tìm kiếm theo: Quận, phạm vi diện tích, phạm vi ngày đăngtin, khoảng giá tiền, loại hình nhà trọ.
if OBJECT_ID('sp_select_NhaTro1') is not null
	drop proc sp_select_NhaTro1
go
create proc sp_select_NhaTro1
	@Quan nvarchar(50) = N'%',
	@LoaiNhaTro nvarchar(50)= N'%',
	@DienTichMax float=null,
	@DienTichMin float=null,
	@NgayDangMax date=null,
	@NgayDangMin date=null,
	@GiaPhongMax money=null,
	@GiaPhongMin money=null
as
if @DienTichMax is null
	begin
		select @DienTichMax=max(DienTich) from NHATRO
	end
if @DienTichMin is null
	begin
		select @DienTichMin=min(DienTich) from NHATRO
	end
if @NgayDangMax is null
	begin
		select @NgayDangMax=max(NHATRO.NgayDang) from NHATRO
	end
if @NgayDangMin is null
	begin
		select @NgayDangMin=min(NHATRO.NgayDang) from NHATRO
	end
if @GiaPhongMax is null
	begin
		select @GiaPhongMax=max(NHATRO.GiaPhong) from NHATRO
	end
if @GiaPhongMin is null
	begin
		select @GiaPhongMin=min(NHATRO.GiaPhong) from NHATRO
	end
select (N'Cho thuê phòng trọ tại ' + NHATRO.SoNha + ',' +NHATRO.Quan) as 'Địa chỉ phòng trọ',
        replace(convert(varchar,DienTich,103),'.',', ')+'m2' as 'Diện tich',
		replace(left(convert(varchar,GiaPhong,1),len(convert(varchar,GiaPhong,1))-6),',','.') as 'Gía Phòng',
	    Mota as 'Thông tin',
		convert(varchar,NgayDang,105) as 'Ngày Đăng',
		case NGUOIDUNG.GioiTinh 
		when 1 then 'A.    '+NGUOIDUNG.TenND
		when 0 then 'C.    '+NGUOIDUNG.TenND
		end as N'Người Đăng',
		DienThoai as N'Điện thoại liên hệ',(NGUOIDUNG.SoNha + ','+ NGUOIDUNG.Quan)
		from NHATRO inner join LOAINHA on NHATRO.MaLoaiNha=LOAINHA.MaLoaiNha
		inner join NGUOIDUNG on NGUOIDUNG.MaND=NHATRO.MaND
		where (DienTich<=@DienTichMax) and (DienTich>=@DienTichMin) and (NgayDang<=@NgayDangMax)
		and (NgayDang>=@NgayDangMin) and (GiaPhong<=@GiaPhongMax) and (GiaPhong>=@GiaPhongMin)
		and (NHATRO.Quan like @Quan) and (LOAINHA.TenLoaiNha like @LoaiNhaTro) order by NgayDang

--b. Viết một hàm có các tham số đầu vào tương ứng với tất cả các cột của bảng NGUOIDUNG. Hàm này trả về mã người dùng (giá trị của cột khóa chính của bảng NGUOIDUNG) thỏa mãn các giá trị được truyền vào tham số.
if OBJECT_ID ('fn_MaNguoiDung') is not null
drop function fn_MaNguoiDung
go
create function fn_MaNguoiDung
	(@TenNguoiDung nvarchar(50)=N'%', @DienThoai nvarchar(50)=N'%', @DiaChi nvarchar(50)=N'%',
     @Quan nvarchar(50)=N'%')
returns table
return (select MaND from NGUOIDUNG where (TenND like @TenNguoiDung)and(SoNha like @DiaChi)and
       (Quan like @Quan)and (DienThoai like @DienThoai))

select MaNT as N'Mã nhà trọ', TenLoaiNha as N'Mã loại nhà',
	   replace(convert(varchar,DienTich,103),'.',', ')+'m2' as 'Diện tich',
	   replace(left(convert(varchar,GiaPhong,1),len(convert(varchar,GiaPhong,1))-6),',','.') as 'Gía Phòng',
	   (NHATRO.SoNha +', '+ NHATRO.Quan) as N'Địa chỉ nhà trọ',
	    MoTa as N'Thông tin nhà trọ',
		NgayDang as N'Ngày Đăng',
		NGUOIDUNG.TenND as N'Tên người đăng' 
from NHATRO inner join NGUOIDUNG on NHATRO.MaND=NGUOIDUNG.MaND
inner join LOAINHA on LOAINHA.MaLoaiNha=NHATRO.MaLoaiNha
where NHATRO.MaND in(select MaND from dbo.fn_MaNguoiDung(N'%Nguyễn%',default,default,default))
--c. Viết một hàm có tham số đầu vào là mã nhà trọ (cột khóa chính của bảng NHATRO). Hàm này trả về tổng số LIKE và DISLIKE của nhà trọ này.
if OBJECT_ID ('fn_TongLike') is not null
drop function fn_TongLike
go
create function fn_TongLike 
		(@MaNT int=null)
returns int
as 
	begin
		return(select count (like_DisLike) from DANHGIA where MaNT = @MaNT and like_DisLike = 'Like')
	end

if OBJECT_ID('fn_TongDisLike') is not null
drop function fn_TongDisLike
go
create function fn_TongDisLike
   ( @MaNT int=null)
returns int
as
	begin
		return(select count(like_DisLike) from DANHGIA where MaNT = @MaNT and like_DisLike = 'DisLike')
end
select MaNT as N'Mã nhà trọ',
	   TenLoaiNha as N'Tên loại nhà',
	   replace(convert(varchar,DienTich,103),'.',', ')+'m2' as 'Diện tich',
	   replace(left(convert(varchar,GiaPhong,1),len(convert(varchar,GiaPhong,1))-6),',','.') as 'Gía Phòng',
	   (NHATRO.SoNha + ', ' + NHATRO.Quan) as N'Địa chỉ nhà trọ',
	   dbo.fn_TongLike(MaNT) as 'Tổng Like',
	   dbo.fn_TongDisLike(MaNT) as 'Tổng DisLike',
	   NgayDang as N'Ngày đăng',
	   NGUOIDUNG.TenND as N'Người đăng'
from NHATRO inner join NGUOIDUNG on NHATRO.MaND=NGUOIDUNG.MaND
inner join LOAINHA on LOAINHA.MaLoaiNha=NHATRO.MaLoaiNha
select * from DANHGIA
--d. Tạo một View lưu thông tin của TOP 10 nhà trọ có số người dùng LIKE nhiều nhất gồm các thông tin sau:
if OBJECT_ID('vw_Top5') is not null
drop view vw_Top5
go
create view vw_Top5
as
select top 5 NHATRO.MaNT as N'Mã nhà trọ',
	   TenLoaiNha as N'Tên loại nhà',
	   replace(convert(varchar,DienTich,103),'.',', ')+'m2' as 'Diện tich',
	   replace(left(convert(varchar,GiaPhong,1),len(convert(varchar,GiaPhong,1))-6),',','.') as 'Gía Phòng',
	   (NHATRO.SoNha + ', ' + NHATRO.Quan) as N'Địa chỉ nhà trọ',
	   dbo.fn_TongLike(MaNT) as 'Tổng Like',
	   NgayDang as N'Ngày đăng',
	   NGUOIDUNG.TenND as N'Người đăng'
from NHATRO inner join NGUOIDUNG on NHATRO.MaND=NGUOIDUNG.MaND
inner join LOAINHA on LOAINHA.MaLoaiNha=NHATRO.MaLoaiNha
order by N'Tổng Like' desc
select * from vw_Top5
--e. Viết một Stored Procedure nhận tham số đầu vào là mã nhà trọ (cột khóa chính củabảng NHATRO). SP này trả về tập kết quả gồm các thông tin sau:
if OBJECT_ID('sp_DanhGia') is not null
	drop proc sp_DanhGia
go
create proc sp_DanhGia
	@MaNhaTro int
as 
if not exists(select * from NHATRO where MaNT=@MaNhaTro)
	begin
		print N'Nhà trọ này không tồn tại'
	end 
else
	begin
		if not exists(select * from DANHGIA where MaNT=@MaNhaTro)
			begin
				print N'Nhà trọ chưa được đánh giá'
			end
		else
			begin
				select DANHGIA.MaNT as 'Mã nhà trọ',
					   NGUOIDUNG.TenND as 'Người đánh giá',
					   case DANHGIA.like_DisLike 
							when 'Like' then 'Like'
							when 'DisLike' then 'DisLike'
						end as 'Đánh giá',
						DANHGIA.NoiDung as 'Nội dung đánh giá'
						from DANHGIA inner join NGUOIDUNG on NGUOIDUNG.MaND=DANHGIA.MaND
						where DANHGIA.MaNT=@MaNhaTro
			end
	end
select * from NHATRO
exec sp_DanhGia @MaNhaTro =222
exec sp_DanhGia @MaNhaTro =200
-- bài 3:
-- 1. Viết một SP nhận một tham số đầu vào kiểu int là số lượng DISLIKE. SP này thực hiện thao tác xóa thông tin của các nhà trọ và thông tin đánh giá của chúng, nếu tổng số lượng DISLIKE tương ứng với nhà trọ này lớn hơn giá trị tham số được truyền vào.Yêu cầu: Sử dụng giao dịch trong thân SP, để đảm bảo tính toàn vẹn dữ liệu khi một thao tác xóa thực hiện không thành công.
if OBJECT_ID('sp_delete_NhaTro_DisLike') is not null
	drop proc sp_delete_NhaTro_DisLike
go
create proc sp_delete_NhaTro_DisLike
	@DisLike nvarchar
as
begin try
	begin tran
		declare @MaNhaTro table(MaNT int)
			insert into @MaNhaTro
			select NHATRO.MaNT from NHATRO where
			dbo.fn_TongDisLike(NHATRO.MaNT)>@DisLike
		delete from DANHGIA
			where DANHGIA.MaNT in(select MaNT from @MaNhaTro)
		delete from NHATRO
			where NHATRO.MaNT in(select MaNT from @MaNhaTro)
		print 'Thao tác thành công'
	commit tran
end try
begin catch
	rollback tran
	print 'Thao tác không thành công'
end catch
select * from DANHGIA
exec sp_delete_NhaTro_DisLike @DisLike=DisLike
--2. Viết một SP nhận hai tham số đầu vào là khoảng thời gian đăng tin. SP này thực hiện thao tác xóa thông tin những nhà trọ được đăng trong khoảng thời gian được truyền vào qua các tham số.
if OBJECT_ID('sp_delete_NhaTro_NgayDang') is not null
	drop proc sp_delete_NhaTro_NgayDang
go
create proc sp_delete_NhaTro_NgayDang
	@NgayDangMax date=null,
	@NgayDangMin date=null
as
begin try
	begin tran
		if (@NgayDangMax is null)
			select @NgayDangMax=MAX(NHATRO.NgayDang) from NHATRO
		if (@NgayDangMin is null)
			select @NgayDangMin=MIN(NHATRO.NgayDang) from NHATRO
		declare @MaNhaTro table(MaNT int)
			insert into @MaNhaTro
			select NHATRO.MaNT from NHATRO
			where (NgayDang<=@NgayDangMax) and (NgayDang>=@NgayDangMin)
		delete from DANHGIA
			where DANHGIA.MaNT in (select MaNT from @MaNhaTro)
		delete from NHATRO
			where NHATRO.MaNT in (select MaNT from @MaNhaTro)
		print 'Thao tác thành công'
	commit tran
end try
begin catch
	rollback tran
	print N'Thao tác thành công'
end catch
select * from NHATRO
exec sp_delete_NhaTro_NgayDang @NgayDangMax='2021-02-10',@NgayDangMin='2021-02-01'
