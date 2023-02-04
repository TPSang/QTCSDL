
--  In ra dòng ‘Xin chào’ + @ten với @ten là tham số đầu vào là tên Tiếng Việt có dấu của bạn. 
create proc sp_hello
@ten nvarchar(30) 
as
begin
  print 'Hello'+@ten;
  end;
 exec sp_hello  N'tú';



 --  Nhập vào 2 số @s1,@s2. In ra câu ‘Tổng là : @tg’ với @tg=@s1+@s2.
create proc sp_sum
 @so1 int, @so2 int
 as 
 begin
 declare @sum int;
 set @sum=@so1 + @so2;
 print N'Tổng 2 số là:' +cast(@sum as nvarchar(20));
 end;
 exec sp_sum 45, 90;
 -- Nhập vào số nguyên @n. In ra tổng các số chẵn từ 1 đến @n

 create proc sp_sum2
 @n int
 as begin
 declare @sum int, @i int
 set @sum=0;
 set @i=1;
 while @i<=@n
 begin
	if @i%2=0
	begin 
	set @sum=@sum+@i;
	end;
	set @i=@i+1;
	end;
	print N'Tổng  các số chẵn là:' +cast(@sum as nvarchar(20));
end;

exec sp_sum2 15;

-- Nhập vào 2 số. In ra ước chung lớn nhất của chúng 
create proc sp_ucln
@a int, @b int
as begin
	declare @temp int;
	if @a>@b
	begin
	select @temp=@a,
			@a=@b,
			@b=@temp;
			end
	while @b%@a!=0
	begin 
		select @temp=@a,
		@a=@b%@a,
		@b=@temp;
		end;
		print N'Ước chung lớn nhất' +cast(@a as nvarchar(10));
		end;
exec sp_ucln	 20, 40;

-- BÀI 2
-- Nhập vào @Manv, xuất thông tin các nhân viên theo @Manv.
create proc sp_timNhanVienTheoMa
	@ma nvarchar(30)
	as begin
	select *from nhanvien where maNV=@ma;
end;

exec sp_timNhanVienTheoMa '005';

--Nhập vào @MaDa (mã đề án), cho biết số lượng nhân viên tham gia đề án đó
select * from phancong;

create proc sp_NhanVienThamGiaDA
	@maDA int 
as begin
	select COUNT(maDA)  as N'Số Lượng' from phancong where maDA=@maDA;
end;

exec sp_NhanVienThamGiaDA 1;
exec sp_NhanVienThamGiaDA 2;
exec sp_NhanVienThamGiaDA 3;

-- Nhập vào @MaDa và @Ddiem_DA (địa điểm đề án), cho biết số lượng nhân viên tham 
--gia đề án có mã đề án là @MaDa và địa điểm đề án là @Ddiem_DA
alter proc sp_ThongKeNhanVienDA
 @mada int, @ddiem nvarchar(20)
 as begin 
	select COUNT(pc.maNV) as 'Số Lượng'from dean  da 
	inner join phancong pc on da.maDA=pc.maDA
	where da.maDA=@mada and da.ddiem_DA=@ddiem;
	end;
exec sp_ThongKeNhanVienDA 1,'Vũng Tàu';
exec sp_ThongKeNhanVienDA 2,'Nha Trang';
exec sp_ThongKeNhanVienDA 3,'TP HCM';

select * from dean;

 -- Nhập vào @Trphg (mã trưởng phòng), xuất thông tin các nhân viên có trưởng phòng là 
--@Trphg và các nhân viên này không có thân nhân
create proc sp_timNhanVienTheoTruongPhong
 @trPHG nvarchar(9)
 as begin 
	select nv.* from phongban pb inner join nhanvien nv on nv.maPB=pb.maPB
	where pb.trPB=@trPHG and not exists 
	(select * from  thannhan where maNV=nv.maNV)
end;

exec sp_timNhanVienTheoTruongPhong '008';
exec sp_timNhanVienTheoTruongPhong '006';
exec sp_timNhanVienTheoTruongPhong '005';
select * from phongban;

-- Nhập vào @Manv và @Mapb, kiểm tra nhân viên có mã @Manv có thuộc phòng ban có 
--mã @Mapb hay không
alter proc sp_NhanVienThuocPhong
	@manv nvarchar(9), @mapb int
as begin 
	declare @dem int;
	select COUNT(maNV) as 'Số Lường' from nhanvien where maNV=@manv and maPB=@mapb;
	return @dem;
end;
declare @result int;
exec @result= sp_NhanVienThuocPhong '005',5;
--select @result;
select * from nhanvien;

--BÀI 3
--Thêm phòng ban có tên CNTT vào csdl QLDA, các giá trị được thêm vào dưới dạng 
--tham số đầu vào, kiếm tra nếu trùng Maphg thì thông báo thêm thất bại.
create proc sp_ThemPhongBanMoi 
	@tenpb nvarchar(15),
	@mapb int,
	@trPHG nvarchar(15),
	@ng_nhamchuc date
as begin
	if exists (select * from phongban where maPB=@mapb)
	begin 
		print N'Mã phồng ban đã tồn tại';
		return;
		end;
	insert into  dbo . phongban 
	( tenPB ,
	 maPB ,
	 trPB ,
	 ngay_Nhanchuc )
	values 
	(@tenpb, @mapb, @trPHG, @ng_nhamchuc);
end;
		
exec sp_ThemPhongBanMoi 'CNTT',10,'005', '3-6-2021';
select * from phongban;

--Cập nhật phòng ban có tên CNTT thành phòng IT.
create proc sp_CapNhatPhongBan
	@nameUpdate nvarchar(15),
	@tenpb nvarchar(15),
	@mapb int,
	@trPHG nvarchar(15),
	@ng_nhamchuc date
as begin 
 UPDATE  dbo . phongban 
   SET  tenPB  = @tenpb
      , maPB  = @mapb
      , trPB  = @trPHG
      , ngay_Nhanchuc  = @ng_nhamchuc
 WHERE tenPB=@nameUpdate;
end;

exec sp_CapNhatPhongBan 'CNTT', 'IT', 10,'005', '3-6-2021';

select * from phongban;

-- Thêm một nhân viên vào bảng NhanVien, tất cả giá trị đều truyền dưới dạng tham số đầu 
--vào với điều kiện:
--o nhân viên này trực thuộc phòng IT
--o Nhận @luong làm tham số đầu vào cho cột Luong, nếu @luong<25000 thì nhân 
---viên này do nhân viên có mã 009 quản lý, ngươc lại do nhân viên có mã 005 quản lý
--o Nếu là nhân viên nam thi nhân viên phải nằm trong độ tuổi 18-65, nếu là nhân 
--viên nữ thì độ tuổi phải từ 18-60.
alter proc sp_ThemNhanVien
	 @hoNV   nvarchar(15),
	 @tenLot   nvarchar(15),
	 @tenNV   nvarchar(15)  ,
	 @maNV   varchar(9),
	 @ngSinh   datetime,
	 @dChi   nvarchar(30),
	 @phai   nvarchar(3),
	 @luong  float,
	 @maPB   int
as begin
	if not exists (select * from phongban where tenPB='IT')
	begin 
	print N'Không phải phòng IT';
	return;
	end;
	declare @ma_NQL nvarchar(9);
	if @luong>25000
		set @ma_NQL='005';
	else
		set @ma_NQL='009';
	declare @age int;
	select @age=datediff(YEAR, @ngsinh, GETDATE()) +1	;
	if not @phai='Nam' and @age>=18 and  @age<=65
		begin
			print N'Nằm trong khoảng 18 - 65';
		return;
	end;
	else if not @phai='Nữ' and @age>18 and  @age<60
	begin 
	print N'Nằm trong khoảng 18 - 6';
	end;

INSERT INTO  dbo . nhanvien 
           ( hoNV, tenLot , tenNV , maNV , ngSinh , dChi, phai , luong, ma_NQL , maPB )
     VALUES
           (@hoNV, @tenLot, @tenLot, @maNV, @ngSinh, @dChi, @phai, @luong, @ma_NQL,@maPB);
end;

exec [dbo].[sp_ThemNhanVien] 
N'Nguyên', N'Thị', N'Thúy', '010', '21_2_2021', N'TP HCM', 'Nữ', 600000,4;

select * from nhanvien;