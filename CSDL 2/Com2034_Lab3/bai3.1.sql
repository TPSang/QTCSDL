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



