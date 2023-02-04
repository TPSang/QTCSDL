--Xuất định dạng “luong trung bình” kiểu decimal với 2 số thập phân, sử dụng dấu
--phẩy để phân biệt phần nguyên và phần thập phân

select PHG,format(CONVERT(decimal(15,2),avg(luong),1),'N','vi-VN')
from NHANVIEN
group by PHG;
