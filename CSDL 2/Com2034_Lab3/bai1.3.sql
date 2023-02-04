--Xuất định dạng “tổng số giờ làm việc” kiểu varchar

declare @ThongKe table (MaDa int ,Thoigian float);
insert  into @ThongKe
select MADA,sum(thoigian) as 'Tong Thoi Gian'
from PHANCONG
group by MADA;

select TENDEAN,cast(Thoigian as varchar(15)) as'Tong Thoi Gian'
from @ThongKe a inner join DEAN b on a.MaDa=b.MADA

select TENDEAN,convert( varchar(15),Thoigian) as'Tong Thoi Gian'
from @ThongKe a inner join DEAN b on a.MaDa=b.MADA
