/*
cross join 列出所有組合
76列(Products資料表) * 8列(Categories資料表) = 608 筆
*/
  select C.CategoryID , ProductName
  from Categories C
  cross join Products