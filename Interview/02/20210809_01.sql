--有以下兩個資料表
--order table
-------------------------------------------------
--id	member	 email	                 date
--1	    ada	   ada@gmail.com	         2019-10-10
--2	    zoe	   zoe@travelskope.com	   2019-11-10
--3	    april	 april@travelskope.com   2019-11-20
--4	    zoe	   zoe@travelskope.com	   2019-12-11
--其中 date 的資料型別為 varchar

--orderItem table
------------------------------------
--orderId 	item	   quantity  price
--1	        滑鼠	   1	       200
--1	        鍵盤	   1	       399
--2	        耳機	   1	       599
--2			    螢幕		 2	       4200
--3         surface  1		     49900
--3         繪圖板   1		      4000
--4         顯示卡   1	        5000
--請寫出可獲得以下結果的 SQL：

--1. 以訂單日期排序顯示所有訂單（不需列出訂單的購買項目）
select * 
from [order]
order by cast([date] as date)
--2. 11月所有訂單的總金額
select sum(oi.price) 
from [order] o
join orderItem oi on oi.orderId = o.id  
where month(cast([date] as date))=11
--3. 列出 email 為 *@travelskope.com 的各筆訂單編號、email 與總金額，每筆訂單須分別列出
select oi.orderId,email,price
from [order] o
join orderItem oi on oi.orderId = o.id  
where email like '%@travelskope.com'
