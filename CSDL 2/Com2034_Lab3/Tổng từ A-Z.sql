--1.1 Sử dụng cơ sở dữ liệu QLDA. Với mỗi câu truy vấn cần thực hiện bằng 2
--cách, dùng cast và convert.

select MA_NVIEN,MADA,STT, cast (THOIGIAN as decimal(5,1)) as 'Thoi Gian' from PHANCONG;

select MA_NVIEN,MADA,STT, convert ( decimal(5,1),THOIGIAN) as 'Thoi Gian' from PHANCONG;

--1.2 Xuất định dạng “tổng số giờ làm việc” kiểu decimal với 2 số thập phân

declare @ThongKe table (MaDa int ,Thoigian float);
insert  into @ThongKe
select MADA,sum(thoigian) as 'Tong Thoi Gian'
from PHANCONG
group by MADA;

select TENDEAN,cast(Thoigian as decimal(5,2)) as'Tong Thoi Gian'
from @ThongKe a inner join DEAN b on a.MaDa=b.MADA

select TENDEAN,convert( decimal(5,2),Thoigian) as'Tong Thoi Gian'
from @ThongKe a inner join DEAN b on a.MaDa=b.MADA

--1.3 Xuất định dạng “tổng số giờ làm việc” kiểu varchar

declare @ThongKe table (MaDa int ,Thoigian float);
insert  into @ThongKe
select MADA,sum(thoigian) as 'Tong Thoi Gian'
from PHANCONG
group by MADA;

select TENDEAN,cast(Thoigian as varchar(15)) as'Tong Thoi Gian'
from @ThongKe a inner join DEAN b on a.MaDa=b.MADA

select TENDEAN,convert( varchar(15),Thoigian) as'Tong Thoi Gian'
from @ThongKe a inner join DEAN b on a.MaDa=b.MADA

--1.4 Xuất định dạng “luong trung bình” kiểu decimal với 2 số thập phân, sử dụng dấu
--phẩy để phân biệt phần nguyên và phần thập phân

select PHG,format(CONVERT(decimal(15,2),avg(luong),1),'N','vi-VN')
from NHANVIEN
group by PHG;

--1.5 Xuất định dạng “luong trung bình” kiểu varchar. Sử dụng dấu phẩy tách cứ mỗi 3
--chữ số trong chuỗi ra, gợi ý dùng thêm các hàm Left, Replace

select PHG,CONVERT(varchar(50),cast(avg(luong)as money),1)
from NHANVIEN
group by PHG;

--2.1 Xuất định dạng “tổng số giờ làm việc” với hàm CEILING
--Xuất định dạng “tổng số giờ làm việc” với hàm FLOOR
--Xuất định dạng “tổng số giờ làm việc” làm tròn tới 2 chữ số thập phân

select a.mada,b.TENDEAN,
sum (thoigian) as 'Tong so gio làm viec',
ceiling( sum (thoigian)) as 'Tong so gio lam viec - ceiling',
floor (sum (thoigian)) as 'Tong so gio làm viec - floor',
round( sum (thoigian),2) as 'Tong so gio làm viec - round'

 from PHANCONG  a inner join DEAN b on a.MADA = b.MADA
 group by a.MADA,b.TENDEAN;

--2.2 Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương
--trung bình (làm tròn đến 2 số thập phân) của phòng "Nghiên cứu"

select HONV,TENLOT,TENNV, ROUND(LUONG,2) as 'luong' from NHANVIEN where  luong> ( 
select  ROUND(avg(luong),2)from NHANVIEN
where	PHG in (select MAPHG from PHONGBAN where  TENPHG =N'Nghiên cứu'));

--3.1 Danh sách những nhân viên (HONV, TENLOT, TENNV, DCHI) có trên 2 thân nhân,
--thỏa các yêu cầu
select 
--Dữ liệu cột HONV được viết in hoa toàn bộ
UPPER(HONV),
--Dữ liệu cột TENLOT được viết chữ thường toàn bộ
LOWER(TENLOT),tennv,
--Dữ liệu chột TENNV có ký tự thứ 2 được viết in hoa, các ký tự còn lại viết thường
LOWER(left(TENNV,1))+ UPPER(SUBSTRING(TENNV,2,1))+ LOWER(SUBSTRING(TENNV,3,LEN(tennv))),dchi,
CHARINDEX(' ',DCHI),
CHARINDEX(',',dchi),
--Dữ liệu cột DCHI chỉ hiển thị phần tên đường, không hiển thị các thông tin khác
--như số nhà hay thành phố.
SUBSTRING(dchi,CHARINDEX('',DCHI)+1,CHARINDEX(',',dchi)- CHARINDEX(' ',DCHI)-1)
from NHANVIEN

--3.2 Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất,
--hiển thị thêm một cột thay thế tên trưởng phòng bằng tên “Fpoly”

declare @ThongKe table (MaP int,MaNVTP int, TK int);

insert into @ThongKe
select phg,ma_nql,COUNT(manv) from NHANVIEN group by PHG, MA_NQL;

declare @Max int;
select @Max =max(tk) from @ThongKe;
select TENPHG,HONV+' '+TENLOT+''+TENNV,HONV+''+TENLOT+' Fpoly' from PHONGBAN a inner join(
select * from @ThongKe where  tk =@Max) b on a.MAPHG= b.MaP
inner join NHANVIEN c on c.MANV=b.MaNVTP;


--4.1 Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965
select * from NHANVIEN where DATENAME(year,ngsinh)>=1960 and DATENAME(year,ngsinh)<=1965

--Cho biết tuổi của các nhân viên tính đến thời điểm hiện tại.
select a.*,DATEDIFF(year,ngsinh,getdate()) +1 as Age from NHANVIEN a;

--Dựa vào dữ liệu NGSINH, cho biết nhân viên sinh vào thứ mấy.
select a.*,DATENAME(weekday,ngsinh) from NHANVIEN a;

--4.2 Cho biết số lượng nhân viên, tên trưởng phòng, ngày nhận chức trưởng phòng và ngày
--nhận chức trưởng phòng hiển thi theo định dạng dd-mm-yy (ví dụ 25-04-2019)
select a.TRPHG,
c.HONV+' '+c.TENLOT+' '+c.TENNV,
CONVERT(varchar, a.NG_NHANCHUC,105), b.sl -1
from PHONGBAN a inner join
(select PHG,COUNT(manv) as SL from  NHANVIEN group by PHG) b on a.MAPHG=b.PHG
inner join NHANVIEN c on a.TRPHG=MANV;







