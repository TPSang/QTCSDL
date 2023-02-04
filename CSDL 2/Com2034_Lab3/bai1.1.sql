--Sử dụng cơ sở dữ liệu QLDA. Với mỗi câu truy vấn cần thực hiện bằng 2
--cách, dùng cast và convert.

select MA_NVIEN,MADA,STT, cast (THOIGIAN as decimal(5,1)) as 'Thoi Gian' from PHANCONG;

select MA_NVIEN,MADA,STT, convert ( decimal(5,1),THOIGIAN) as 'Thoi Gian' from PHANCONG;