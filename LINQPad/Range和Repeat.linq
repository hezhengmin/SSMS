<Query Kind="Statements" />

/*
從 2 開始，總數量為 4 的序列
2,3,4,5
4,9,16,25
*/
var squares = Enumerable.Range(2,4).Select(i=>i*i);
squares.Dump();
//重複3次
var repeats = Enumerable.Repeat("Hello World!",3);
repeats.Dump();