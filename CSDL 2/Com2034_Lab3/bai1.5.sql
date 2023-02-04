--Xuất định dạng “luong trung bình” kiểu varchar. Sử dụng dấu phẩy tách cứ mỗi 3
--chữ số trong chuỗi ra, gợi ý dùng thêm các hàm Left, Replace

select PHG,CONVERT(varchar(50),cast(avg(luong)as money),1)
from NHANVIEN
group by PHG;