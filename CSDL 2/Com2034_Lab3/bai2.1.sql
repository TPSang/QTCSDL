--Xuất định dạng “tổng số giờ làm việc” với hàm CEILING
--Xuất định dạng “tổng số giờ làm việc” với hàm FLOOR
--Xuất định dạng “tổng số giờ làm việc” làm tròn tới 2 chữ số thập phân

select a.mada,b.TENDEAN,
sum (thoigian) as 'Tong so gio làm viec',
ceiling( sum (thoigian)) as 'Tong so gio lam viec - ceiling',
floor (sum (thoigian)) as 'Tong so gio làm viec - floor',
round( sum (thoigian),2) as 'Tong so gio làm viec - round'

 from PHANCONG  a inner join DEAN b on a.MADA = b.MADA
 group by a.MADA,b.TENDEAN;
