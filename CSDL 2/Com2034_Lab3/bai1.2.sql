--Xuất định dạng “tổng số giờ làm việc” kiểu decimal với 2 số thập phân

declare @ThongKe table (MaDa int ,Thoigian float);
insert  into @ThongKe
select MADA,sum(thoigian) as 'Tong Thoi Gian'
from PHANCONG
group by MADA;

select TENDEAN,cast(Thoigian as decimal(5,2)) as'Tong Thoi Gian'
from @ThongKe a inner join DEAN b on a.MaDa=b.MADA

select TENDEAN,convert( decimal(5,2),Thoigian) as'Tong Thoi Gian'
from @ThongKe a inner join DEAN b on a.MaDa=b.MADA

