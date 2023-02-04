--Bài 1.1
-- Viết chương trình xem xét có tăng lương cho nhân viên hay không. Hiển thị cột thứ 1 là
--TenNV, cột thứ 2 nhận giá trị

-- “TangLuong” nếu lương hiện tại của nhân viên nhở hơn trung bình lương trong
--phòng mà nhân viên đó đang làm việc.
-- “KhongTangLuong “ nếu lương hiện tại của nhân viên lớn hơn trung bình lương
--trong phòng mà nhân viên đó đang làm việc.
declare @Thongke table (Phg int, LTB float);
insert into @Thongke
select PHG,AVG(luong) as LTB from NHANVIEN group by PHG;
select TENNV,LUONG,'Tinh Trang' =IIF(luong >b.LTB,'Khong tang luong','Tang Luong')
from NHANVIEN a inner join @Thongke b on a.PHG = b.Phg;

--Bài 1.2
--Viết chương trình phân loại nhân viên dựa vào mức lương.
-- Nếu lương nhân viên nhỏ hơn trung bình lương mà nhân viên đó đang làm việc thì
--xếp loại “nhanvien”, ngược lại xếp loại “truongphong”

declare @Thongke table (Phg int, LTB float);
insert into @Thongke
select PHG,AVG(luong) as LTB from NHANVIEN group by PHG;
select TENNV,LUONG,'Chuc Vu' =IIF(luong >b.LTB,'Truong Phong','Nhan Vien')
from NHANVIEN a inner join @Thongke b on a.PHG = b.Phg;

--Bài 1.3
--Viết chương trình hiển thị TenNV như hình bên dưới, tùy vào cột phái của nhân viên

select  IIF(phai=N'Nam','Mr.','Ms.') +TENNV as 'TenNV' from NHANVIEN

--Bài 1.4
--Viết chương trình tính thuế mà nhân viên phải đóng theo công thức:
-- 0<luong<25000 thì đóng 10% tiền lương
-- 25000<luong<30000 thì đóng 12% tiền lương
-- 30000<luong<40000 thì đóng 15% tiền lương
-- 40000<luong<50000 thì đóng 20% tiền lương
-- Luong>50000 đóng 25% tiền lương

select TENNV,LUONG,'Thue' =
case
	when LUONG between 0 and 25000 then LUONG * .1
	when LUONG between 25000 and 30000 then LUONG * .1
	when LUONG between 30000 and 40000 then LUONG * .1
	when LUONG between 40000 and 50000 then LUONG * .1
	else LUONG * .25

	end 
	 from NHANVIEN;

--Bài 2.1
--Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn

declare  @max  int ,@num  int;
select @max =Max(cast(manv as int)) from NHANVIEN;

set @num =1;

while @num<= @max 
begin
if  @num %2=0
 select HONV, TENLOT,TENNV,MANV from NHANVIEN where  cast(manv as int )=@num ;

 set @num = @num +1;
end;

--Bài 2.2
--Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn nhưng
--không tính nhân viên có MaNV là 4.

declare  @max  int ,@num  int;
select @max =Max(cast(manv as int)) from NHANVIEN;

set @num =1;

while @num<= @max 
begin
if @num = 4
 begin
 set @num=@num+1;
 continue;
 end

if  @num %2=0
 select HONV, TENLOT,TENNV,MANV from NHANVIEN where  cast(manv as int )=@num ;

 set @num = @num +1;
end;

--Bài 3.1
--Thực hiện chèn thêm một dòng dữ liệu vào bảng PhongBan theo 2 bước
-- Nhận thông báo “ thêm dư lieu thành cong” từ khối Try
-- Chèn sai kiểu dữ liệu cột MaPHG để nhận thông báo lỗi “Them dư lieu that bai”
--từ khối Catchselect * from PHONGBAN

begin  try 
	insert  into PHONGBAN(TENPHG,MAPHG,TRPHG,NG_NHANCHUC)
		values(N'Sản Xuất',7,'007','2021-06-01');
		print N'Dữ liệu thành công';
end try
begin catch 
	print N'Dữ liệu thất bại';
	end catch; --Bài 3.2--Viết chương trình khai báo biến @chia, thực hiện phép chia @chia cho số 0 và dùng
--RAISERROR để thông báo lỗi.begin try 
	declare @chia int;
	set @chia= 50/0;
	end try
begin catch
	declare @ErrorMessage nvarchar(2048),@ErrorSeverity int,@ErrorState int;

	select  @ErrorMessage= ERROR_MESSAGE(),
			@ErrorSeverity= ERROR_SEVERITY(),
			@ErrorState= ERROR_STATE();
			
		Raiserror (@ErrorMessage,@ErrorSeverity,@ErrorState);
		end catch;													---HẾT---