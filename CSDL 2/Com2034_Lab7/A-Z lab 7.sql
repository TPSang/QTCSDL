--Bài 1
--Nhập vào MaNV cho biết tuổi của nhân viên này
create function FN_Age(@MaNV nvarchar(9))
returns int 
as
begin
return(
select DATEDIFF(year,NGSINH,GETDATE())+1 from NHANVIEN where MANV= @MaNV);
end;

 select [dbo].[FN_Age]('006');

 --Nhập vào Manv cho biết số lượng đề án nhân viên này đã tham gia create function FN_TongSoDeAn( @MaNV nvarchar(9)) returns int  as begin return (select count(mada) from PHANCONG where MA_NVIEN=@MaNV); end; select [dbo].[FN_TongSoDeAn]('005'); --Truyền tham số vào phái nam hoặc nữ, xuất số lượng nhân viên theo phái create function FN_ThongKePhai( @phai nvarchar(3)) returns int  as begin return(select count(manv) from NHANVIEN where PHAI=@phai); end;  select [dbo].[FN_ThongKePhai](N'Nam');--Truyền tham số đầu vào là tên phòng, tính mức lương trung bình của phòng đó, Cho biết
--họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình
--của phòng đó.create function FN_LuongLB(@TenPhong nvarchar(30))returns int asbegin return(select AVG(b.luong) from PHONGBAN a inner join NHANVIEN b on a.MAPHG=b.PHGwhere TENPHG like '%' + @TenPhong +'%')end;select HONV,TENLOT, TENNV from NHANVIEN a inner join PHONGBAN b on a.PHG=b.MAPHGwhere luong > [dbo].[FN_LuongLB] (N'Điều Hành')and TENPHG like N'%Điều Hành%';--Tryền tham số đầu vào là Mã Phòng, cho biết tên phòng ban, họ tên người trưởng phòng
--và số lượng đề án mà phòng ban đó chủ trì.create function FN_ThongTinPhongDeAn(@MaPhg int)returns @List table(TenPhong nvarchar(15),TenTruongPhong nvarchar(30),SoLuongDeAn int)asbegininsert into @Listselect a.TENPHG,b.HONV+''+b.TENLOT+''+b.TENNV,(select count(c.MADA) from DEAN c where  c.PHONG =a.MAPHG)from PHONGBAN a inner join NHANVIEN b on a.MAPHG =b.PHG;return;end;select * from [dbo].[FN_ThongTinPhongDeAn](1);--Bài 2--Hiển thị thông tin HoNV,TenNV,TenPHG, DiaDiemPhg./****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [HONV]
      ,[TENNV]
      ,[TENPHG]
      ,[DIADIEM]
  FROM [QLDA].[dbo].[ThonTinNV PHONG]  --Hiển thị thông tin TenNv, Lương, Tuổi  SELECT TOP (1000) [TENNV]
      ,[LUONG]
      ,[Tuoi]
  FROM [QLDA].[dbo].[NHANVIEN LUONG TUOI]  --Hiển thị tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhấtcreate view PhongBanDongNhat
as
select a. TENPHG, 
b. HONV +' '+ b.TENLOT +'' + b.TENNV as 'TenTruongPhong'
 from PHONGBAN a inner join NHANVIEN b on a. TRPHG = b.MANV 
where a .MAPHG in (
select PHG from NHANVIEN
 group by phg
 having count(manv) =
 (select top 1 count(manv) as NVCount from NHANVIEN
group by phg
 order by NVCount desc)
 )

 SELECT TOP (1000) [TENPHG]
      ,[TenTruongPhong]
  FROM [QLDA].[dbo].[PhongBanDongNhat]


