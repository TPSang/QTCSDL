declare @dai float, @rong float, @dientich float, @chuvi float;

set @dai=5;
set @rong = 6;
set @dientich = @dai * @rong;
set @chuvi = (@dai + @rong) *2;

select 'Dien Tich=' +CAST (@dientich as varchar);
select 'Chu Vi=' + CAST(@chuvi as varchar);
